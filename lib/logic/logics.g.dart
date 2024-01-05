// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logics.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$leonHash() => r'ebb451f554038ca85cbfdb4f40566a67f4d3696e';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [leon].
@ProviderFor(leon)
const leonProvider = LeonFamily();

/// See also [leon].
class LeonFamily extends Family<dynamic> {
  /// See also [leon].
  const LeonFamily();

  /// See also [leon].
  LeonProvider call(
    String playerName,
  ) {
    return LeonProvider(
      playerName,
    );
  }

  @override
  LeonProvider getProviderOverride(
    covariant LeonProvider provider,
  ) {
    return call(
      provider.playerName,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'leonProvider';
}

/// See also [leon].
class LeonProvider extends AutoDisposeProvider<dynamic> {
  /// See also [leon].
  LeonProvider(
    String playerName,
  ) : this._internal(
          (ref) => leon(
            ref as LeonRef,
            playerName,
          ),
          from: leonProvider,
          name: r'leonProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product') ? null : _$leonHash,
          dependencies: LeonFamily._dependencies,
          allTransitiveDependencies: LeonFamily._allTransitiveDependencies,
          playerName: playerName,
        );

  LeonProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.playerName,
  }) : super.internal();

  final String playerName;

  @override
  Override overrideWith(
    dynamic Function(LeonRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LeonProvider._internal(
        (ref) => create(ref as LeonRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        playerName: playerName,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<dynamic> createElement() {
    return _LeonProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LeonProvider && other.playerName == playerName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, playerName.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LeonRef on AutoDisposeProviderRef<dynamic> {
  /// The parameter `playerName` of this provider.
  String get playerName;
}

class _LeonProviderElement extends AutoDisposeProviderElement<dynamic>
    with LeonRef {
  _LeonProviderElement(super.provider);

  @override
  String get playerName => (origin as LeonProvider).playerName;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
