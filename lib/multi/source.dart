import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'provider/multi_provider.dart';
import 'multi.dart';

class Source extends Multi {
  const Source({super.key})
    : super(label: "Sources", element: "Source", blank: false);

  @override
  Widget Function(BuildContext, WidgetRef, int, Function(int)) makeForm(
    int idx,
    int len,
  ) {
    Widget formf(
      BuildContext context,
      WidgetRef ref,
      int flags,
      Function(int) cb,
    ) {
      return SizedBox(
        height: 70.0,
        // width: 500.0,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsetsGeometry.all(5.0),
              child: InfoLabel(
                label: "Source",
                labelStyle: FluentTheme.of(context).typography.caption!,
                child: SizedBox(
                  width: 250.0,
                  child: TextBox(
                    controller: TextEditingController(
                      text: ref.read(nodeProvider).multiGet(element, idx, null),
                    ),
                    //onChanged: (value) => ref.read(nodeProvider).mark(name),//
                    onChanged:
                        (value) => ref
                            .read(nodeProvider)
                            .multiSet(element, idx, null, value),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsGeometry.all(5.0),
              child: InfoLabel(
                label: "Web address (optional)",
                labelStyle: FluentTheme.of(context).typography.caption!,
                child: SizedBox(
                  width: 250.0,
                  child: TextBox(
                    controller: TextEditingController(
                      text: ref
                          .read(nodeProvider)
                          .multiGet(element, idx, "url"),
                    ),
                    //onChanged: (value) => ref.read(nodeProvider).mark(name),//
                    onChanged:
                        (value) => ref
                            .read(nodeProvider)
                            .multiSet(element, idx, "url", value),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return formf;
  }

  @override
  Widget Function(BuildContext, WidgetRef) makeView(int idx, int len) {
    Widget viewf(BuildContext context, WidgetRef ref) {
      return SizedBox(
        height: 50.0,

        child: Row(
          children: [
            Padding(
              padding: EdgeInsetsGeometry.all(5.0),
              child: SizedBox(
                height: 200,
                child: RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: ref.read(nodeProvider).source(idx),
                  ),
                  maxLines: null,
                  overflow: TextOverflow.visible,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return viewf;
  }
}
