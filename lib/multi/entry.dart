import 'package:fluent_ui/fluent_ui.dart';
import 'package:xml/xml.dart';

class MultiEntry extends StatefulWidget {
  final XmlElement? element;
  const MultiEntry({super.key, this.element}); //, this.elements});

  Widget makeEmpty(BuildContext context) {
    return IconButton(
      icon: Icon(
        FluentIcons.add,
        size: 24.0,
        color: FluentTheme.of(context).accentColor,
      ),
      onPressed: () => debugPrint('pressed button'),
    );
  }

  Widget makeItem(BuildContext context, XmlElement? el) {
    if (el == null) return makeEmpty(context);
    return SizedBox(
      height: 40.0,
      width: 100.0,
      child: TextBox(controller: TextEditingController(text: el.innerText)),
    );
  }

  Widget makeView(BuildContext context, XmlElement? el) {
    if (el == null) return makeEmpty(context);
    return SizedBox(height: 40.0, width: 100.0, child: Text(el.innerText));
  }

  @override
  State<MultiEntry> createState() => _MultiEntryState();
}

class _MultiEntryState extends State<MultiEntry> {
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
          child: ToggleSwitch(
            checked: checked,
            onChanged: (v) => setState(() => checked = v),
            content: Text(checked ? 'Edit' : 'View'),
          ),
        ),
        Expanded(
          child: Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
            child: AnimatedCrossFade(
              duration: const Duration(milliseconds: 200),
              firstChild: widget.makeItem(context, widget.element),
              secondChild: widget.makeView(context, widget.element),
              crossFadeState:
                  checked
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
            ),
          ),
        ),
      ],
    );
  }
}
