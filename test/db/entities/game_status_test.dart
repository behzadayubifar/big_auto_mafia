import 'dart:developer' show log;

import 'package:auto_mafia/db/entities/game_status.dart';
import 'package:auto_mafia/db/isar_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';

ProviderContainer createContainer({
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

  // When the test ends, dispose the container.
  addTearDown(container.dispose);

  return container;
}

final _container = createContainer();

void main() {
  late final IsarService isar;
  late GameStatus? gameStatus0;
  late GameStatus? gameStatus1;
  late GameStatus? gameStatus2;

  late final expectedGameStatus0;
  late final expectedGameStatus1;
  late final expectedGameStatus2;

  setUpAll(() async {
    await Isar.initializeIsarCore(download: true);
    isar = await _container.read(isarServiceProvider.future);
    log('isar is initialized');

    final isCleared = await isar.clearAll();
    log('isCleared: $isCleared');
  });

  tearDownAll(() => isar.close());
  test('insert new game status', () async {
    int dayNumber = (await isar.getDayNumber());

    final a = await isar.putGameStatus(
        dayNumber: dayNumber, isDay: true, isChaos: true);

    print('a is $a');

    gameStatus0 = await isar.retrieveGameStatusN(
      n: dayNumber,
    );

    expectedGameStatus0 = GameStatus()
      ..isDay = true
      ..dayNumber = dayNumber
      ..isChaos = true;

    // ________________________________________________________________

    await isar.putGameStatus(
      dayNumber: dayNumber + 1,
      isDay: true,
    );

    expectedGameStatus1 = GameStatus()
      ..isDay = true
      ..dayNumber = dayNumber + 1;

    gameStatus1 = await isar.retrieveGameStatusN(n: dayNumber + 1);

    // ________________________________________________________________

    await isar.putGameStatus(dayNumber: dayNumber + 2, isDay: true);

    expectedGameStatus2 = GameStatus()
      ..isDay = true
      ..dayNumber = dayNumber + 2;

    gameStatus2 = await isar.retrieveGameStatusN(n: dayNumber + 2);

    expect(gameStatus0, expectedGameStatus0);
    expect(gameStatus1, expectedGameStatus1);
    expect(gameStatus2, expectedGameStatus2);
  });
}
