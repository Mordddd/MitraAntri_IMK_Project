import 'package:flutter/material.dart';

enum PartnerOrderStatus {
  waiting,
  accepted,
  finished,
  completed,
  cancelled,
}

enum PartnerServiceCategory {
  hospital,
  fashion,
  culinary,
  event,
  publicService,
}

extension PartnerServiceCategoryX on PartnerServiceCategory {
  String get label {
    return switch (this) {
      PartnerServiceCategory.hospital => 'Hospital',
      PartnerServiceCategory.fashion => 'Fashion',
      PartnerServiceCategory.culinary => 'Culinary',
      PartnerServiceCategory.event => 'Event',
      PartnerServiceCategory.publicService => 'Public Service',
    };
  }

  IconData get icon {
    return switch (this) {
      PartnerServiceCategory.hospital => Icons.local_hospital_rounded,
      PartnerServiceCategory.fashion => Icons.checkroom_rounded,
      PartnerServiceCategory.culinary => Icons.restaurant_rounded,
      PartnerServiceCategory.event => Icons.confirmation_number_rounded,
      PartnerServiceCategory.publicService => Icons.apartment_rounded,
    };
  }

  Color get color {
    return switch (this) {
      PartnerServiceCategory.hospital => const Color(0xFFE75A5A),
      PartnerServiceCategory.fashion => const Color(0xFFEC4899),
      PartnerServiceCategory.culinary => const Color(0xFFF59E0B),
      PartnerServiceCategory.event => const Color(0xFF9C4DCC),
      PartnerServiceCategory.publicService => const Color(0xFF8B5CF6),
    };
  }
}

class PartnerOrder {
  const PartnerOrder({
    required this.id,
    required this.customerName,
    required this.customerPhone,
    required this.category,
    required this.serviceType,
    required this.destination,
    required this.address,
    required this.distanceKm,
    required this.estimatedMinutes,
    required this.price,
    required this.status,
    required this.date,
    this.isIncoming = false,
  });

  final String id;
  final String customerName;
  final String customerPhone;
  final PartnerServiceCategory category;
  final String serviceType;
  final String destination;
  final String address;
  final double distanceKm;
  final int estimatedMinutes;
  final int price;
  final PartnerOrderStatus status;
  final DateTime date;
  final bool isIncoming;

  PartnerOrder copyWith({
    PartnerOrderStatus? status,
    bool? isIncoming,
    DateTime? date,
  }) {
    return PartnerOrder(
      id: id,
      customerName: customerName,
      customerPhone: customerPhone,
      category: category,
      serviceType: serviceType,
      destination: destination,
      address: address,
      distanceKm: distanceKm,
      estimatedMinutes: estimatedMinutes,
      price: price,
      status: status ?? this.status,
      date: date ?? this.date,
      isIncoming: isIncoming ?? this.isIncoming,
    );
  }

  String get statusLabel {
    return switch (status) {
      PartnerOrderStatus.waiting => 'Menunggu',
      PartnerOrderStatus.accepted => 'Diterima',
      PartnerOrderStatus.finished => 'Selesai',
      PartnerOrderStatus.completed => 'Completed',
      PartnerOrderStatus.cancelled => 'Dibatalkan',
    };
  }
}
