import 'dart:developer';

import 'package:auto_mafia/constants/my_strings.dart';
import 'package:auto_mafia/db/entities/player.dart';
import 'package:auto_mafia/db/isar_service.dart';
import 'package:auto_mafia/logic/logics_utils.dart';
import 'package:auto_mafia/models/role_datasets.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:go_router/go_router.dart';

final _container = ProviderContainer();
// night logics

// leon logic
_leon(String chosenPlayerName) async {
  final isar = await _container.read(isarServiceProvider.future);
  final chosenPlayer = await isar.getPlayerByName(chosenPlayerName);
  final leon = await isar.getPlayerByRole(RoleName.leon);
  final bool isMafia = chosenPlayer!.type == RoleType.mafia;
  final isSaved = chosenPlayer.isSaved!;
  final previousHeart = chosenPlayer.heart!;
  final previousShotCount = leon!.shotCount;
  //
  if (isMafia) {
    await isar.updatePlayer(
        playerName: leon.playerName!, shotCount: previousShotCount + 1);
    if (!isSaved) {
      await isar.updatePlayer(
          playerName: chosenPlayerName, heart: previousHeart - 1);
    }

    // it's not mafia
  } else {
    await isar.updatePlayer(
      playerName: leon.playerName!,
      shotCount: previousShotCount + 1,
      heart: 0,
    );
  }
}

// watson logic
_watson(String chosenPlayerName) async {
  final isar = await _container.read(isarServiceProvider.future);
  final chosenPlayer = await isar.getPlayerByName(chosenPlayerName);
  final watson = await isar.getPlayerByRole(RoleName.watson);

  final chosenPlayerISWatson = chosenPlayer?.playerName == watson?.playerName;
  if (chosenPlayerISWatson) {
    //TODO: handle this also in ui later so he cannot even tap on his name in ui at the firt place !!!
    isar.updatePlayer(
        playerName: chosenPlayerName,
        isSaved: chosenPlayer!.isSavedOnce ? false : true,
        isSavedOnce: true);
  } else {
    isar.updatePlayer(
      playerName: chosenPlayerName,
      isSaved: true,
    );
  }
}

// kane logic
_kane(String chosenPlayerName, int night) async {
  final isar = await _container.read(isarServiceProvider.future);
  final chosenPlayer = await isar.getPlayerByName(chosenPlayerName);
  final kane = await isar.getPlayerByRole(RoleName.kane);
  //
  isar.updatePlayer(
    playerName: kane!.playerName!,
    hasGuessed: true,
  );
  //
  if (chosenPlayer!.type == RoleType.mafia) {
    isar.updatePlayer(
        playerName: chosenPlayerName, disclosured: true, isReversible: false);
    await isar.putNight(nightOfRightChoiceOfKane: '$night', night: night);
  }
  //
}

// konstantin logic
_konstantin(String chosenPlayerName) async {
  final isar = await _container.read(isarServiceProvider.future);
  final konstantin = await isar.getPlayerByRole(RoleName.konstantin);
  //
  isar.updatePlayer(
    playerName: konstantin!.playerName!,
    hasReturned: true,
  );
  //
  isar.updatePlayer(
    playerName: chosenPlayerName,
    heart: 1,
    isReversible: false,
  );
}

// mafiaShoot logic
_mafiaShoot(
  String? chosenPlayerName,
) async {
  print("--------------------------------------------------");
  final isar = await _container.read(isarServiceProvider.future);
  final chosenPlayer = await isar.getPlayerByName(chosenPlayerName!);
  final previousHeart = chosenPlayer?.heart!;
  final godFather = await isar.getPlayerByRole(RoleName.godfather);
  final day = await isar.getDayNumber();
  //
  if (chosenPlayer != null &&
      chosenPlayer.roleName != roleNames[RoleName.nostradamous] &&
      chosenPlayer.isSaved != true) {
    await isar.updatePlayer(
        playerName: chosenPlayerName, heart: (previousHeart! - 1));
    final int newHeart = await isar
        .getPlayerByName(chosenPlayerName)
        .then((player) => player!.heart!);
    log('${chosenPlayerName}\'s new heart is: ${newHeart}',
        name: 'mafia shoot');

    isar.updatePlayer(playerName: godFather!.playerName!, shotCount: 1);
    isar.putGameStatus(dayNumber: day, remainedMafiasBullets: 0);
    print("--------------------------------------------------");
    log('godfather\'s shotCount is: ${godFather.shotCount}',
        name: 'mafia shoot');
  }
}

