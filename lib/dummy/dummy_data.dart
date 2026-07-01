import 'package:flutter/material.dart';

import '../core/app_routes.dart';
import '../models/culinary.dart';
import '../models/event.dart';
import '../models/fashion.dart';
import '../models/hospital.dart';
import '../models/mitra.dart';
import '../models/order.dart';
import '../models/public_service.dart';
import '../models/service_category.dart';
import '../models/user.dart';
import '../models/wallet.dart';

class DummyData {
  static const demoUsername = 'user';
  static const demoPassword = '123456';

  static const currentUser = User(
    id: 'user_001',
    name: 'User',
    email: 'user@mitraantri.com',
    phone: '081234567890',
    photoUrl: '',
    role: 'customer',
    verified: true,
  );

  static const categories = <ServiceCategory>[
    ServiceCategory(
      title: 'Hospital',
      subtitle: 'Antre obat, lab, administrasi',
      icon: Icons.local_hospital_rounded,
      color: Color(0xFFE75A5A),
      route: AppRoutes.hospitalList,
      emoji: '🏥',
    ),
    ServiceCategory(
      title: 'Fashion',
      subtitle: 'Beli & antre brand favorit',
      icon: Icons.checkroom_rounded,
      color: Color(0xFFEC4899),
      route: AppRoutes.fashionService,
      emoji: '👕',
    ),
    ServiceCategory(
      title: 'Culinary',
      subtitle: 'Antre makanan & takeaway',
      icon: Icons.restaurant_rounded,
      color: Color(0xFFF59E0B),
      route: AppRoutes.culinaryService,
      emoji: '🍔',
    ),
    ServiceCategory(
      title: 'Public Service',
      subtitle: 'Samsat, BPJS, imigrasi',
      icon: Icons.apartment_rounded,
      color: Color(0xFF8B5CF6),
      route: AppRoutes.publicService,
      emoji: '🏢',
    ),
    ServiceCategory(
      title: 'Event Ticket',
      subtitle: 'Konser, festival, tiket',
      icon: Icons.confirmation_number_rounded,
      color: Color(0xFF9C4DCC),
      route: AppRoutes.eventTickets,
      emoji: '🎫',
    ),
  ];

  static const hospitalServices = <String>[
    'Take Medicine',
    'Hospital Registration',
    'Payment',
    'Administration',
    'Take Laboratory Result',
  ];

  static const hospitals = <Hospital>[
    Hospital(
      id: 'hosp_001',
      name: 'RS Cipto Mangunkusumo',
      address: 'Jl. Diponegoro No. 71, Senen, Jakarta Pusat',
      district: 'Jakarta Pusat',
      phone: '(021) 1500135',
      rating: 4.9,
      photoUrl: '',
      departments: hospitalServices,
    ),
    Hospital(
      id: 'hosp_002',
      name: 'RS Fatmawati',
      address: 'Jl. RS Fatmawati Raya, Cilandak, Jakarta Selatan',
      district: 'Jakarta Selatan',
      phone: '(021) 7501524',
      rating: 4.7,
      photoUrl: '',
      departments: hospitalServices,
    ),
    Hospital(
      id: 'hosp_003',
      name: 'RS Persahabatan',
      address: 'Jl. Persahabatan Raya No. 1, Rawamangun, Jakarta Timur',
      district: 'Jakarta Timur',
      phone: '(021) 4891708',
      rating: 4.8,
      photoUrl: '',
      departments: hospitalServices,
    ),
    Hospital(
      id: 'hosp_004',
      name: 'RS Harapan Kita',
      address: 'Jl. S. Parman Kav. 87, Slipi, Jakarta Barat',
      district: 'Jakarta Barat',
      phone: '(021) 5668282',
      rating: 4.8,
      photoUrl: '',
      departments: hospitalServices,
    ),
    Hospital(
      id: 'hosp_005',
      name: 'RS Hermina',
      address: 'Jl. HBR Motik Blok B-10, Kemayoran, Jakarta Pusat',
      district: 'Jakarta Pusat',
      phone: '(021) 4208888',
      rating: 4.7,
      photoUrl: '',
      departments: hospitalServices,
    ),
    Hospital(
      id: 'hosp_006',
      name: 'RS Mitra Keluarga',
      address: 'Jl. Raya Jatinegara Timur No. 126, Jakarta Timur',
      district: 'Jakarta Timur',
      phone: '(021) 86901600',
      rating: 4.6,
      photoUrl: '',
      departments: hospitalServices,
    ),
    Hospital(
      id: 'hosp_007',
      name: 'RS Pondok Indah',
      address: 'Jl. Metro Pondok Indah Kav. II, Jakarta Selatan',
      district: 'Jakarta Selatan',
      phone: '(021) 7654321',
      rating: 4.9,
      photoUrl: '',
      departments: hospitalServices,
    ),
    Hospital(
      id: 'hosp_008',
      name: 'RS Siloam',
      address: 'Jl. Siloam No. 6, Kebon Jeruk, Jakarta Barat',
      district: 'Jakarta Barat',
      phone: '(021) 25677888',
      rating: 4.8,
      photoUrl: '',
      departments: hospitalServices,
    ),
  ];

