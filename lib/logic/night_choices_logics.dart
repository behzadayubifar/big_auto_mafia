import 'package:auto_mafia/db/isar_service.dart';
import 'package:auto_mafia/models/role_datasets.dart';
import 'package:auto_mafia/utils/dev_log.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:auto_mafia/constants/my_strings.dart';

ProviderContainer _createContainer({
  ProviderContainer? parent,
  List<Override> overrides = const [],
  List<ProviderObserver>? observers,
}) {
  // Create a ProviderContainer, and optionally allow specifying parameters.
  final container = ProviderContainer(
    parent: parent,
    overrides: overrides,
    observers: observers,
  );
  return container;
}

final _container = _createContainer();
final Future<IsarService> _isar = _container.read(isarServiceProvider.future);

putMafiaShotChoice({required int night, required String name}) async {
  final isar = await _isar;
  await isar.putNight(night: night, mafiasShot: name);
}

putMatadorChoice({required int night, required String name}) async {
  final isar = await _isar;
  await isar.putNight(night: night, matadorChoice: name);
}

putGodfatherChoice({
  required int night,
  required String name,
  required String guessedRole,
}) async {
  final isar = await _isar;
  await isar.putNight(
    night: night,
    godfatherChoice: name,
    theRoleGuessedByGodfather: guessedRole,
  );
}

putSaulChoice({required int night, required String name}) async {
  final isar = await _isar;
  await isar.putNight(night: night, saulChoice: name);
}

putLeonChoice({required int night, required String name}) async {
  final isar = await _isar;
  await isar.putNight(night: night, leonChoice: name);
}

putKaneChoice({required int night, required String name}) async {
  final isar = await _isar;
  await isar.putNight(night: night, kaneChoice: name);
}

putWatsonChoice({required int night, required String name}) async {
  final isar = await _isar;
  await isar.putNight(night: night, watsonChoice: name);
}

putKonstantinChoice({required int night, required String name}) async {
  final isar = await _isar;
  await isar.putNight(night: night, konstantinChoice: name);
}

buttonLogicExecuter({
  required String currentPlayerName,
  required String currentPlayerRole,
  required int night,
  String? selectedPlayer,
  List<String>? nostradamousChoices,
}) async {
  final isar = await _container.read(isarServiceProvider.future);
  final roleEnum = roleNames.keys.firstWhere(
    (key) => roleNames[key] == currentPlayerRole,
    orElse: () => throw Exception('role not found'),
  );
  // doesn't work when palyer is Citizen becausee it always retruns first Citizen player
  // so we need to change the logic and get the player by its name
  final playerWhoHasDoneHisJob = await isar.getPlayerByName(currentPlayerName);
  await isar.updatePlayer(
    playerName: playerWhoHasDoneHisJob!.playerName!,
    nightDone: true,
  );

  // nostradamous
  if (currentPlayerRole == MyStrings.nostradamous) {
    await isar.putNight(
      night: night,
      nostradamousChoices: nostradamousChoices,
    );
  }

  // others
  if (selectedPlayer != null && selectedPlayer != '')
    switch (currentPlayerRole) {
      case MyStrings.godfather:
        () {
          'here in godfather choice ***************************************************************'
              .log();
          putMafiaShotChoice(
            night: night,
            name: selectedPlayer,
          );
        };
        break;

      case MyStrings.saul:
        'here in saul choice ***************************************************************'
            .log();
        putSaulChoice(
          night: night,
          name: selectedPlayer,
        );
        break;

      case MyStrings.matador:
        putMatadorChoice(
          night: night,
          name: selectedPlayer,
        );
        break;

      case MyStrings.watson:
        'here in watson choice ***************************************************************'
            .log();

        putWatsonChoice(
          night: night,
          name: selectedPlayer,
        );
        break;

      case MyStrings.leon:
        putLeonChoice(
          night: night,
          name: selectedPlayer,
        );
        break;

      case MyStrings.kane:
        putKaneChoice(
          night: night,
          name: selectedPlayer,
        );
        break;

      case MyStrings.konstantin:
        putKonstantinChoice(
          night: night,
          name: selectedPlayer,
        );
        break;

      default:
    }
}
