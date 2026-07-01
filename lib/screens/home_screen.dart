import 'package:flutter/material.dart';
<<<<<<< HEAD

import '../app/app_scope.dart';
import '../core/app_colors.dart';
import '../core/app_routes.dart';
import '../dummy/dummy_data.dart';
import '../widgets/app_card.dart';
import '../widgets/app_logo.dart';
import '../widgets/category_card.dart';
import '../widgets/gradient_background.dart';
import '../widgets/info_chip.dart';
=======
import '../app/app_scope.dart';
import '../core/app_colors.dart';
import '../core/app_routes.dart';
import '../data/dummy_data.dart';
import '../widgets/app_card.dart';
import '../widgets/app_logo.dart';
import '../widgets/bottom_nav.dart';
import '../widgets/category_card.dart';
import '../widgets/gradient_background.dart';
import '../widgets/info_chip.dart';
import '../widgets/primary_button.dart';
>>>>>>> e779af82024cf7b88993b7a681383685aaa57ba5
import '../widgets/section_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

<<<<<<< HEAD
  void _openCategory(BuildContext context, String route) {
    Navigator.pushNamed(context, route);
  }

  @override
  Widget build(BuildContext context) {
    final app = AppScope.watch(context);
    final isWide = MediaQuery.sizeOf(context).width >= 600;
    final crossAxisCount = isWide ? 3 : 2;

=======
  @override
  Widget build(BuildContext context) {
    final app = AppScope.watch(context);
>>>>>>> e779af82024cf7b88993b7a681383685aaa57ba5
    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          bottom: false,
<<<<<<< HEAD
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 18, 20, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Expanded(
                      child: AppLogo(compact: true, center: false),
                    ),
                    _RoundIconButton(
                      icon: Icons.notifications_none_rounded,
                      onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Belum ada notifikasi baru')),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Text(
                  'Hello User 👋',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 4),
                const Text(
                  'Mau antre di mana hari ini?',
                  style: TextStyle(
                    color: AppColors.subtext,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 18),
                const Row(
                  children: [
                    InfoChip(
                      icon: Icons.verified_user_rounded,
                      label: 'Mitra terpercaya',
                    ),
                    SizedBox(width: 8),
                    InfoChip(
                      icon: Icons.location_on_rounded,
                      label: 'Real-time',
                      color: AppColors.blue,
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                const SectionHeader(title: 'Kategori Layanan'),
                const SizedBox(height: 12),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: DummyData.categories.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    childAspectRatio: isWide ? 1.5 : 1.35,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemBuilder: (context, index) {
                    final category = DummyData.categories[index];
                    return CategoryCard(
                      category: category,
                      onTap: () => _openCategory(context, category.route),
                    );
                  },
                ),
                const SizedBox(height: 22),
                _PromoBanner(
                  onTap: () => _openCategory(context, AppRoutes.hospitalList),
                ),
                if (app.hasOrder) ...[
                  const SizedBox(height: 22),
                  const SectionHeader(title: 'Pesanan Aktif'),
                  const SizedBox(height: 12),
                  AppCard(
                    onTap: () =>
                        Navigator.pushNamed(context, AppRoutes.tracking),
                    padding: const EdgeInsets.all(14),
                    child: Row(
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: AppColors.mint,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Icon(
                            Icons.local_hospital_rounded,
                            color: AppColors.primary,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                app.order.location,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w900,
                                  color: AppColors.navy,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                app.statusLabel,
                                style: const TextStyle(
                                  color: AppColors.subtext,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Icon(
                          Icons.chevron_right_rounded,
                          color: AppColors.subtext,
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
=======
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(20, 18, 20, 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Expanded(
                              child: AppLogo(compact: true, center: false)),
                          _RoundIconButton(
                              icon: Icons.notifications_none_rounded,
                              onTap: () => _showMessage(
                                  context, 'Belum ada notifikasi baru.')),
                        ],
                      ),
                      const SizedBox(height: 24),
                      Text('Halo, Ardi! 👋',
                          style: Theme.of(context).textTheme.headlineSmall),
                      const SizedBox(height: 4),
                      const Text('Mau antre di mana hari ini?',
                          style: TextStyle(
                              color: AppColors.subtext,
                              fontWeight: FontWeight.w700)),
                      const SizedBox(height: 18),
                      _SearchBox(
                          onTap: () =>
                              Navigator.pushNamed(context, AppRoutes.booking)),
                      const SizedBox(height: 20),
                      const Row(
                        children: [
                          InfoChip(
                              icon: Icons.verified_user_rounded,
                              label: 'Mitra terpercaya'),
                          SizedBox(width: 8),
                          InfoChip(
                              icon: Icons.location_on_rounded,
                              label: 'Real-time',
                              color: AppColors.blue),
                        ],
                      ),
                      const SizedBox(height: 24),
                      SectionHeader(
                          title: 'Kategori Layanan',
                          actionText: 'Lihat semua',
                          onAction: () =>
                              Navigator.pushNamed(context, AppRoutes.booking)),
                      const SizedBox(height: 12),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: DummyData.categories.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.35,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                        ),
                        itemBuilder: (context, index) {
                          return CategoryCard(
                            category: DummyData.categories[index],
                            onTap: () =>
                                Navigator.pushNamed(context, AppRoutes.booking),
                          );
                        },
                      ),
                      const SizedBox(height: 22),
                      _PromoBanner(
                          onTap: () =>
                              Navigator.pushNamed(context, AppRoutes.booking)),
                      const SizedBox(height: 22),
                      SectionHeader(
                          title: app.hasOrder
                              ? 'Pesanan Aktif'
                              : 'Rekomendasi Cepat'),
                      const SizedBox(height: 12),
                      AppCard(
                        onTap: () => Navigator.pushNamed(
                          context,
                          app.hasOrder ? AppRoutes.tracking : AppRoutes.booking,
                        ),
                        padding: const EdgeInsets.all(14),
                        child: Row(
                          children: [
                            Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                color: AppColors.mint,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: const Icon(Icons.local_hospital_rounded,
                                  color: AppColors.teal),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      app.hasOrder
                                          ? app.order.location
                                          : 'RSUD Kota Bandung',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w900,
                                          color: AppColors.navy)),
                                  const SizedBox(height: 4),
                                  Text(
                                      app.hasOrder
                                          ? app.statusLabel
                                          : 'Antrean biasanya ramai pukul 08.00 - 11.00',
                                      style: const TextStyle(
                                          color: AppColors.subtext,
                                          fontSize: 12)),
                                ],
                              ),
                            ),
                            const Icon(Icons.chevron_right_rounded,
                                color: AppColors.subtext),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              MockBottomNav(
                currentIndex: 0,
                items: const [
                  BottomNavItem(icon: Icons.home_rounded, label: 'Beranda'),
                  BottomNavItem(
                      icon: Icons.receipt_long_rounded, label: 'Pesanan'),
                  BottomNavItem(icon: Icons.chat_bubble_rounded, label: 'Chat'),
                  BottomNavItem(icon: Icons.person_rounded, label: 'Akun'),
                ],
                onTap: (index) {
                  if (index == 1) {
                    if (app.hasOrder) {
                      Navigator.pushNamed(context, AppRoutes.tracking);
                    } else {
                      _showMessage(context, 'Belum ada pesanan aktif.');
                    }
                  } else if (index == 3) {
                    Navigator.pushNamedAndRemoveUntil(
                        context, AppRoutes.onboarding, (_) => false);
                  } else if (index == 2) {
                    _showMessage(context, 'Belum ada percakapan aktif.');
                  }
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.pushNamed(context, AppRoutes.booking),
        backgroundColor: AppColors.teal,
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add_rounded),
        label: const Text('Pesan Mitra',
            style: TextStyle(fontWeight: FontWeight.w900)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }
}

class _SearchBox extends StatelessWidget {
  const _SearchBox({required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 54,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.border),
          boxShadow: [
            BoxShadow(
                color: AppColors.navy.withValues(alpha: .05),
                blurRadius: 16,
                offset: const Offset(0, 8))
          ],
        ),
        child: const Row(
          children: [
            Icon(Icons.search_rounded, color: AppColors.subtext),
            SizedBox(width: 10),
            Expanded(
                child: Text('Cari layanan atau lokasi...',
                    style: TextStyle(
                        color: AppColors.subtext,
                        fontWeight: FontWeight.w600))),
            Icon(Icons.tune_rounded, color: AppColors.teal),
          ],
        ),
      ),
>>>>>>> e779af82024cf7b88993b7a681383685aaa57ba5
    );
  }
}

class _PromoBanner extends StatelessWidget {
  const _PromoBanner({required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(28),
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFFEAF7FF), Color(0xFFE8FAF5)],
          ),
          borderRadius: BorderRadius.circular(28),
          border: Border.all(color: Colors.white),
          boxShadow: AppColors.cardShadow,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Butuh bantuan antre?',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w900,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Pesan Mitra Sekarang',
                    style: TextStyle(
                      color: AppColors.navy,
                      fontSize: 19,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'RS, fashion, kuliner, layanan publik & event.',
                    style: TextStyle(
                      color: AppColors.subtext,
                      fontSize: 12,
                      height: 1.35,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Container(
              width: 88,
              height: 88,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.75),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.bolt_rounded,
                color: AppColors.primary,
                size: 46,
              ),
            ),
          ],
        ),
=======
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
            colors: [Color(0xFFEAF7FF), Color(0xFFE8FAF5)]),
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: Colors.white),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Mau lebih hemat?',
                    style: TextStyle(
                        color: AppColors.blue,
                        fontWeight: FontWeight.w900,
                        fontSize: 13)),
                const SizedBox(height: 4),
                const Text('Langganan Mitra+',
                    style: TextStyle(
                        color: AppColors.navy,
                        fontSize: 19,
                        fontWeight: FontWeight.w900)),
                const SizedBox(height: 6),
                const Text('Dapatkan diskon dan prioritas pemesanan.',
                    style: TextStyle(
                        color: AppColors.subtext, fontSize: 12, height: 1.35)),
                const SizedBox(height: 14),
                PrimaryButton(
                    text: 'Coba Sekarang',
                    fullWidth: false,
                    height: 42,
                    onPressed: onTap),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Container(
            width: 88,
            height: 88,
            decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: .75),
                shape: BoxShape.circle),
            child: const Icon(Icons.percent_rounded,
                color: AppColors.teal, size: 46),
          ),
        ],
>>>>>>> e779af82024cf7b88993b7a681383685aaa57ba5
      ),
    );
  }
}

class _RoundIconButton extends StatelessWidget {
  const _RoundIconButton({required this.icon, required this.onTap});
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Container(
        width: 46,
        height: 46,
        decoration: BoxDecoration(
<<<<<<< HEAD
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.border),
        ),
=======
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.border)),
>>>>>>> e779af82024cf7b88993b7a681383685aaa57ba5
        child: Icon(icon, color: AppColors.navy),
      ),
    );
  }
}
