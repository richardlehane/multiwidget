import 'package:fluent_ui/fluent_ui.dart';
import 'package:xml/xml.dart';
import 'entry.dart';

class Multi extends StatefulWidget {
  final List<XmlElement>? elements;
  const Multi({super.key, this.elements});

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
          MultiEntry(
            element: XmlElement.tag("hello", children: [XmlText("hey")]),
          ),
        ],
      ),
    );
  }
}

// see reference terms: use a horizontal list