  static const fashionBrandNames = <String>[
    'Nike',
    'Adidas',
    'Uniqlo',
    'H&M',
    'Zara',
    'Erigo',
    'Eiger',
  ];

  static const fashionBrands = <FashionBrand>[
    FashionBrand(
      id: 'brand_nike',
      name: 'Nike',
      logoUrl: '',
      services: [
        FashionService(
          id: 'svc_nike',
          type: 'Purchase',
          description: 'Beli produk Nike',
          fee: 50000,
        ),
      ],
    ),
    FashionBrand(
      id: 'brand_adidas',
      name: 'Adidas',
      logoUrl: '',
      services: [
        FashionService(
          id: 'svc_adidas',
          type: 'Purchase',
          description: 'Beli produk Adidas',
          fee: 50000,
        ),
      ],
    ),
    FashionBrand(
      id: 'brand_uniqlo',
      name: 'Uniqlo',
      logoUrl: '',
      services: [
        FashionService(
          id: 'svc_uniqlo',
          type: 'Purchase',
          description: 'Beli produk Uniqlo',
          fee: 40000,
        ),
      ],
    ),
    FashionBrand(
      id: 'brand_hm',
      name: 'H&M',
      logoUrl: '',
      services: [
        FashionService(
          id: 'svc_hm',
          type: 'Purchase',
          description: 'Beli produk H&M',
          fee: 40000,
        ),
      ],
    ),
    FashionBrand(
      id: 'brand_zara',
      name: 'Zara',
      logoUrl: '',
      services: [
        FashionService(
          id: 'svc_zara',
          type: 'Purchase',
          description: 'Beli produk Zara',
          fee: 55000,
        ),
      ],
    ),
    FashionBrand(
      id: 'brand_erigo',
      name: 'Erigo',
      logoUrl: '',
      services: [
        FashionService(
          id: 'svc_erigo',
          type: 'Purchase',
          description: 'Beli produk Erigo',
          fee: 35000,
        ),
      ],
    ),
    FashionBrand(
      id: 'brand_eiger',
      name: 'Eiger',
      logoUrl: '',
      services: [
        FashionService(
          id: 'svc_eiger',
          type: 'Purchase',
          description: 'Beli produk Eiger',
          fee: 35000,
        ),
      ],
    ),
  ];

  static const publicServiceTypes = <String>[
    'Queue',
    'Payment',
    'Document Processing',
  ];

  static const publicServices = <PublicServiceLocation>[
    PublicServiceLocation(
      id: 'pub_samsat',
      name: 'Samsat',
      address: 'Jl. Raya Pasar Minggu KM 18, Jakarta Selatan',
      city: 'Jakarta Selatan',
      phone: '(021) 78849000',
      services: [
        PublicServiceType(
          id: 'pub_samsat_queue',
          name: 'Queue',
          fee: 50000,
          estimatedWaitTime: 60,
          description: 'Antre layanan Samsat',
        ),
        PublicServiceType(
          id: 'pub_samsat_payment',
          name: 'Payment',
          fee: 50000,
          estimatedWaitTime: 30,
          description: 'Bayar pajak kendaraan',
        ),
      ],
    ),
    PublicServiceLocation(
      id: 'pub_bpjs',
      name: 'BPJS',
      address: 'Jl. Letjen Suprapto Kav. 69, Jakarta Pusat',
      city: 'Jakarta Pusat',
      phone: '(021) 4240750',
      services: [
        PublicServiceType(
          id: 'pub_bpjs_doc',
          name: 'Document Processing',
          fee: 40000,
          estimatedWaitTime: 45,
          description: 'Pengurusan dokumen BPJS',
        ),
      ],
    ),
    PublicServiceLocation(
      id: 'pub_immigration',
      name: 'Immigration',
      address: 'Jl. H. R. Rasuna Said Kav. 8-9, Jakarta Selatan',
      city: 'Jakarta Selatan',
      phone: '(021) 5224657',
      services: [
        PublicServiceType(
          id: 'pub_immigration_queue',
          name: 'Queue',
          fee: 75000,
          estimatedWaitTime: 90,
          description: 'Antre imigrasi',
        ),
      ],
    ),
    PublicServiceLocation(
      id: 'pub_pln',
      name: 'PLN',
      address: 'Jl. Trunojoyo Blok M I No. 135, Jakarta Selatan',
      city: 'Jakarta Selatan',
      phone: '123',
      services: [
        PublicServiceType(
          id: 'pub_pln_payment',
          name: 'Payment',
          fee: 35000,
          estimatedWaitTime: 30,
          description: 'Bayar tagihan listrik',
        ),
      ],
    ),
    PublicServiceLocation(
      id: 'pub_tax',
      name: 'Tax Office',
      address: 'Jl. Gatot Subroto Kav. 40-41, Jakarta Selatan',
      city: 'Jakarta Selatan',
      phone: '(021) 5250208',
      services: [
        PublicServiceType(
          id: 'pub_tax_doc',
          name: 'Document Processing',
          fee: 60000,
          estimatedWaitTime: 60,
          description: 'Pengurusan pajak',
        ),
      ],
    ),
    PublicServiceLocation(
      id: 'pub_dukcapil',
      name: 'Dukcapil',
      address: 'Jl. Medan Merdeka Barat No. 8, Jakarta Pusat',
      city: 'Jakarta Pusat',
      phone: '(021) 3451691',
      services: [
        PublicServiceType(
          id: 'pub_dukcapil_queue',
          name: 'Queue',
          fee: 45000,
          estimatedWaitTime: 45,
          description: 'Antre layanan kependudukan',
        ),
      ],
    ),
  ];

