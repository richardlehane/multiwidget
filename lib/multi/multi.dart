import 'package:fluent_ui/fluent_ui.dart';

class Multi extends StatefulWidget {
  const Multi({super.key});

  @override
  State<Multi> createState() => _MultiState();
}

class _MultiState extends State<Multi> {
  var itemCount = 0;

  @override
  Widget build(BuildContext context) {
    return InfoLabel(
      label: "Multi",
      child: ListView(
        children: [
          IconButton(
            icon: Icon(
              FluentIcons.add,
              size: 24.0,
              color: FluentTheme.of(context).accentColor,
            ),
            onPressed: () => debugPrint('pressed button'),
          ),
        ],
      ),
    );
  }
}
