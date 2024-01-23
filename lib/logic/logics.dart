import 'dart:developer';

import 'package:auto_mafia/db/entities/player.dart';
import 'package:auto_mafia/db/isar_service.dart';
import 'package:auto_mafia/logic/logics_utils.dart';
import 'package:auto_mafia/models/role_datasets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _container = ProviderContainer();
// night logics

// leon logic
_leon(String chosenPlayerName) async {
  final isar = await _container.read(isarServiceProvider.future);
  final chosenPlayer = await isar.getPlayerByName(chosenPlayerName);
  final leon = await isar.getPlayerByRole(RoleName.leon);
  final bool isMafia = chosenPlayer!.type == RoleType.mafia;
  final previousHeart = chosenPlayer.heart!;
  final previousShotCount = leon!.shotCount;
  //
  if (isMafia) {
    await isar.updatePlayer(
        playerName: chosenPlayerName, heart: previousHeart - 1);
    await isar.updatePlayer(
        playerName: leon.playerName!, shotCount: previousShotCount + 1);

    // it's not mafia
  } else {
    isar.updatePlayer(
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

  final bool chosenPlayerISWatson = chosenPlayer == watson;
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
_kane(String chosenPlayerName) async {
  final isar = await _container.read(isarServiceProvider.future);
  final chosenPlayer = await isar.getPlayerByName(chosenPlayerName);
  final kane = await isar.getPlayerByRole(RoleName.kane);
  //
  isar.updatePlayer(playerName: kane!.playerName!, hasGuessed: true);
  //
  if (chosenPlayer!.type == RoleType.mafia)
    isar.updatePlayer(
        playerName: chosenPlayerName, disclosured: true, isReversible: false);
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
  log('mafiaShoot logic is running', name: 'mafia shoot');
  final isar = await _container.read(isarServiceProvider.future);
  final chosenPlayer = await isar.getPlayerByName(chosenPlayerName!);
  final previousHeart = chosenPlayer!.heart!;
  log('${chosenPlayerName}\'s heart was: $previousHeart', name: 'mafia shoot');
  final godFather = await isar.getPlayerByRole(RoleName.godfather);
  //
  if (chosenPlayerName != true && chosenPlayer.isSaved != true) {
    await isar.updatePlayer(
        playerName: chosenPlayerName, heart: (previousHeart - 1));
    final int newHeart = await isar
        .getPlayerByName(chosenPlayerName)
        .then((player) => player!.heart!);
    log('${chosenPlayerName}\'s new heart is: ${newHeart}',
        name: 'mafia shoot');

    await isar.updatePlayer(playerName: godFather!.playerName!, shotCount: 1);
    print("--------------------------------------------------");
    log('godfather\'s shotCount is: ${godFather.shotCount}',
        name: 'mafia shoot');
    log('mafiaShoot logic is finished', name: 'godToDay');
  }
}

// godfatherSlaughter logic
_godfatherSlaughter(String chosenPlayerName) async {
  final isar = await _container.read(isarServiceProvider.future);
  final godFather = await isar.getPlayerByRole(RoleName.godfather);
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
}

// matador logic
_matador(String chosenPlayerName, int toNight) async {
  final isar = await _container.read(isarServiceProvider.future);
  //
  isar.updatePlayer(
    playerName: chosenPlayerName,
    isBlocked: true,
  );

  isar.putNight(
    night: toNight,
    nightOfBlockage: "$toNight",
  );
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
god(Map<String, String?>? json, {bool isGettingDay = true}) async {
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
    final toNightBlocked = await json["matadorChoice"];
    late final int? nightCode;
    late final bool? isGodfathersGuessRight;

    // -------------------------------requirements for showing night results--------------------------------------------------
    if (godFatherChoice != null) {
      isGodfathersGuessRight =
          theRoleGuessedByGodfather == godFatherChoice.roleName;
    }

    // we will use these variables for showing the nocturnal results !!!
    late final String? bornPlayer;
    late final List<String?> killedPlayersOftonight;
    late final String? slaughteredPlayerOfTonight;
    late final String? disclosuredPlayerOfTonight;

    // use sth like this in ui to prevent matador blocking repetedly //TODO
    // final List<String?>? lastNightBlocked = [
    //   json["nightOfBlockage"],
    //   json["matadorChoice"],
    // ];

    // assign new random codes to players
    final Map<String, int> assignedCodes = assignRandomCode(allPlayers.values);

    // now put the generated code in db and handle the exposinf the night code in ui
    for (String player in allPlayers.values) {
      await isar.updatePlayer(
        playerName: player,
        code: assignedCodes[player],
      );
    }
    // matador choice for blocking
    if (matadorChoice != null) {
      await _matador(matadorChoice.playerName!, nightNumber);
      nightCode = assignedCodes[matadorChoice.playerName!];
    }

    // watson choice for saving
    if (watsonChoice != null &&
        toNightBlocked != allPlayers[roleNames[RoleName.watson]])
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
        toNightBlocked != allPlayers[roleNames[RoleName.leon]])
      await _leon(leonChoice.playerName!);

    // kane choice for guessing
    if (kaneChoice != null &&
        toNightBlocked != allPlayers[roleNames[RoleName.kane]])
      await _kane(kaneChoice.playerName!);

    // konstantin choice for returning
    if (konstantinChoice != null &&
        toNightBlocked != allPlayers[roleNames[RoleName.konstantin]])
      await _konstantin(konstantinChoice.playerName!);

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
    );
    log('GameStatusInserted: $GameStatusInserted');

    // it's time to retieve new alive and dead players
    final newDeadPlayers = await isar.retrievePlayer(isAlive: false);
    final newAlivePlayers = await isar.retrievePlayer();

    // checking if anyone came back to life
    if (newAlivePlayers.count > oldAlivePlayers.count) {
      // find new added alive player
      final Player newAddedAlivePlayer = newAlivePlayers.players
          .where((element) => !oldAlivePlayers.players.contains(element))
          .first;
      bornPlayer = newAddedAlivePlayer.playerName;
    }

    // checking if anyone died
    if (newDeadPlayers.count > oldDeadPlayers.count) {
      // find new added dead players
      final List<Player> newAddedDeadPlayers = newDeadPlayers.players
          .where((element) => !oldDeadPlayers.players.contains(element))
          .toList();
      killedPlayersOftonight =
          newAddedDeadPlayers.map((e) => e.playerName).toList(growable: false);
    }

    // checking if anyone was slaughtered
    if (isGodfathersGuessRight == true) {
      slaughteredPlayerOfTonight = godFatherChoice!.playerName;
    }

    // checking if anyone was disclosured
    if (kaneChoice != null && kaneChoice.type == RoleType.mafia) {
      disclosuredPlayerOfTonight = kaneChoice.playerName;
    }

    // now we should check if the game is finished or not

    // TODO: call here the method for showing the night's resukts & use born and killed Player Of tonight & slaughtered player of tonight & also the night code & kane choice if it was right
    // TODO: or even MABEY the VICTORY message
  } else {
    // ______________________----------Day To Night-----------________________________
    // *going to night* -> update players' nightDone to false

    for (String player in allPlayers.values) {
      await isar.updatePlayer(
        playerName: player,
        nightDone: false,
      );
    }
    // update night number and reset all night choices
    final bool newNightInserted = await isar.putNight(
      night: (await isar.getNightNumber()) + 1,
      godfatherChoice: null,
      leonChoice: null,
      kaneChoice: null,
      konstantinChoice: null,
      watsonChoice: null,
      matadorChoice: null,
      saulChoice: null,
      mafiasShot: null,
    );

    // insert new game status
    /* final bool GameStatusInserted = */ await isar.putGameStatus(
      dayNumber: dayNumber + 1,
      isDay: false,
    );

    log('newNightInserted: $newNightInserted');
    //
  }
}