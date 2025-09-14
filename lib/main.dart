import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:file_picker/file_picker.dart';
import 'multi/source.dart';
import 'multi/provider/multi_provider.dart';
import 'package:authority/authority.dart' show NodeType;

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FluentApp(
      theme: FluentThemeData(
        brightness: Brightness.light,
        accentColor: Colors.blue,
      ),
      home: Contents(),
    );
  }
}

class Contents extends ConsumerWidget {
  const Contents({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final documents = ref.watch(documentsProvider);
    return Container(
      color: FluentTheme.of(context).micaBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(child: Source()),
            Button(
              child: Text("press me"),
              onPressed: () async {
                FilePickerResult? result = await FilePicker.platform.pickFiles(
                  withData: true,
                );
                if (result != null) {
                  ref.read(documentsProvider.notifier).load(result.files.first);
                  ref.read(documentsProvider.notifier).selectionChanged((
                    NodeType.classType,
                    3,
                  ));
                }
              },
            ),
            Button(
              child: Text("reload"),
              onPressed: () async {
                ref.read(documentsProvider.notifier).refresh();
              },
            ),
            SizedBox(
              height: 400.0,
              child: TextBox(
                controller: TextEditingController(
                  text: documents.documents[documents.current].toString(),
                ),
                maxLines: null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
