@Tags(["logics"])
@Timeout(Duration(seconds: 30))

import 'package:auto_mafia/db/entities/player.dart';
import 'package:auto_mafia/db/isar_service.dart';
import 'package:auto_mafia/models/role_datasets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';

// Using mockito to keep track of when a provider notify its listeners
// class Listener extends Mock {
//   void call(int? previous, int value);
// }
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

void main() {
  late final IsarService isar;
  // TestWidgetsFlutterBinding.ensureInitialized();
  // runApp(const ProviderScope(child: MainApp()));
  setUpAll(() async {
    await Isar.initializeIsarCore(download: true);
    isar = await createContainer().read(isarServiceProvider.future);
    isar.deleteAllPlayers();
  });

// adding players to db
  test(
    'adding players to db',
    () async {
      // TestWidgetsFlutterBinding.ensureInitialized();
      // arrange
      final players = <Map<String, RoleName>>[
        {'Behzad': RoleName.citizen},
        {'Fateme': RoleName.watson},
        {'Maryam': RoleName.kane},
        {'Morteza': RoleName.godfather},
        {'Mohsen': RoleName.matador},
      ];

      // act
      await isar.initializePlayers(players);

      // await isar.getAllPlayers();
      // for (var player in a) {
      //   print(player.playerToString(true));
      // }
      // assert
      final playerNumber = await isar.alivePlayersCount();

      expect(playerNumber, 5);
    },
    // tags: ["logics"],
    // timeout: Timeout(Duration(seconds: 120)),
  );

// getting all players from db
  test(
    'getting all players from db',
    () async {
      // arrange
      // act
      final List<Player> players = await isar.getAllPlayers();
      for (var player in players) {
        print(player.playerToString(true));
      }
      // assert
      expect(players.length, 5);
    },
    tags: ["logics"],
  );

// deleting all players from db
  test(
    'deleting all players from db',
    () async {
      // arrange
      // act
      isar.deleteAllPlayers();
      // assert
      expect(await isar.alivePlayersCount(), 0);
    },
    tags: ["logics"],
    // skip: true,
  );

  // getting all alive players from db
  test('getting all dead players from db', () async {
    // arrange
    // act
    final List<Player?> players = await isar.deadPlayers();
    if (players.isNotEmpty) {
      for (var player in players) {
        print(player!.playerToString(true));
      }
    }
    // assert
    expect(await isar.deadPlayersCount(), 0);
  });
}
