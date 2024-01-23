// face-off
import 'package:auto_mafia/db/entities/player.dart';
import 'package:auto_mafia/db/isar_service.dart';
import 'package:auto_mafia/models/role_datasets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final _container = ProviderContainer();

Future<List<bool>> faceOff(
    String playerWithCardName, String otherPlayerName) async {
  final isar = await _container.read(isarServiceProvider.future);
  final Player playerWithCard =
      (await isar.getPlayerByName(playerWithCardName))!;
  final Player otherPlayer = (await isar.getPlayerByName(otherPlayerName))!;

  // now change their roles with each other

  final newPlayerWithCard = playerWithCard.copy(
    roleName: otherPlayer.roleName,
  );

  final newOtherPlayer = otherPlayer.copy(
    roleName: playerWithCard.roleName,
  );

  return isar.updatePlayers([newPlayerWithCard, newOtherPlayer]);
}

// handcuff
handCuff(String playerName) async {
  final isar = await _container.read(isarServiceProvider.future);
  return isar.updatePlayer(playerName: playerName, handCuffed: true);
}

// silence of sheep
silenceOfSheep(String playerName) async {
  final isar = await _container.read(isarServiceProvider.future);
  return isar.updatePlayer(playerName: playerName, silenced: true);
}

// beautiful mind
// TODO: use this function in the game where you want to kick a player in day by card (vote) **********
Future<bool> beautifulMind(String guessedToBeNostradamous) async {
  final isar = await _container.read(isarServiceProvider.future);
  final realRoleOfGuessed =
      (await isar.getPlayerByName(guessedToBeNostradamous))?.roleName;
  if (realRoleOfGuessed != null)
    return realRoleOfGuessed == roleNames[RoleName.nostradamous];
  return false;
}

// identity reveal
/// return role name of the player
Future<String> identityReveal(String playerName) async {
  final isar = await _container.read(isarServiceProvider.future);
  final player = await isar.getPlayerByName(playerName);
  return player!.roleName!;
}
