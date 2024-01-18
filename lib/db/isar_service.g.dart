// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$isarInstanceHash() => r'fd27ae9f1e009ef58bc7bf0aed5cc808a8a9f345';

/// See also [isarInstance].
@ProviderFor(isarInstance)
final isarInstanceProvider = FutureProvider<Isar>.internal(
  isarInstance,
  name: r'isarInstanceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$isarInstanceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef IsarInstanceRef = FutureProviderRef<Isar>;
String _$isarServiceHash() => r'951f5540f98533154e5d860412d6b41aa948d116';

/// See also [isarService].
@ProviderFor(isarService)
final isarServiceProvider = AutoDisposeFutureProvider<IsarService>.internal(
  isarService,
  name: r'isarServiceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$isarServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef IsarServiceRef = AutoDisposeFutureProviderRef<IsarService>;
String _$alivePlayersHash() => r'4a2fdae36cc7673cf1ecd48e6e393788ce4481fd';

/// See also [alivePlayers].
@ProviderFor(alivePlayers)
final alivePlayersProvider =
    AutoDisposeFutureProvider<({int count, List<Player> players})>.internal(
  alivePlayers,
  name: r'alivePlayersProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$alivePlayersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AlivePlayersRef
    = AutoDisposeFutureProviderRef<({int count, List<Player> players})>;
String _$deadPlayersHash() => r'f6ebce85d4c01bc86394f86b20ddbe00cd286aee';

/// See also [deadPlayers].
@ProviderFor(deadPlayers)
final deadPlayersProvider =
    AutoDisposeFutureProvider<({int count, List<Player> players})>.internal(
  deadPlayers,
  name: r'deadPlayersProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$deadPlayersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DeadPlayersRef
    = AutoDisposeFutureProviderRef<({int count, List<Player> players})>;
String _$nightJsonHash() => r'7a56c307b362bb103fdb4bd37831b2d6c9bf1ed3';

/// See also [nightJson].
@ProviderFor(nightJson)
final nightJsonProvider =
    AutoDisposeFutureProvider<Either<Map<String, String>, bool>>.internal(
  nightJson,
  name: r'nightJsonProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$nightJsonHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef NightJsonRef
    = AutoDisposeFutureProviderRef<Either<Map<String, String>, bool>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
