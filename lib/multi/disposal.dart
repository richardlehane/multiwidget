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
        height: 40.0,
        width: 500.0,

        child: Row(
          children: [
            Expanded(
              child: TextBox(
                controller: TextEditingController(
                  text: ref
                      .watch(nodeProvider)
                      .mGet(element, idx, "RetentionPeriod"),
                ),
              ),
            ),
            Expanded(
              child: TextBox(
                controller: TextEditingController(
                  text: ref
                      .watch(nodeProvider)
                      .mGet(element, idx, "DisposalTrigger"),
                ),
              ),
            ),
            Expanded(
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
        height: 40.0,
        width: 100.0,
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
