import 'package:auto_mafia/constants/info_strings.dart';
import 'package:auto_mafia/constants/my_strings.dart';
import 'package:auto_mafia/db/isar_service.dart';
import 'package:auto_mafia/extensions/results_ex.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

final _container = ProviderContainer();

loadGame(BuildContext context) async {
  print('load logics is running...');
  final isar = await _container.read(isarServiceProvider.future);
  final dayNumber = await isar.getDayNumber();
  final situation = await isar
      .retrieveGameStatusN(n: dayNumber)
      .then((status) => status?.situation);
  //
  switch (situation) {
    case MyStrings.dayPage:
      await _container
          .read(currentPlayersProvider.notifier)
          .action(MyStrings.dayPage);
      context.go(
        '/day/$dayNumber',
      );

    case MyStrings.nightPage:
    case MyStrings.leonPage:
    case MyStrings.watsonPage:
    case MyStrings.mafiaPage:
    case MyStrings.citizenPage:
    case MyStrings.saulPage:
    case MyStrings.matadorPage:
    case MyStrings.godfatherPage:
    case MyStrings.konstantinPage:
    case MyStrings.kanePage:
    case MyStrings.predictPage:
      await isar.putGameStatus(
        dayNumber: dayNumber,
        situation: MyStrings.nightPage,
      );
      await _container
          .read(currentPlayersProvider.notifier)
          .action(MyStrings.nightPage);
      context.goNamed(
        'night',
        extra: await Info.night(),
      );

    case MyStrings.nightResultsPage:
      final night = await isar.getNightNumber();

      final info = await isar.retrieveNightResults(night);
      context.goNamed(
        'nights-results',
        extra: info!.toMap(),
      );

    case MyStrings.showRoles:
      await _container
          .read(currentPlayersProvider.notifier)
          .action(MyStrings.showRoles);
      context.goNamed(
        'night',
        extra: Info.showRoles,
      );

    case MyStrings.chaos:
      final alivePlayers = await isar.retrievePlayer();
      context.goNamed(
        'chaos',
        extra: alivePlayers.players,
      );

    case MyStrings.gameOver:
      final winner =
          await isar.retrieveGameStatusN(n: dayNumber).then((status) {
        return status!.winner!;
      });
      final allPlayers = await isar.getAllPlayers();
      context.goNamed(
        'game-over',
        extra: allPlayers,
        pathParameters: {'winner': winner},
      );

    // create for chaos & game over & ALSO *LAST MOVE* chosen -----------------------------------

    default:
      await _container
          .read(currentPlayersProvider.notifier)
          .action(MyStrings.dayPage);
      context.go(
        '/day/$dayNumber',
      );
  }
}
