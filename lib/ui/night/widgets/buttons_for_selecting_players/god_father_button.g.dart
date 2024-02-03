// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'god_father_button.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$godfatherChoiseControllerHash() =>
    r'2139bfc30e5fe44a4aff2086e7d7ec43eb05f6ab';

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

abstract class _$GodfatherChoiseController
    extends BuildlessAutoDisposeAsyncNotifier<void> {
  late final dynamic playerName;

  FutureOr<void> build(
    dynamic playerName,
  );
}

/// See also [GodfatherChoiseController].
@ProviderFor(GodfatherChoiseController)
const godfatherChoiseControllerProvider = GodfatherChoiseControllerFamily();

/// See also [GodfatherChoiseController].
class GodfatherChoiseControllerFamily extends Family<AsyncValue<void>> {
  /// See also [GodfatherChoiseController].
  const GodfatherChoiseControllerFamily();

  /// See also [GodfatherChoiseController].
  GodfatherChoiseControllerProvider call(
    dynamic playerName,
  ) {
    return GodfatherChoiseControllerProvider(
      playerName,
    );
  }

  @override
  GodfatherChoiseControllerProvider getProviderOverride(
    covariant GodfatherChoiseControllerProvider provider,
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
  String? get name => r'godfatherChoiseControllerProvider';
}

/// See also [GodfatherChoiseController].
class GodfatherChoiseControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<GodfatherChoiseController,
        void> {
  /// See also [GodfatherChoiseController].
  GodfatherChoiseControllerProvider(
    dynamic playerName,
  ) : this._internal(
          () => GodfatherChoiseController()..playerName = playerName,
          from: godfatherChoiseControllerProvider,
          name: r'godfatherChoiseControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$godfatherChoiseControllerHash,
          dependencies: GodfatherChoiseControllerFamily._dependencies,
          allTransitiveDependencies:
              GodfatherChoiseControllerFamily._allTransitiveDependencies,
          playerName: playerName,
        );

  GodfatherChoiseControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.playerName,
  }) : super.internal();

  final dynamic playerName;

  @override
  FutureOr<void> runNotifierBuild(
    covariant GodfatherChoiseController notifier,
  ) {
    return notifier.build(
      playerName,
    );
  }

  @override
  Override overrideWith(GodfatherChoiseController Function() create) {
    return ProviderOverride(
      origin: this,
      override: GodfatherChoiseControllerProvider._internal(
        () => create()..playerName = playerName,
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
  AutoDisposeAsyncNotifierProviderElement<GodfatherChoiseController, void>
      createElement() {
    return _GodfatherChoiseControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GodfatherChoiseControllerProvider &&
        other.playerName == playerName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, playerName.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GodfatherChoiseControllerRef
    on AutoDisposeAsyncNotifierProviderRef<void> {
  /// The parameter `playerName` of this provider.
  dynamic get playerName;
}

class _GodfatherChoiseControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<GodfatherChoiseController,
        void> with GodfatherChoiseControllerRef {
  _GodfatherChoiseControllerProviderElement(super.provider);

  @override
  dynamic get playerName =>
      (origin as GodfatherChoiseControllerProvider).playerName;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
