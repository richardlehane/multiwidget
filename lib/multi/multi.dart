import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'entry.dart';
import 'provider/multi_provider.dart';

// Two types:
// An enclosing tag e.g. Status
// Multiple of the same element as siblings, e.g. comments, source, disposal

class Multi extends ConsumerWidget {
  final String name;
  Multi({super.key, required this.name});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InfoLabel(
      label: name,
      child: ListView.builder(
        itemCount: ref.watch(multiProvider).len("Disposal"),
        itemBuilder: (BuildContext context, int index) {
          return MultiEntry(idx: index);
        },
      ),
    );
  }
}

// see reference terms: use a horizontal list
