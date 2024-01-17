import 'dart:developer';

import 'package:auto_mafia/db/isar_service.dart';
import 'package:auto_mafia/logic/logics.dart';
import 'package:auto_mafia/models/role_datasets.dart';
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

  setUpAll(() async {
    await Isar.initializeIsarCore(download: true);
    isar = await _container.read(isarServiceProvider.future);
    log('isar is initialized');

    final isCleared = await isar.clearAll();
    log('isCleared: $isCleared');
  });

  tearDownAll(() => isar.close());

// adding 11 players to db
  test(
    'adding 11 players to db',
    () async {
      // TestWidgetsFlutterBinding.ensureInitialized();
      // arrange
      final players = <Map<String, String>>[
        {'Behzad': 'leon'},
        {'Fateme': 'watson'},
        {'Maryam': 'kane'},
        {'Morteza': 'godfather'},
        {'Mohsen': 'matador'},
        {'Sara': 'saul'},
        {'Sajad': 'konstantin'},
        {'Sina': 'nostradamous'},
        {'Saeed': 'citizen'},
        {'Saman': 'citizen'},
        {'Sahar': 'citizen'},
      ];

      // act
      await isar.initializePlayers(players);

      // assert
      final alivePlayersCount = await isar.retrievePlayer();
      expect(alivePlayersCount.count, 11);
    },
  );

  // night 0
  group("night 0", () {
    test('mafia shoots watson', () async {
      // arrange
      final watson = await isar.getPlayerByName('Fateme');
      final leon = await isar.getPlayerByName('Behzad');
      final godfather = await isar.getPlayerByName('Morteza');

      late final alivePlayers;
      late final deadPlayers;

      final toNight = await isar.getNightNumber();
      log('toNight: $toNight');

      // act 1 : mafia shot watson
      final isMafiaShotInserted =
          await isar.putNight(night: toNight, mafiasShot: watson!.playerName);
      log('isMafiaShotInserted: $isMafiaShotInserted');

      // act 2 : watson saved herself
      final isWatsonChoiceInserted =
          await isar.putNight(night: toNight, watsonChoice: watson.playerName);
      log('isWatsonChoiceInserted: $isWatsonChoiceInserted');
      print('watson: ${watson.playerName}');

      // act 2 : matador blocked watson
      await isar.putNight(night: toNight, matadorChoice: watson.playerName);

      // act 3 : leon shot matador -> matador must be dead
      await isar.putNight(night: toNight, leonChoice: leon!.playerName);

      // act 4 : kane guessed godfather -> godfather must be disclosured
      await isar.putNight(night: toNight, kaneChoice: godfather!.playerName);

      // finally => god to day
      final json = await (isar.retrieveNightN(n: toNight))
          .then((json) => json.match((json) => json, (_) => null));
      log('json: $json');
      await godToDay(json!);

      // assert

      // late final int watsonHeart;
      final int watsonHeart = await isar
          .getPlayerByRole(RoleName.watson)
          .then((watson) => watson!.heart!);
      expect(toNight, 0);

      // expect watson's Heart
      expect(watsonHeart, 0);

      // alive Players Count
      // matador and watson must be dead
      alivePlayers = await isar.retrievePlayer();
      print('alivePlayersList: ${alivePlayers.players}');
      expect(alivePlayers.count, 9);

      // dead Players Count
      deadPlayers = await isar.retrievePlayer(isAlive: false);
      print('deadPlayersList: ${deadPlayers.players}');
      expect(deadPlayers.count, 2);
    });
  });
}
