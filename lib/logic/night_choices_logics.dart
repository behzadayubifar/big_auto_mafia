import 'package:auto_mafia/constants/info_strings.dart';
import 'package:auto_mafia/db/entities/game_status.dart';
import 'package:auto_mafia/db/isar_service.dart';
import 'package:auto_mafia/logic/logics_utils.dart';
import 'package:auto_mafia/models/role_datasets.dart';
import 'package:auto_mafia/ui/statements/statement_overlay_screen.dart';
import 'package:auto_mafia/utils/dev_log.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

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

// a method for executing the logic of the buttons in the night page

Future<bool?> buttonLogicExecuter({
  required String currentPlayerName,
  required String currentPlayerRole,
  required int night,
  String? selectedPlayer,
  List<String>? nostradamousChoices,
  String? shootOrSlaughter,
  String? guessedRole,
  String? mafiaShotInabsenceOfGodfather,
  BuildContext? context,
}) async {
  final isar = await _container.read(isarServiceProvider.future);
  await isar.putGameStatus(dayNumber: night, situation: MyStrings.nightPage);
  final roleEnum = roleNames.keys.firstWhere(
    (key) => roleNames[key] == currentPlayerRole,
    orElse: () => throw Exception('role not found'),
  );
  // doesn't work when palyer is Citizen becausee it always retruns first Citizen player
  // so we need to change the logic and get the player by its name
  final playerWhoHasDoneHisJob = await isar.getPlayerByName(currentPlayerName);
  // here in
  await isar.updatePlayer(
    playerName: playerWhoHasDoneHisJob!.playerName!,
    nightDone: true,
  );

  // nostradamous
  if (currentPlayerRole == MyStrings.nostradamous &&
      night == 0 &&
      nostradamousChoices != null &&
      nostradamousChoices.isNotEmpty) {
    await isar.putNight(
      night: night,
      nostradamousChoices: nostradamousChoices,
    );

    final resultOfPrediction = await determineMafiaAndCitizenCountFromList(
      playerNames: nostradamousChoices,
      isGodfatherCountedForMafia: false,
    );

    final statementInstance = StatementScreen.instance();

    // show the result of the prediction
    statementInstance.show(
      context: context!,
      title: MyStrings.resultOfPrediction,
      callback: () async {
        statementInstance.hide();
        // context.pop();
        print(nostradamousChoices);
        // below must be after the buttonLogicExecuter (certainly!!!)
        await _container
            .read(currentPlayersProvider.notifier)
            .action(MyStrings.nightPage);

        context.goNamed(
          'night',
          extra: await Info.night(),
        );
      },
      mafia: resultOfPrediction.mafiaPlayersCount,
      citizen: resultOfPrediction.citizen,
    );
  }

  // others
  if (mafiaShotInabsenceOfGodfather != null &&
      mafiaShotInabsenceOfGodfather != '') {
    await putMafiaShotChoice(
      night: night,
      name: mafiaShotInabsenceOfGodfather,
    );
    //
    await isar.putGameStatus(dayNumber: night, remainedMafiasBullets: 0);
  }

  if (selectedPlayer != null && selectedPlayer != '')
    switch (currentPlayerRole) {
      case MyStrings.godfather:
        shootOrSlaughter == 'shoot'
            ? await putMafiaShotChoice(
                night: night,
                name: selectedPlayer,
              )
            : await putGodfatherChoice(
                night: night,
                name: selectedPlayer,
                guessedRole: guessedRole!,
              );
        break;

      case MyStrings.saul:
        print('saul\'s choice is put');
        await putSaulChoice(
          night: night,
          name: selectedPlayer,
        );
        break;

      case MyStrings.matador:
        print('matador\s choice is put');
        await putMatadorChoice(
          night: night,
          name: selectedPlayer,
        );
        await isar.putNight(
          night: night,
          nightOfBlockage: "$night",
        );
        break;

      case MyStrings.watson:
        await putWatsonChoice(
          night: night,
          name: selectedPlayer,
        );
        break;

      case MyStrings.leon:
        await putLeonChoice(
          night: night,
          name: selectedPlayer,
        );
        break;

      case MyStrings.kane:
        await putKaneChoice(
          night: night,
          name: selectedPlayer,
        );
        break;

      case MyStrings.konstantin:
        await putKonstantinChoice(
          night: night,
          name: selectedPlayer,
        );
        break;

      default:
    }
}
