import 'package:flutter/material.dart';
import '../core/app_colors.dart';
import '../models/mitra.dart';
import '../models/order.dart';
import '../models/service_category.dart';

class DummyData {
  static const categories = <ServiceCategory>[
    ServiceCategory(
      title: 'Rumah Sakit',
      subtitle: 'Antre poli, lab, farmasi',
      icon: Icons.local_hospital_rounded,
      color: Color(0xFFE75A5A),
    ),
    ServiceCategory(
      title: 'Bank',
      subtitle: 'Setor, tarik, CS',
      icon: Icons.account_balance_rounded,
      color: AppColors.blue,
    ),
    ServiceCategory(
      title: 'Layanan Publik',
      subtitle: 'KTP, SIM, Samsat',
      icon: Icons.apartment_rounded,
      color: Color(0xFF8B5CF6),
    ),
    ServiceCategory(
      title: 'Kuliner',
      subtitle: 'Ambil nomor restoran',
      icon: Icons.restaurant_rounded,
      color: Color(0xFFF59E0B),
    ),
    ServiceCategory(
      title: 'Tiket',
      subtitle: 'Bioskop, konser, event',
      icon: Icons.confirmation_number_rounded,
      color: Color(0xFF9C4DCC),
    ),
    ServiceCategory(
      title: 'Lainnya',
      subtitle: 'Custom kebutuhan kamu',
      icon: Icons.more_horiz_rounded,
      color: AppColors.teal,
    ),
  ];

  static const order = QueueOrder(
    location: 'RSUD Kota Bandung',
    address: 'Jl. Ahmad Yani No. 123, Bandung',
    service: 'Poli Spesialis – Jantung',
    date: '22 Mei 2024',
    time: '09:00',
    queueNumber: 'A-023',
    estimateMinutes: 35,
    mitraName: 'Budi Setiawan',
    totalPayment: 105000,
  );

  static const mitra = Mitra(
    name: 'Budi Setiawan',
    rating: 4.9,
    finishedOrders: 128,
    distanceKm: 2.1,
    verified: true,
  );

  static const List<String> activeSteps = [
    'Mitra berangkat',
    'Ambil nomor',
    'Menunggu',
    'Giliran Anda',
  ];
}
