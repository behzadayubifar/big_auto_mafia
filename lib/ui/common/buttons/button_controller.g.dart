// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'button_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$myButtonControllerHash() =>
    r'd6bb7acf94e5efe44d9a2b5cc285800818186106';

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

abstract class _$MyButtonController
    extends BuildlessAutoDisposeNotifier<String> {
  late final String status;

  String build(
    String status,
  );
}

/// See also [MyButtonController].
@ProviderFor(MyButtonController)
const myButtonControllerProvider = MyButtonControllerFamily();

/// See also [MyButtonController].
class MyButtonControllerFamily extends Family<String> {
  /// See also [MyButtonController].
  const MyButtonControllerFamily();

  /// See also [MyButtonController].
  MyButtonControllerProvider call(
    String status,
  ) {
    return MyButtonControllerProvider(
      status,
    );
  }

  @override
  MyButtonControllerProvider getProviderOverride(
    covariant MyButtonControllerProvider provider,
  ) {
    return call(
      provider.status,
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
  String? get name => r'myButtonControllerProvider';
}

/// See also [MyButtonController].
class MyButtonControllerProvider
    extends AutoDisposeNotifierProviderImpl<MyButtonController, String> {
  /// See also [MyButtonController].
  MyButtonControllerProvider(
    String status,
  ) : this._internal(
          () => MyButtonController()..status = status,
          from: myButtonControllerProvider,
          name: r'myButtonControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$myButtonControllerHash,
          dependencies: MyButtonControllerFamily._dependencies,
          allTransitiveDependencies:
              MyButtonControllerFamily._allTransitiveDependencies,
          status: status,
        );

  MyButtonControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.status,
  }) : super.internal();

  final String status;

  @override
  String runNotifierBuild(
    covariant MyButtonController notifier,
  ) {
    return notifier.build(
      status,
    );
  }

  @override
  Override overrideWith(MyButtonController Function() create) {
    return ProviderOverride(
      origin: this,
      override: MyButtonControllerProvider._internal(
        () => create()..status = status,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        status: status,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<MyButtonController, String>
      createElement() {
    return _MyButtonControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MyButtonControllerProvider && other.status == status;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, status.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MyButtonControllerRef on AutoDisposeNotifierProviderRef<String> {
  /// The parameter `status` of this provider.
  String get status;
}

class _MyButtonControllerProviderElement
    extends AutoDisposeNotifierProviderElement<MyButtonController, String>
    with MyButtonControllerRef {
  _MyButtonControllerProviderElement(super.provider);

  @override
  String get status => (origin as MyButtonControllerProvider).status;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
