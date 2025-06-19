import 'package:fluent_ui/fluent_ui.dart';
import 'package:xml/xml.dart';

class Multi extends StatefulWidget {
  final List<XmlElement>? elements;
  const Multi({super.key, this.elements});

  Widget makeItem(XmlElement el) {
    return TextBox(controller: TextEditingController(text: el.innerText));
  }

  Widget makeView(XmlElement el) {
    return Text(el.innerText);
  }

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
