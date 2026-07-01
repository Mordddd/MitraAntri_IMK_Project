import 'package:flutter/material.dart';

enum PartnerNotificationType {
  newOrder,
  customerCancelled,
  orderCompleted,
  paymentReceived,
}

extension PartnerNotificationTypeX on PartnerNotificationType {
  String get title {
    return switch (this) {
      PartnerNotificationType.newOrder => 'Pesanan Baru',
      PartnerNotificationType.customerCancelled => 'Pesanan Dibatalkan',
      PartnerNotificationType.orderCompleted => 'Pesanan Selesai',
      PartnerNotificationType.paymentReceived => 'Pembayaran Diterima',
    };
  }

  IconData get icon {
    return switch (this) {
      PartnerNotificationType.newOrder => Icons.add_shopping_cart_rounded,
      PartnerNotificationType.customerCancelled => Icons.cancel_rounded,
      PartnerNotificationType.orderCompleted => Icons.check_circle_rounded,
      PartnerNotificationType.paymentReceived => Icons.payments_rounded,
    };
  }

  Color get color {
    return switch (this) {
      PartnerNotificationType.newOrder => const Color(0xFF16A34A),
      PartnerNotificationType.customerCancelled => const Color(0xFFE75A5A),
      PartnerNotificationType.orderCompleted => const Color(0xFF0E6ED6),
      PartnerNotificationType.paymentReceived => const Color(0xFFF59E0B),
    };
  }
}

class PartnerNotification {
  const PartnerNotification({
    required this.id,
    required this.type,
    required this.message,
    required this.timestamp,
    this.isRead = false,
  });

  final String id;
  final PartnerNotificationType type;
  final String message;
  final DateTime timestamp;
  final bool isRead;

  PartnerNotification copyWith({bool? isRead}) {
    return PartnerNotification(
      id: id,
      type: type,
      message: message,
      timestamp: timestamp,
      isRead: isRead ?? this.isRead,
    );
  }
}
