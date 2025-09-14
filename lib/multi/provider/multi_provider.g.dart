// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'multi_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$documentsHash() => r'2c47fd31d37754810aaf3d30e10acf510540fc58';

/// See also [Documents].
@ProviderFor(Documents)
final documentsProvider = NotifierProvider<Documents, DocState>.internal(
  Documents.new,
  name: r'documentsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$documentsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Documents = Notifier<DocState>;
String _$nodeHash() => r'3ca3201c2b26271048675566deb8443cff84e929';

/// See also [Node].
@ProviderFor(Node)
final nodeProvider =
    AutoDisposeNotifierProvider<Node, authority.CurrentNode>.internal(
      Node.new,
      name: r'nodeProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product') ? null : _$nodeHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$Node = AutoDisposeNotifier<authority.CurrentNode>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