  static const culinaryServices = <CulinaryService>[];

  static const eventServiceTypes = <String>[
    'Ticket War',
    'Bracelet Exchange',
    'Merchandise Queue',
    'Event Check-in',
  ];

  static final events = <Event>[
    Event(
      id: 'event_wtf',
      name: 'We The Fest',
      date: DateTime(2026, 8, 15),
      venue: 'JIExpo Kemayoran, Jakarta',
      posterUrl: '',
      services: const [
        EventService(
          id: 'evt_wtf_ticket',
          type: 'ticket_war',
          description: 'War tiket We The Fest',
          fee: 75000,
          estimatedWaitTime: 120,
        ),
        EventService(
          id: 'evt_wtf_bracelet',
          type: 'bracelet_exchange',
          description: 'Tukar gelang masuk',
          fee: 25000,
          estimatedWaitTime: 30,
        ),
        EventService(
          id: 'evt_wtf_merch',
          type: 'merchandise_queue',
          description: 'Antre merchandise',
          fee: 35000,
          estimatedWaitTime: 60,
        ),
        EventService(
          id: 'evt_wtf_checkin',
          type: 'event_checkin',
          description: 'Check-in event',
          fee: 20000,
          estimatedWaitTime: 20,
        ),
      ],
    ),
    Event(
      id: 'event_jazz',
      name: 'Java Jazz',
      date: DateTime(2026, 3, 1),
      venue: 'JIExpo Kemayoran, Jakarta',
      posterUrl: '',
      services: const [
        EventService(
          id: 'evt_jazz_ticket',
          type: 'ticket_war',
          description: 'War tiket Java Jazz',
          fee: 75000,
          estimatedWaitTime: 90,
        ),
        EventService(
          id: 'evt_jazz_bracelet',
          type: 'bracelet_exchange',
          description: 'Tukar gelang masuk',
          fee: 25000,
          estimatedWaitTime: 25,
        ),
      ],
    ),
    Event(
      id: 'event_pestapora',
      name: 'Pestapora',
      date: DateTime(2026, 9, 20),
      venue: 'Gambir Expo, Jakarta',
      posterUrl: '',
      services: const [
        EventService(
          id: 'evt_pesta_merch',
          type: 'merchandise_queue',
          description: 'Antre merchandise',
          fee: 35000,
          estimatedWaitTime: 45,
        ),
      ],
    ),
    Event(
      id: 'event_dwp',
      name: 'DWP',
      date: DateTime(2026, 12, 10),
      venue: 'JIExpo Kemayoran, Jakarta',
      posterUrl: '',
      services: const [
        EventService(
          id: 'evt_dwp_ticket',
          type: 'ticket_war',
          description: 'War tiket DWP',
          fee: 80000,
          estimatedWaitTime: 120,
        ),
      ],
    ),
    Event(
      id: 'event_hammersonic',
      name: 'Hammersonic',
      date: DateTime(2026, 5, 17),
      venue: 'Gelora Bung Karno, Jakarta',
      posterUrl: '',
      services: const [
        EventService(
          id: 'evt_hammer_ticket',
          type: 'ticket_war',
          description: 'War tiket Hammersonic',
          fee: 85000,
          estimatedWaitTime: 150,
        ),
        EventService(
          id: 'evt_hammer_checkin',
          type: 'event_checkin',
          description: 'Check-in event',
          fee: 20000,
          estimatedWaitTime: 20,
        ),
      ],
    ),
  ];

