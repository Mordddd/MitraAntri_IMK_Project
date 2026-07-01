import 'package:flutter/widgets.dart';

import 'partner_controller.dart';

class PartnerScope extends InheritedNotifier<PartnerController> {
  const PartnerScope({
    super.key,
    required PartnerController controller,
    required super.child,
  }) : super(notifier: controller);

  static PartnerController read(BuildContext context) {
    final scope =
        context.dependOnInheritedWidgetOfExactType<PartnerScope>();
    assert(scope != null, 'PartnerScope not found in widget tree');
    return scope!.notifier!;
  }

  static PartnerController watch(BuildContext context) {
    return read(context);
  }
}
