import 'package:flutter/material.dart';
import '../core/app_colors.dart';
import '../models/mitra.dart';
import '../models/order.dart';
import '../models/service_category.dart';
import '../models/hospital.dart';
import '../models/fashion.dart';
import '../models/culinary.dart';
import '../models/event.dart';
import '../models/public_service.dart';

class DummyData {
  static const categories = <ServiceCategory>[
    ServiceCategory(
      title: 'Rumah Sakit',
      subtitle: 'Antre poli, lab, farmasi',
      icon: Icons.local_hospital_rounded,
      color: Color(0xFFE75A5A),
    ),
    ServiceCategory(
      title: 'Fashion',
      subtitle: 'Fitting, tailoring, delivery',
      icon: Icons.shopping_bag_rounded,
      color: Color(0xFFEC4899),
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
      title: 'Tiket Event',
      subtitle: 'Konser, bioskop, event',
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

  // ===========================================================================
  // FOCUSED DATA: HOSPITALS IN JAKARTA (WITH COOPERATION STATUS)
  // ===========================================================================
  static const hospitals = <Hospital>[
    Hospital(
      id: 'hosp_jkt_001',
      name: 'RSUPN Dr. Cipto Mangunkusumo (RSCM)',
      address: 'Jl. Pangeran Diponegoro No. 71, Senen',
      district: 'Jakarta Pusat',
      phone: '(021) 1500135',
      rating: 4.9,
      photoUrl: 'assets/images/hospital1.jpg',
      departments: ['Poli Umum', 'Poli Spesialis Jantung', 'Poli Anak (Pediatri)', 'Laboratorium Utama', 'Farmasi & Apotek', 'Onkologi'],
      // Tambahkan field di bawah ini jika model 'Hospital' kamu mendukungnya, 
      // atau gunakan field ini untuk filter di UI.
    ),
    Hospital(
      id: 'hosp_jkt_002',
      name: 'RS Pondok Indah - Pondok Indah',
      address: 'Jl. Metro Pondok Indah No. 111, Kebayoran Lama',
      district: 'Jakarta Selatan',
      phone: '(021) 7654321',
      rating: 4.9,
      photoUrl: 'assets/images/hospital2.jpg',
      departments: ['Poli Umum', 'Kardiologi', 'Neurologi (Saraf)', 'Ortopedi (Tulang)', 'Farmasi Racikan', 'Executive Health Chkp'],
    ),
    Hospital(
      id: 'hosp_jkt_003',
      name: 'RSPI Sulianti Saroso',
      address: 'Jl. Baru Sunter Permai Raya, Tanjung Priok',
      district: 'Jakarta Utara',
      phone: '(021) 6506559',
      rating: 4.7,
      photoUrl: 'assets/images/hospital3.jpg',
      departments: ['Poli Penyakit Dalam', 'Poli Paru & Pernapasan', 'Laboratorium Infeksi', 'ICU', 'Farmasi Umum'],
    ),
    Hospital(
      id: 'hosp_jkt_004',
      name: 'RS Jantung Center & Diagram Jakarta',
      address: 'Jl. Letjen S. Parman No. Kav 21, Slipi',
      district: 'Jakarta Barat',
      phone: '(021) 5686011',
      rating: 4.8,
      photoUrl: 'assets/images/hospital4.jpg',
      departments: ['Spesialis Jantung Dewasa', 'Spesialis Jantung Anak', 'Fisioterapi Jantung', 'Radiologi & CT Scan', 'Farmasi'],
    ),
    Hospital(
      id: 'hosp_jkt_005',
      name: 'RS Umum Daerah (RSUD) Pasar Rebo',
      address: 'Jl. Kh. Muhasan Raya No. 4, Pasar Rebo',
      district: 'Jakarta Timur',
      phone: '(021) 8400104',
      rating: 4.6,
      photoUrl: 'assets/images/hospital5.jpg',
      departments: ['Poli THT', 'Poli Kebidanan & Kandungan', 'Poli Mata', 'Laboratorium Darah', 'Farmasi BPJS'],
    ),
    Hospital(
      id: 'hosp_jkt_006',
      name: 'RS Siloam Hospitals Kebon Jeruk',
      address: 'Jl. Perjuangan No. 8, Kebon Jeruk',
      district: 'Jakarta Barat',
      phone: '(021) 25677888',
      rating: 4.8,
      photoUrl: 'assets/images/hospital6.jpg',
      departments: ['Poli Gigi & Mulut', 'Poli Kulit & Kelamin', 'Ortopedi & Sendi', 'Medical Check Up', 'Farmasi'],
    ),
    Hospital(
      id: 'hosp_jkt_007',
      name: 'RS Umum Daerah (RSUD) Tarakan Jakarta',
      address: 'Jl. Kyai Caringin No. 7, Gambir',
      district: 'Jakarta Pusat',
      phone: '(021) 3503003',
      rating: 4.7,
      photoUrl: 'assets/images/hospital7.jpg',
      departments: ['Poli Penyakit Dalam', 'Poli Bedah Umum', 'Apotek Farmasi Reguler', 'Apotek BPJS', 'Laboratorium'],
    ),
  ];

  // Fashion brands
  static const fashionBrands = <FashionBrand>[
    FashionBrand(
      id: 'brand_001',
      name: 'Zara Indonesia',
      logoUrl: 'assets/images/zara_logo.png',
      services: [
        FashionService(
          id: 'service_001',
          type: 'Fitting',
          description: 'Layanan fitting dan alterasi',
          fee: 50000,
        ),
        FashionService(
          id: 'service_002',
          type: 'Tailoring',
          description: 'Penyesuaian ukuran pakaian',
          fee: 75000,
        ),
      ],
    ),
    FashionBrand(
      id: 'brand_002',
      name: 'H&M Indonesia',
      logoUrl: 'assets/images/hm_logo.png',
      services: [
        FashionService(
          id: 'service_003',
          type: 'Fitting',
          description: 'Fitting room dan konsultasi',
          fee: 0,
        ),
        FashionService(
          id: 'service_004',
          type: 'Delivery',
          description: 'Pengiriman ke rumah',
          fee: 30000,
        ),
      ],
    ),
    FashionBrand(
      id: 'brand_003',
      name: 'Uniqlo Indonesia',
      logoUrl: 'assets/images/uniqlo_logo.png',
      services: [
        FashionService(
          id: 'service_005',
          type: 'Alterasi',
          description: 'Layanan alterasi pakaian cepat',
          fee: 60000,
        ),
      ],
    ),
  ];

  // Public service locations
  static const publicServices = <PublicServiceLocation>[
    PublicServiceLocation(
      id: 'pub_001',
      name: 'Dinas Kependudukan Jakarta Pusat',
      address: 'Jl. Mayjen Soemarto No. 87, Jakarta Pusat',
      city: 'Jakarta Pusat',
      phone: '(021) 123-4567',
      services: [
        PublicServiceType(
          id: 'pub_service_001',
          name: 'KTP Elektronik',
          fee: 0,
          estimatedWaitTime: 45,
          description: 'Pembuatan/perpanjangan KTP elektronik',
        ),
        PublicServiceType(
          id: 'pub_service_002',
          name: 'Akte Kelahiran',
          fee: 0,
          estimatedWaitTime: 30,
          description: 'Permohonan akte kelahiran',
        ),
      ],
    ),
    PublicServiceLocation(
      id: 'pub_002',
      name: 'Polres Jakarta Selatan - Unit SIM',
      address: 'Jl. Cilandak KKO No. 1, Jakarta Selatan',
      city: 'Jakarta Selatan',
      phone: '(021) 765-4321',
      services: [
        PublicServiceType(
          id: 'pub_service_003',
          name: 'Permohonan SIM Baru',
          fee: 120000,
          estimatedWaitTime: 60,
          description: 'Permohonan SIM kategori A/B baru',
        ),
        PublicServiceType(
          id: 'pub_service_004',
          name: 'Perpanjangan SIM',
          fee: 120000,
          estimatedWaitTime: 45,
          description: 'Perpanjangan SIM yang sudah berlaku',
        ),
      ],
    ),
    PublicServiceLocation(
      id: 'pub_003',
      name: 'SAMSAT DKI Jakarta Timur',
      address: 'Jl. Tengku Amir Hamzah No. 1, Jakarta Timur',
      city: 'Jakarta Timur',
      phone: '(021) 456-7890',
      services: [
        PublicServiceType(
          id: 'pub_service_005',
          name: 'Bayar Pajak Kendaraan',
          fee: 0,
          estimatedWaitTime: 30,
          description: 'Pembayaran pajak kendaraan tahunan',
        ),
      ],
    ),
  ];

  // Culinary services
  static const culinaryServices = <CulinaryService>[
    CulinaryService(
      id: 'culinary_001',
      restaurantName: 'Rumah Makan Padang Sederhana',
      address: 'Jl. Sudirman No. 45, Jakarta Pusat',
      locationLink: 'https://maps.google.com/...',
      photoUrl: 'assets/images/padang.jpg',
      fee: 25000,
      estimatedTime: 20,
    ),
    CulinaryService(
      id: 'culinary_002',
      restaurantName: 'Warung Soto Ayam Bapak Sukro',
      address: 'Jl. Gatot Subroto No. 123, Jakarta Selatan',
      locationLink: 'https://maps.google.com/...',
      photoUrl: 'assets/images/soto.jpg',
      fee: 20000,
      estimatedTime: 25,
    ),
    CulinaryService(
      id: 'culinary_003',
      restaurantName: 'Restoran Bakmie Jago',
      address: 'Jl. Ahmad Yani No. 78, Bandung',
      locationLink: 'https://maps.google.com/...',
      photoUrl: 'assets/images/bakmie.jpg',
      fee: 30000,
      estimatedTime: 15,
    ),
  ];

  // Events
  static final events = <Event>[
    Event(
      id: 'event_001',
      name: 'Konser Dua Garis Bawah Jakarta 2024',
      date: DateTime(2024, 8, 15),
      venue: 'Jakarta International Expo (JIExpo) Kemayoran',
      posterUrl: 'assets/images/event1.jpg',
      services: [
        EventService(
          id: 'event_service_001',
          type: 'wristband_exchange',
          description: 'Pertukaran gelang masuk ke venue',
          fee: 0,
          estimatedWaitTime: 10,
        ),
        EventService(
          id: 'event_service_002',
          type: 'merchandise_queue',
          description: 'Antri membeli merchandise event',
          fee: 25000,
          estimatedWaitTime: 45,
        ),
      ],
    ),
    Event(
      id: 'event_002',
      name: 'Festival Film Indonesia 2024',
      date: DateTime(2024, 9, 1),
      venue: 'Gedung Seni Jakarta',
      posterUrl: 'assets/images/event2.jpg',
      services: [
        EventService(
          id: 'event_service_003',
          type: 'ticket_queue',
          description: 'Antri membeli tiket film',
          fee: 0,
          estimatedWaitTime: 20,
        ),
      ],
    ),
  ];

  static const order = QueueOrder(
    location: 'RSUPN Dr. Cipto Mangunkusumo (RSCM)',
    address: 'Jl. Pangeran Diponegoro No. 71, Senen, Jakarta Pusat',
    service: 'Poli Spesialis – Jantung',
    date: '22 Mei 2024',
    time: '09:00',
    queueNumber: 'A-023',
    estimateMinutes: 35,
    mitraName: 'Budi Setiawan',
    totalPayment: 105000,
  );

  static const mitra = Mitra(
    id: 'mitra_001',
    name: 'Budi Setiawan',
    rating: 4.9,
    finishedOrders: 128,
    distanceKm: 2.1,
    verified: true,
    photoUrl: 'assets/images/driver.jpg',
    isOnline: true,
    phone: '08123456789',
  );

  static const List<Mitra> mitras = [
    Mitra(
      id: 'mitra_001',
      name: 'Budi Setiawan',
      rating: 4.9,
      finishedOrders: 128,
      distanceKm: 2.1,
      verified: true,
      photoUrl: 'assets/images/driver.jpg',
      isOnline: true,
      phone: '08123456789',
    ),
    Mitra(
      id: 'mitra_002',
      name: 'Siti Nurhaliza',
      rating: 4.8,
      finishedOrders: 95,
      distanceKm: 1.8,
      verified: true,
      photoUrl: 'assets/images/driver2.jpg',
      isOnline: true,
      phone: '08234567890',
    ),
    Mitra(
      id: 'mitra_003',
      name: 'Ahmad Wijaya',
      rating: 4.7,
      finishedOrders: 87,
      distanceKm: 3.2,
      verified: true,
      photoUrl: 'assets/images/driver3.jpg',
      isOnline: false,
      phone: '08345678901',
    ),
  ];

  static const List<String> activeSteps = [
    'Mitra berangkat',
    'Ambil nomor',
    'Menunggu',
    'Giliran Anda',
  ];

  // Order history for customers
  static final List<QueueOrder> orderHistory = [
    const QueueOrder(
      location: 'RSUPN Dr. Cipto Mangunkusumo (RSCM)',
      address: 'Jl. Pangeran Diponegoro No. 71, Senen, Jakarta Pusat',
      service: 'Poli Spesialis – Jantung',
      date: '22 Mei 2024',
      time: '09:00',
      queueNumber: 'A-023',
      estimateMinutes: 35,
      mitraName: 'Budi Setiawan',
      totalPayment: 105000,
    ),
    const QueueOrder(
      location: 'Dinas Kependudukan Jakarta Pusat',
      address: 'Jl. Mayjen Soemarto No. 87, Jakarta Pusat',
      service: 'KTP Elektronik',
      date: '15 Mei 2024',
      time: '08:00',
      queueNumber: 'B-045',
      estimateMinutes: 45,
      mitraName: 'Siti Nurhaliza',
      totalPayment: 75000,
    ),
    const QueueOrder(
      location: 'Rumah Makan Padang Sederhana',
      address: 'Jl. Sudirman No. 45, Jakarta Pusat',
      service: 'Ambil Nomor Meja',
      date: '10 Mei 2024',
      time: '12:30',
      queueNumber: 'P-012',
      estimateMinutes: 20,
      mitraName: 'Ahmad Wijaya',
      totalPayment: 50000,
    ),
  ];
}