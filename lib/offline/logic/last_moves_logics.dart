// face-off
import 'package:auto_mafia/offline/db/entities/player.dart';
import 'package:auto_mafia/offline/db/isar_service.dart';
import 'package:auto_mafia/offline/models/role_datasets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final _container = ProviderContainer();

Future<List<Player?>> faceOff({
  required String playerWithCardName,
  required String otherPlayerName,
}) async {
  final isar = await _container.read(isarServiceProvider.future);
  //
  final Player playerWithCard =
      (await isar.getPlayerByName(playerWithCardName))!;
  final Player otherPlayer = (await isar.getPlayerByName(otherPlayerName))!;

  // now change their roles with each other * NOt Correct
  // instead change their [NAMES] with each other

  final newPlayerWithCard = playerWithCard.copy(
    playerName: otherPlayerName,
    // the player doesn't have shield anymore (whatever it was)
    heart: 1,
  );

  // this is actually the dead player
  // the selected player is alive but not its PLAYER Object
  final newOtherPlayer = otherPlayer.copy(
    playerName: playerWithCardName,
    heart: 0,
    isReversible: false,
  );

  return await isar.updatePlayers([newPlayerWithCard, newOtherPlayer]);
}

// handcuff
handCuff({required String playerName}) async {
  final isar = await _container.read(isarServiceProvider.future);
  await isar.updatePlayer(playerName: playerName, handCuffed: true);
}

// silence of sheep
silenceOfSheep({required List<String> playersNames}) async {
  final isar = await _container.read(isarServiceProvider.future);
  for (var playerName in playersNames) {
    await isar.updatePlayer(playerName: playerName, silenced: true);
  }
}

// beautiful mind
// TODO: use this function in the game where you want to kick a player in day by card (vote) **********
Future<bool> beautifulMind({required String guessedToBeNostradamous}) async {
  final isar = await _container.read(isarServiceProvider.future);
  final realRoleOfGuessed =
      (await isar.getPlayerByName(guessedToBeNostradamous))?.roleName;
  return realRoleOfGuessed == roleNames[RoleName.nostradamous];
}

// identity reveal
/// return role name of the player
Future<String> identityReveal({required String playerName}) async {
  final isar = await _container.read(isarServiceProvider.future);
  final player = await isar.getPlayerByName(playerName);
  await isar.updatePlayer(
    playerName: playerName,
    disclosured: true,
    isReversible: false,
  );
  return player!.roleName!;
}
