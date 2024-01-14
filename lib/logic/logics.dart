import 'dart:developer';

import 'package:auto_mafia/db/isar_service.dart';
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
  if (chosenPlayer!.type == RoleType.mafia) {
    isar.updatePlayer(
      playerName: chosenPlayerName,
      disclosured: true,
      isReversible: false,
      // chosenPlayer.copy(
      //   disclosured: true,
      //   isReversible: false,
      // ),
    );
  }
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
    // chosenPlayer!.copy(
    //   hasBeenSlaughtered: true,
    //   heart: 0,
    // ),
  );
  //
  isar.updatePlayer(
    playerName: godFather!.playerName!,
    shotCount: 1,
  );
}

// matador logic
_matador(String chosenPlayerName) async {
  final isar = await _container.read(isarServiceProvider.future);
  //
  isar.updatePlayer(
    playerName: chosenPlayerName,
    isBlocked: true,
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
godToDay(Map<String, String?> json) async {
  // requirements
  final isar = await _container.read(isarServiceProvider.future);
  final allPlayers = await isar.getAllPlayers();
  final mafiaShot = json["mafiasShot"];
  final godFatherChoice = await isar.getPlayerByName(json["godfatherChoice"]!);
  final leonChoice = await isar.getPlayerByName(json["leonChoice"]!);
  final kaneChoice = await isar.getPlayerByName(json["kaneChoice"]!);
  final konstantinChoice =
      await isar.getPlayerByName(json["konstantinChoice"]!);
  final watsonChoice = await isar.getPlayerByName(json["watsonChoice"]!);
  final matadorChoice = await isar.getPlayerByName(json["matadorChoice"]!);
  final saulChoice = await isar.getPlayerByName(json["saulChoice"]!);
  final nightBlocked = await json["matadorChoice"];
  // print(allPlayers);
  // print('watson = ${allPlayers[roleNames[RoleName.watson]]}');
  // print(
  //     "nightBlocked = $nightBlocked and watson = ${allPlayers[roleNames[RoleName.watson]]}");
  // final bool a = nightBlocked == allPlayers[roleNames[RoleName.watson]];
  // print(a);

  //--
  // final nightSaved = await json["watsonChoice"];
  // ----------------------------------------------------------------------------------

  // matador choice for blocking
  if (matadorChoice != null) await _matador(matadorChoice.playerName!);

  // watson choice for saving

  if (watsonChoice != null &&
      nightBlocked != allPlayers[roleNames[RoleName.watson]])
    await _watson(watsonChoice.playerName!);

  // saul choice for blocking
  if (saulChoice != null) await _saul(saulChoice.playerName!);

  // mafia shot
  if (mafiaShot != null) {
    await _mafiaShoot(
      mafiaShot,
    );
  }

  // godfather choice for slaughter
  if (godFatherChoice != null)
    await _godfatherSlaughter(godFatherChoice.playerName!);

  // leon choice for shooting
  if (leonChoice != null && nightBlocked != allPlayers['leon'])
    await _leon(leonChoice.playerName!);

  // kane choice for guessing
  if (kaneChoice != null) await _kane(kaneChoice.playerName!);

  // konstantin choice for returning
  if (konstantinChoice != null) await _konstantin(konstantinChoice.playerName!);

  // at the end -> update day number
  final bool GameStatusInserted =
      await isar.putGameStatus(dayNumber: await isar.getDayNumber() + 1);
  log('GameStatusInserted: $GameStatusInserted');
}

// godToNight logic
godToNight() async {
  // requirements
  final isar = await _container.read(isarServiceProvider.future);
  // ----------------------------------------------------------------------

  // update night number
  isar.updateNightNumber(await isar.getNightNumber() + 1);
}
