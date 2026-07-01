import 'package:flutter/foundation.dart';

import 'models/partner_driver.dart';
import 'models/partner_notification.dart';
import 'models/partner_order.dart';
import 'models/partner_transaction.dart';
import 'dummy/partner_dummy_data.dart';

class PartnerController extends ChangeNotifier {
  PartnerController() {
    _orderHistory = List<PartnerOrder>.from(PartnerDummyData.orderHistory);
    _notifications = List<PartnerNotification>.from(PartnerDummyData.notifications);
    _transactions = List<PartnerTransaction>.from(PartnerDummyData.transactions);
    _startDashboardLoading();
  }

  bool _isLoggedIn = false;
  bool _isOnline = false;
  bool _isDashboardLoading = true;
  bool _notificationsEnabled = true;
  bool _darkMode = false;
  String _language = 'Indonesia';

  PartnerDriver _driver = PartnerDummyData.driver;
  List<PartnerOrder> _incomingOrders = [];
  PartnerOrder? _activeOrder;
  late List<PartnerOrder> _orderHistory;
  late List<PartnerNotification> _notifications;
  late List<PartnerTransaction> _transactions;

  bool get isLoggedIn => _isLoggedIn;
  bool get isOnline => _isOnline;
  bool get isDashboardLoading => _isDashboardLoading;
  bool get notificationsEnabled => _notificationsEnabled;
  bool get darkMode => _darkMode;
  String get language => _language;
  PartnerDriver get driver => _driver;
  List<PartnerOrder> get incomingOrders => List.unmodifiable(_incomingOrders);
  PartnerOrder? get activeOrder => _activeOrder;
  List<PartnerOrder> get orderHistory => List.unmodifiable(_orderHistory);
  List<PartnerNotification> get notifications =>
      List.unmodifiable(_notifications);
  List<PartnerTransaction> get transactions =>
      List.unmodifiable(_transactions);

  int get unreadNotificationCount =>
      _notifications.where((n) => !n.isRead).length;

  bool login({required String username, required String password}) {
    final user = username.trim();
    final pass = password.trim();

    if (user.isEmpty || pass.isEmpty) return false;
    if (user != PartnerDummyData.demoUsername ||
        pass != PartnerDummyData.demoPassword) {
      return false;
    }

    _isLoggedIn = true;
    notifyListeners();
    return true;
  }

  bool loginWithGoogle() {
    _isLoggedIn = true;
    notifyListeners();
    return true;
  }

  void logout() {
    _isLoggedIn = false;
    _isOnline = false;
    _incomingOrders = [];
    _activeOrder = null;
    notifyListeners();
  }

  void setOnline(bool online) {
    _isOnline = online;
    if (online) {
      _incomingOrders = PartnerDummyData.incomingOrders();
    } else {
      _incomingOrders = [];
    }
    notifyListeners();
  }

  void toggleOnline() => setOnline(!_isOnline);

  void acceptOrder(String orderId) {
    final index = _incomingOrders.indexWhere((o) => o.id == orderId);
    if (index == -1) return;

    final order = _incomingOrders.removeAt(index).copyWith(
          status: PartnerOrderStatus.accepted,
          isIncoming: false,
          date: DateTime.now(),
        );
    _activeOrder = order;
    notifyListeners();
  }

  void rejectOrder(String orderId) {
    _incomingOrders.removeWhere((o) => o.id == orderId);
    notifyListeners();
  }

  void finishActiveOrder() {
    final order = _activeOrder;
    if (order == null) return;

    final finished = order.copyWith(
      status: PartnerOrderStatus.finished,
      date: DateTime.now(),
    );
    _orderHistory.insert(0, finished);
    _driver = _driver.copyWith(
      balance: _driver.balance + order.price,
      todayIncome: _driver.todayIncome + order.price,
      weeklyIncome: _driver.weeklyIncome + order.price,
      monthlyIncome: _driver.monthlyIncome + order.price,
      completedOrders: _driver.completedOrders + 1,
      todayOrders: _driver.todayOrders + 1,
    );
    _transactions.insert(
      0,
      PartnerTransaction(
        id: 'tx_${DateTime.now().millisecondsSinceEpoch}',
        title: 'Pendapatan Pesanan – ${order.customerName}',
        amount: order.price,
        isCredit: true,
        timestamp: DateTime.now(),
      ),
    );
    _notifications.insert(
      0,
      PartnerNotification(
        id: 'notif_${DateTime.now().millisecondsSinceEpoch}',
        type: PartnerNotificationType.paymentReceived,
        message:
            'Pembayaran ${order.price} diterima dari ${order.customerName}',
        timestamp: DateTime.now(),
      ),
    );
    _activeOrder = null;
    notifyListeners();
  }

  void withdraw() {
    if (_driver.balance < 50000) return;
    const amount = 200000;
    if (_driver.balance < amount) return;

    _driver = _driver.copyWith(balance: _driver.balance - amount);
    _transactions.insert(
      0,
      PartnerTransaction(
        id: 'tx_w_${DateTime.now().millisecondsSinceEpoch}',
        title: 'Penarikan Dana',
        amount: amount,
        isCredit: false,
        timestamp: DateTime.now(),
      ),
    );
    notifyListeners();
  }

  void markNotificationRead(String id) {
    final index = _notifications.indexWhere((n) => n.id == id);
    if (index == -1) return;
    _notifications[index] = _notifications[index].copyWith(isRead: true);
    notifyListeners();
  }

  void markAllNotificationsRead() {
    _notifications = _notifications
        .map((n) => n.copyWith(isRead: true))
        .toList(growable: false);
    notifyListeners();
  }

  void setNotificationsEnabled(bool value) {
    _notificationsEnabled = value;
    notifyListeners();
  }

  void setDarkMode(bool value) {
    _darkMode = value;
    notifyListeners();
  }

  void setLanguage(String value) {
    _language = value;
    notifyListeners();
  }

  void refreshDashboard() {
    _isDashboardLoading = true;
    notifyListeners();
    _startDashboardLoading();
  }

  void _startDashboardLoading() {
    Future.delayed(const Duration(milliseconds: 1200), () {
      _isDashboardLoading = false;
      notifyListeners();
    });
  }
}
