import 'package:auto_mafia/db/isar_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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

void putMafiaShotChoice({required int night, required String name}) async {
  final isar = await _isar;
  await isar.putNight(night: night, mafiasShot: name);
}

putMatadorChoice({required int night, required String name}) async {
  final isar = await _isar;
  await isar.putNight(night: night, matadorChoice: name);
}

void putGodfatherChoice({
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

void putSaulChoice({required int night, required String name}) async {
  final isar = await _isar;
  await isar.putNight(night: night, saulChoice: name);
}

void putLeonChoice({required int night, required String name}) async {
  final isar = await _isar;
  await isar.putNight(night: night, leonChoice: name);
}

void putKaneChoice({required int night, required String name}) async {
  final isar = await _isar;
  await isar.putNight(night: night, kaneChoice: name);
}

void putWatsonChoice({required int night, required String name}) async {
  final isar = await _isar;
  await isar.putNight(night: night, watsonChoice: name);
}

void putKonstantinChoice({required int night, required String name}) async {
  final isar = await _isar;
  await isar.putNight(night: night, konstantinChoice: name);
}
