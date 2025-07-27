import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:file_picker/file_picker.dart';
import 'multi/disposal.dart';
import 'multi/provider/multi_provider.dart';

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
    return Container(
      color: FluentTheme.of(context).micaBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(child: Disposal()),
            Button(
              child: Text("press me"),
              onPressed: () async {
                FilePickerResult? result = await FilePicker.platform.pickFiles(
                  withData: true,
                );
                if (result != null) {
                  ref.read(documentsProvider.notifier).load(result.files.first);
                  ref.read(documentsProvider.notifier).selectionChanged(3);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
