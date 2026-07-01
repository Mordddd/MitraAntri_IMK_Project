import 'package:flutter_test/flutter_test.dart';
import 'package:mitra_antri_mockup/app/app_controller.dart';
import 'package:mitra_antri_mockup/dummy/dummy_data.dart';

void main() {
  test('order must complete before payment', () {
    final controller = AppController(initialOrder: DummyData.order);

    controller.submitBooking(
      service: 'Fashion',
      date: '30 Juni 2026',
      time: '09.00',
      notes: 'Ambil antrean layanan nasabah.',
    );

    expect(controller.orderStatus, OrderStatus.assigned);
    expect(controller.pay(), isFalse);

    controller.advanceOrder();
    controller.advanceOrder();
    controller.advanceOrder();

    expect(controller.orderStatus, OrderStatus.completed);
    expect(controller.pay(), isTrue);
    expect(controller.orderStatus, OrderStatus.paid);
  });

  test('partner rejection cancels the active order', () {
    final controller = AppController(initialOrder: DummyData.order)
      ..acceptOrder()
      ..rejectOrder();

    expect(controller.orderStatus, OrderStatus.cancelled);
    expect(controller.hasOrder, isFalse);
  });
}
