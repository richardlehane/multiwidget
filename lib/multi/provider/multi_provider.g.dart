// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'multi_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$documentsHash() => r'aae92c84179642c4c02ec0f69c214c85f0aa38e5';

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
String _$nodeHash() => r'1f0d0e39264ce9f8cbdee47689b15809d55ac658';

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
