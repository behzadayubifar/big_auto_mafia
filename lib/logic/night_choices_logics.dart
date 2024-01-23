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

putMafiaShotChoice({required int night, required String name}) async {
  final isar = await _isar;
  await isar.putNight(night: night, mafiasShot: name);
}

putMatadorChoice({required int night, required String name}) async {
  final isar = await _isar;
  await isar.putNight(night: night, matadorChoice: name);
}

putGodfatherChoice({required int night, required String name}) async {
  final isar = await _isar;
  await isar.putNight(night: night, godfatherChoice: name);
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
