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

  test('balance payment cannot overdraw the wallet', () {
    final controller = AppController(
      initialOrder: DummyData.order,
      wallet: DummyData.wallet.copyWith(balance: 1000),
    );

    controller
      ..advanceOrder()
      ..advanceOrder()
      ..advanceOrder();

    expect(controller.pay(), isFalse);
    expect(controller.orderStatus, OrderStatus.completed);
    expect(controller.wallet.balance, 1000);
    expect(controller.paymentBlockReason, contains('Saldo'));
  });

  test('bank transfer does not deduct wallet balance', () {
    final controller = AppController(initialOrder: DummyData.order)
      ..advanceOrder()
      ..advanceOrder()
      ..advanceOrder()
      ..selectPaymentMethod(PaymentMethod.bankTransfer);
    final initialBalance = controller.wallet.balance;

    expect(controller.pay(), isTrue);
    expect(controller.wallet.balance, initialBalance);
  });
}