// godfatherSlaughter logic
_godfatherSlaughter(String chosenPlayerName) async {
  final isar = await _container.read(isarServiceProvider.future);
  final godFather = await isar.getPlayerByRole(RoleName.godfather);
  final day = await isar.getDayNumber();
  //
  isar.updatePlayer(
    playerName: chosenPlayerName,
    hasBeenSlaughtered: true,
    heart: 0,
  );
  //
  isar.updatePlayer(
    playerName: godFather!.playerName!,
    shotCount: 1,
  );
  //
  isar.putGameStatus(dayNumber: day, remainedMafiasBullets: 0);
}

// matador logic
_matador(String chosenPlayerName, int toNight) async {
  final isar = await _container.read(isarServiceProvider.future);
  //
  isar.updatePlayer(
    playerName: chosenPlayerName,
    isBlocked: true,
  );

  // isar.putNight(
  //   night: toNight,
  //   nightOfBlockage: "$toNight",
  // );
  //
}

//TODO: handle when saul can do his job in ui & night must be restarted (in fact, in at the begining of godToDay or even before it !!!)
// saul logic
_saul(String chosenPlayerName) async {
  final isar = await _container.read(isarServiceProvider.future);
  final saul = await isar.getPlayerByRole(RoleName.saul);

  isar.updatePlayer(
    playerName: chosenPlayerName,
    side: RoleType.mafia,
  );

  //
  isar.updatePlayer(
    playerName: saul!.playerName!,
    hasBuyed: true,
  );
}

