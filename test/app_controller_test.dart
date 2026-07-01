import 'package:flutter_test/flutter_test.dart';
import 'package:mitra_antri_mockup/app/app_controller.dart';
<<<<<<< HEAD
import 'package:mitra_antri_mockup/dummy/dummy_data.dart';
=======
import 'package:mitra_antri_mockup/data/dummy_data.dart';
>>>>>>> e779af82024cf7b88993b7a681383685aaa57ba5

void main() {
  test('order must complete before payment', () {
    final controller = AppController(initialOrder: DummyData.order);

    controller.submitBooking(
<<<<<<< HEAD
      service: 'Fashion',
=======
      service: 'Bank',
>>>>>>> e779af82024cf7b88993b7a681383685aaa57ba5
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
