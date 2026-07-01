import 'package:flutter/foundation.dart';

import '../models/order.dart';
import '../models/wallet.dart';
import '../dummy/dummy_data.dart';

enum AppRole { customer, partner }

enum OrderStatus {
  draft,
  searching,
  assigned,
  queueing,
  ready,
  completed,
  paid,
  cancelled,
}

enum PaymentMethod { balance, bankTransfer, qris }

class AppController extends ChangeNotifier {
  AppController({
    required QueueOrder initialOrder,
    Wallet? wallet,
  })  : _order = initialOrder,
        _wallet = wallet ?? DummyData.wallet,
        _orderStatus = OrderStatus.assigned;

  AppRole _role = AppRole.customer;
  OrderStatus _orderStatus = OrderStatus.draft;
  PaymentMethod _paymentMethod = PaymentMethod.balance;
  QueueOrder _order;
  Wallet _wallet;
  bool _isOnline = false;

  AppRole get role => _role;
  OrderStatus get orderStatus => _orderStatus;
  PaymentMethod get paymentMethod => _paymentMethod;
  QueueOrder get order => _order;
  Wallet get wallet => _wallet;
  bool get isOnline => _isOnline;

  bool get hasOrder =>
      _orderStatus != OrderStatus.draft &&
      _orderStatus != OrderStatus.cancelled;

  bool get canPay => _orderStatus == OrderStatus.completed;

  int get trackingStep {
    return switch (_orderStatus) {
      OrderStatus.searching || OrderStatus.assigned => 0,
      OrderStatus.queueing => 1,
      OrderStatus.ready || OrderStatus.completed || OrderStatus.paid => 3,
      _ => 0,
    };
  }

  String get statusLabel {
    return switch (_orderStatus) {
      OrderStatus.draft => 'Belum ada pesanan',
      OrderStatus.searching => 'Mencari mitra',
      OrderStatus.assigned => 'Mitra berangkat',
      OrderStatus.queueing => 'Sedang mengantre',
      OrderStatus.ready => 'Giliran Anda',
      OrderStatus.completed => 'Selesai, menunggu pembayaran',
      OrderStatus.paid => 'Selesai dan dibayar',
      OrderStatus.cancelled => 'Pesanan dibatalkan',
    };
  }

  void enterCustomerMode() {
    _role = AppRole.customer;
    notifyListeners();
  }

  void enterPartnerMode() {
    _role = AppRole.partner;
    notifyListeners();
  }

  void submitBooking({
    required String service,
    required String date,
    required String time,
    required String notes,
  }) {
    _order = _order.copyWith(
      service: service,
      date: date,
      time: time,
      notes: notes,
    );
    _orderStatus = OrderStatus.assigned;
    notifyListeners();
  }

  void advanceOrder() {
    _orderStatus = switch (_orderStatus) {
      OrderStatus.searching => OrderStatus.assigned,
      OrderStatus.assigned => OrderStatus.queueing,
      OrderStatus.queueing => OrderStatus.ready,
      OrderStatus.ready => OrderStatus.completed,
      _ => _orderStatus,
    };
    notifyListeners();
  }

  void acceptOrder() {
    _orderStatus = OrderStatus.assigned;
    notifyListeners();
  }

  void rejectOrder() {
    _orderStatus = OrderStatus.cancelled;
    notifyListeners();
  }

  void selectPaymentMethod(PaymentMethod method) {
    _paymentMethod = method;
    notifyListeners();
  }

  bool pay() {
    if (!canPay) return false;
    _orderStatus = OrderStatus.paid;
    // Deduct from wallet
    _wallet = _wallet.copyWith(
      balance: _wallet.balance - _order.totalPayment,
    );
    notifyListeners();
    return true;
  }

  void resetOrder() {
    _orderStatus = OrderStatus.draft;
    notifyListeners();
  }

  void toggleOnlineStatus() {
    _isOnline = !_isOnline;
    notifyListeners();
  }

  void setOnlineStatus(bool online) {
    _isOnline = online;
    notifyListeners();
  }

  void addWalletBalance(int amount) {
    _wallet = _wallet.copyWith(
      balance: _wallet.balance + amount,
      totalEarned: _wallet.totalEarned + amount,
    );
    notifyListeners();
  }

  void deductWalletBalance(int amount) {
    if (_wallet.balance >= amount) {
      _wallet = _wallet.copyWith(
        balance: _wallet.balance - amount,
      );
      notifyListeners();
    }
  }
}