//TODO: handle when saul can do his job in ui & night must be restarted (in fact, in at the begining of godToDay or even before it !!!)
/// godToDay logic
/// """the core brain of decisions""";
/// --> returns a [Future<Map<String, dynamic>?>] for showing the results of the night
Future<Map<String, dynamic>?> god(
    {Map<String, String?>? json, bool isGettingDay = true}) async {
  // requirements
  final isar = await _container.read(isarServiceProvider.future);
  // ----------------------------------------------------------------------
  final int dayNumber = await isar.getDayNumber();
  final int nightNumber = await isar.getNightNumber();
  // ----------------------------------------------------------------------
  final allPlayers = await isar.playersRolesMap();
  // ----------------------------------------------------------------------
  final oldDeadPlayers = await isar.retrievePlayer(isAlive: false);
  final oldAlivePlayers = await isar.retrievePlayer();

  // TODO: handle the `handcuffed` players in ui & show them the specific page
  // TODO: handle the `slaughter` and `shot` for godfather and mafia in ui to do only one of them at one night

  if (isGettingDay && json != null) {
    // ______________________----------Night To Day-----------________________________

    final mafiaShot = json["mafiasShot"];
    final godFatherChoice =
        await isar.getPlayerByName(json["godfatherChoice"]!);
    final theRoleGuessedByGodfather = json["theRoleGuessedByGodfather"];
    final leonChoice = await isar.getPlayerByName(json["leonChoice"]!);
    final kaneChoice = await isar.getPlayerByName(json["kaneChoice"]!);
    final konstantinChoice =
        await isar.getPlayerByName(json["konstantinChoice"]!);
    final watsonChoice = await isar.getPlayerByName(json["watsonChoice"]!);
    final matadorChoice = await isar.getPlayerByName(json["matadorChoice"]!);
    final saulChoice = await isar.getPlayerByName(json["saulChoice"]!);
    final matadaorChoice = await json["matadorChoice"];
    final nightOfBlockage = json["nightOfBlockage"];
    final isSomeoneBlockedTonight = nightOfBlockage == nightNumber.toString();
    final nightOfRightChoiceOfKane = json["nightOfRightChoiceOfKane"];

    String? toNightBlocked() => isSomeoneBlockedTonight ? matadaorChoice : null;
    int? nightCode = 503;
    bool? isGodfathersGuessRight = false;
    String? winner = '';

    // we will use these variables for showing the nocturnal results !!!
    String? bornPlayer = '';
    List<String?> killedPlayersOftonight = [];
    String? slaughteredPlayerOfTonight = '';
    String? disclosuredPlayerOfTonight = '';

    // -------------------------------requirements for showing night results--------------------------------------------------
    if (godFatherChoice != null) {
      isGodfathersGuessRight =
          theRoleGuessedByGodfather == godFatherChoice.roleName;

      // checking if anyone was slaughtered
      if (isGodfathersGuessRight) {
        slaughteredPlayerOfTonight = godFatherChoice.playerName;
      }
    }

    // use sth like this in ui to prevent matador blocking repetedly //TODO
    // final List<String?>? lastNightBlocked = [
    //   json["nightOfBlockage"],
    //   json["matadorChoice"],
    // ];

// retrieving previous assigned codes
    final Map<String, int> assignedCodes = await isar.retrieveAssignedCodes();

    // matador choice for blocking
    if (isSomeoneBlockedTonight) {
      await _matador(matadorChoice!.playerName!, nightNumber);
      nightCode = assignedCodes[matadorChoice.playerName!];
    } else {
      // get a random int number between 1 & 20 which is not in the assigned codes
      do {
        nightCode = randomInt(1, 20).run();
      } while (assignedCodes.containsValue(nightCode));
    }

    // watson choice for saving
    if (watsonChoice != null &&
        toNightBlocked() != allPlayers[roleNames[RoleName.watson]])
      await _watson(watsonChoice.playerName!);

    // saul choice for blocking
    if (saulChoice != null) await _saul(saulChoice.playerName!);

    // mafia shot
    if (mafiaShot != null) await _mafiaShoot(mafiaShot);

    // godfather choice for slaughter
    if (godFatherChoice != null)
      await _godfatherSlaughter(godFatherChoice.playerName!);

    // leon choice for shooting
    if (leonChoice != null &&
        toNightBlocked() != allPlayers[roleNames[RoleName.leon]])
      await _leon(leonChoice.playerName!);

    // konstantin choice for returning
    if (konstantinChoice != null &&
        toNightBlocked() != allPlayers[roleNames[RoleName.konstantin]]) {
      await _konstantin(konstantinChoice.playerName!);
      bornPlayer = konstantinChoice.playerName;
    }

// _______________________________ RESULTS OF THE NIGHT _____________________________________

    // it's time to retieve new alive and dead players
    final newDeadPlayers = await isar.retrievePlayer(
      isAlive: false,
      criteria: (player) =>
          !oldDeadPlayers.players.mapToNames().contains(player.playerName),
    );
    // final newAlivePlayers = await isar.retrievePlayer();

    // kane choice for guessing
    final isKaneStillAlive = await isar
        .getPlayerByRole(RoleName.kane)
        .then((player) => player!.heart! > 0);

    if (kaneChoice != null &&
        isKaneStillAlive &&
        toNightBlocked() != allPlayers[roleNames[RoleName.kane]] &&
        !newDeadPlayers.players.mapToNames().contains(kaneChoice.playerName))
      await _kane(kaneChoice.playerName!, nightNumber);

    // check if kane choice was right *last night* -> he/she must be dead
    final wasKaneChoiceRightLastNight =
        await isar.retrieveNightN(n: nightNumber - 1).then((json) => json.match(
              (json) => json['nightOfRightChoiceOfKane'] == true,
              (_) => false,
            ));

    if (wasKaneChoiceRightLastNight)
      await isar.updatePlayer(
        playerName: allPlayers[roleNames[RoleName.kane]]!,
        heart: 0,
      );

    final newAndOldDeadPlayersDiff = newDeadPlayers.players
        .mapToNames()
        .where((playerName) =>
            !oldDeadPlayers.players.mapToNames().contains(playerName))
        .toList();

    // checking if anyone died
    if (newAndOldDeadPlayersDiff.isNotEmpty) {
      killedPlayersOftonight = newAndOldDeadPlayersDiff;
    }

    final List<String> allDeadPlayers =
        (newDeadPlayers.players + oldDeadPlayers.players)
            .where((element) => element.playerName != bornPlayer)
            .mapToNames()
            .toSet()
            .toList();

// !TODO: if kane's choice has been killed tonight, don't do this
    // checking if anyone was disclosured
    if (kaneChoice != null && kaneChoice.type == RoleType.mafia) {
      disclosuredPlayerOfTonight = kaneChoice.playerName;
    }

    final remainedChancesForNightEnquiry = await isar
        .retrieveGameStatusN(n: dayNumber)
        .then((status) => status!.remainedChancesForNightEnquiry);

    // TODO: show the results of the night (RESULT WIDGET)
    final info = {
      'tonight': nightNumber,
      'bornPlayer': bornPlayer,
      'disclosured': disclosuredPlayerOfTonight,
      'slaughtered': slaughteredPlayerOfTonight,
      'tonightDeads': newDeadPlayers.players
          .toSet()
          .where((element) => slaughteredPlayerOfTonight != element.playerName)
          .mapToNames(),
      'nightCode': nightCode,
      'allDeadPlayers': allDeadPlayers,
      'remainedChancesForNightEnquiry': remainedChancesForNightEnquiry,
    };

    // update players to be ready for new day
    for (String player in allPlayers.values) {
      await isar.updatePlayer(
        playerName: player,
        nightDone: false,
        handCuffed: false,
        isSaved: false,
        hasBeenSlaughtered: false,
        isBlocked: false,
      );
    }

    // at the end -> update day number and probably the new code
    final bool GameStatusInserted = await isar.putGameStatus(
      dayNumber: dayNumber + 1,
      isDay: true,
      nightCode: nightCode,
      situation: MyStrings.nightResultsPage,
    );
    log('GameStatusInserted: $GameStatusInserted');

    // await _container
    //     .read(currentPlayersProvider.notifier)
    //     .action(MyStrings.dayPage);
    return info;
    // context.goNamed('nights-results', extra: info);

    // TODO: call here the method for showing the night's resukts & use born and killed Player Of tonight & slaughtered player of tonight & also the night code & kane choice if it was right
    // TODO: or even MABEY the VICTORY message
  }
  // GO TO NEXT NIGHT
  else {
    //-----------------------------------------------------
    //-------------------------------------------------------------------
    //--------------------------------------------------------------------------------
    // ______________________----------Day To Night-----------________________________
    // *going to night* -> update players' nightDone to false

    final bool newNightInserted = await isar.putNight(
      night: nightNumber + 1,
      /*    godfatherChoice: null,
      leonChoice: null,
      kaneChoice: null,
      konstantinChoice: null,
      watsonChoice: null,
      theRoleGuessedByGodfather: null,
      saulChoice: null,
      mafiasShot: null, */
    );
    log('newNightInserted: $newNightInserted');

    // insert new game status
    /* final bool GameStatusInserted = */ await isar.putGameStatus(
      dayNumber: dayNumber,
      isDay: false,
      remainedMafiasBullets: 1,
      situation: MyStrings.nightPage,
    );

    final allPlayers = await isar
        .retrievePlayer()
        .then((record) => record.players.mapToNames());

    // assign new random codes to players
    final Map<String, int> newAssignedCodes = assignRandomCode(allPlayers);

    // now put the generated code in db and handle the exposinf the night code in ui
    for (String player in allPlayers) {
      await isar.updatePlayer(
        playerName: player,
        nightDone: false,
        code: newAssignedCodes[player],
      );
    }

    await _container
        .read(currentPlayersProvider.notifier)
        .action(MyStrings.nightPage);

    //
    // TODO: show the results of the day (RESULT WIDGET)
  }
}
