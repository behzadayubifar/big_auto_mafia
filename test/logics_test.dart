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

void main() async {
  // TestWidgetsFlutterBinding.ensureInitialized();
  // runApp(const ProviderScope(child: MainApp()));

  test('adding players to db', () async {
    // TestWidgetsFlutterBinding.ensureInitialized();
    await Isar.initializeIsarCore(download: true);
    // arrange
    final isar = await createContainer().read(isarServiceProvider.future);
    final players = <Map<String, RoleName>>[
      {'Behzad': RoleName.citizen},
      {'Fateme': RoleName.watson},
      {'Maryam': RoleName.kane},
      {'Morteza': RoleName.godfather},
      {'Mohsen': RoleName.matador},
    ];

    // act
    isar.deleteAllPlayers();
    // isar.initializePlayers(players);

    // assert
    expect(await isar.alivePlayersCount(), 0);
  });
}