  static const order = QueueOrder(
    id: 'order_active',
    location: 'RS Cipto Mangunkusumo',
    address: 'Jl. Diponegoro No. 71, Senen, Jakarta Pusat',
    service: 'Take Medicine',
    date: '30 Jun 2026',
    time: '09:00',
    queueNumber: 'A-023',
    estimateMinutes: 35,
    mitraName: 'Budi Santoso',
    totalPayment: 105000,
    status: OrderDisplayStatus.onTheWay,
    category: 'Hospital',
  );

  static const mitra = Mitra(
    id: 'mitra_001',
    name: 'Budi Santoso',
    rating: 4.9,
    finishedOrders: 128,
    distanceKm: 2.1,
    verified: true,
    photoUrl: '',
    isOnline: true,
    phone: '6281234567890',
    vehicleNumber: 'B 1234 ABC',
  );

  static const List<Mitra> mitras = [mitra];

  static const List<String> activeSteps = [
    'Mitra berangkat',
    'Ambil nomor',
    'Menunggu',
    'Giliran Anda',
  ];

  static final wallet = Wallet(
    balance: 250000,
    totalEarned: 1250000,
    transactions: [
      Transaction(
        id: 'tx_001',
        type: 'credit',
        amount: 500000,
        description: 'Top Up Saldo',
        timestamp: DateTime(2026, 6, 28, 10, 30),
      ),
      Transaction(
        id: 'tx_002',
        type: 'debit',
        amount: 105000,
        description: 'Pesanan RS Cipto Mangunkusumo',
        timestamp: DateTime(2026, 6, 27, 14, 15),
      ),
      Transaction(
        id: 'tx_003',
        type: 'credit',
        amount: 750000,
        description: 'Penghasilan Mitra',
        timestamp: DateTime(2026, 6, 25, 18, 0),
      ),
      Transaction(
        id: 'tx_004',
        type: 'debit',
        amount: 50000,
        description: 'Pesanan Fashion Nike',
        timestamp: DateTime(2026, 6, 24, 11, 45),
      ),
    ],
  );

  static final List<QueueOrder> orderHistory = [
    const QueueOrder(
      id: 'order_001',
      location: 'RS Cipto Mangunkusumo',
      address: 'Jl. Diponegoro No. 71, Senen, Jakarta Pusat',
      service: 'Take Medicine',
      date: '28 Jun 2026',
      time: '09:00',
      queueNumber: 'A-023',
      estimateMinutes: 35,
      mitraName: 'Budi Santoso',
      totalPayment: 105000,
      status: OrderDisplayStatus.onTheWay,
      category: 'Hospital',
    ),
    const QueueOrder(
      id: 'order_002',
      location: 'Samsat',
      address: 'Jl. Raya Pasar Minggu KM 18, Jakarta Selatan',
      service: 'Queue',
      date: '25 Jun 2026',
      time: '08:00',
      queueNumber: 'B-045',
      estimateMinutes: 60,
      mitraName: 'Siti Rahayu',
      totalPayment: 75000,
      status: OrderDisplayStatus.accepted,
      category: 'Public Service',
    ),
    const QueueOrder(
      id: 'order_003',
      location: 'We The Fest',
      address: 'JIExpo Kemayoran, Jakarta',
      service: 'Ticket War',
      date: '20 Jun 2026',
      time: '06:00',
      queueNumber: 'E-012',
      estimateMinutes: 120,
      mitraName: 'Ahmad Wijaya',
      totalPayment: 175000,
      status: OrderDisplayStatus.completed,
      category: 'Event Ticket',
    ),
    const QueueOrder(
      id: 'order_004',
      location: 'Nike Store',
      address: 'Grand Indonesia, Jakarta Pusat',
      service: 'Purchase',
      date: '18 Jun 2026',
      time: '14:30',
      queueNumber: 'F-008',
      estimateMinutes: 45,
      mitraName: 'Dewi Lestari',
      totalPayment: 50000,
      status: OrderDisplayStatus.waiting,
      category: 'Fashion',
    ),
    const QueueOrder(
      id: 'order_005',
      location: 'Warung Padang Sederhana',
      address: 'Jl. Sudirman No. 45, Jakarta Pusat',
      service: 'Takeaway',
      date: '15 Jun 2026',
      time: '12:30',
      queueNumber: 'C-012',
      estimateMinutes: 20,
      mitraName: 'Rizky Pratama',
      totalPayment: 35000,
      status: OrderDisplayStatus.cancelled,
      category: 'Culinary',
    ),
  ];
}
