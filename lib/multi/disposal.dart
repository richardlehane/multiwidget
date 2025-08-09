import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'provider/multi_provider.dart';
import 'multi.dart';

class Disposal extends Multi {
  const Disposal({super.key}) : super(label: "Disposal", element: "Disposal");

  @override
  Widget Function(BuildContext, WidgetRef) makeForm(int idx) {
    Widget formf(BuildContext context, WidgetRef ref) {
      return SizedBox(
        height: 50.0,

        // width: 500.0,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: InfoLabel(
                label: "Retention Period",
                labelStyle: FluentTheme.of(
                  context,
                ).typography.caption?.apply(fontSizeFactor: 1.0),
                child: TextBox(
                  controller: TextEditingController(
                    text: ref
                        .watch(nodeProvider)
                        .mGet(element, idx, "RetentionPeriod"),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: TextBox(
                controller: TextEditingController(
                  text: ref
                      .watch(nodeProvider)
                      .mGet(element, idx, "DisposalTrigger"),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: TextBox(
                controller: TextEditingController(
                  text: ref
                      .watch(nodeProvider)
                      .mGet(element, idx, "DisposalAction"),
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
  Widget Function(BuildContext, WidgetRef) makeView(int idx) {
    Widget viewf(BuildContext context, WidgetRef ref) {
      return SizedBox(
        height: 50.0,

        child: TextBox(
          placeholder: ref
              .watch(nodeProvider)
              .mGet(element, idx, "DisposalAction"),
          readOnly: true,
        ),
      );
    }

    return viewf;
  }
}
