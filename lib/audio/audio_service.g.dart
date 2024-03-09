// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$playerHash() => r'e53efc196161de02b6b2e576bea8529d4be11c31';

/// See also [player].
@ProviderFor(player)
final playerProvider = AutoDisposeProvider<AudioPlayer>.internal(
  player,
  name: r'playerProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$playerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PlayerRef = AutoDisposeProviderRef<AudioPlayer>;
String _$audioServiceHash() => r'd2b3453e9d8f46d15ae2c0c04af1d4c22e10a50b';

/// See also [AudioService].
@ProviderFor(AudioService)
final audioServiceProvider =
    AutoDisposeAsyncNotifierProvider<AudioService, void>.internal(
  AudioService.new,
  name: r'audioServiceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$audioServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AudioService = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
