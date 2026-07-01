import 'package:flutter/material.dart';

import '../app/app_scope.dart';
import '../core/app_colors.dart';
import '../core/app_routes.dart';
import '../dummy/dummy_data.dart';
import '../widgets/app_card.dart';
import '../widgets/app_logo.dart';
import '../widgets/app_motion.dart';
import '../widgets/category_card.dart';
import '../widgets/gradient_background.dart';
import '../widgets/section_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final app = AppScope.watch(context);
    final isWide = MediaQuery.sizeOf(context).width >= 600;

    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 28),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 760),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeSlideIn(
                      child: Row(
                        children: [
                          const Expanded(
                            child: AppLogo(compact: true, center: false),
                          ),
                          _IconAction(
                            tooltip: 'Notifikasi',
                            icon: Icons.notifications_none_rounded,
                            onTap: () =>
                                ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Belum ada notifikasi baru'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 28),
                    FadeSlideIn(
                      delay: const Duration(milliseconds: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Halo, Ardi',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            'Apa yang bisa kami bantu hari ini?',
                            style: TextStyle(color: AppColors.subtext),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    FadeSlideIn(
                      delay: const Duration(milliseconds: 80),
                      child: _PrimaryAction(
                        onTap: () =>
                            Navigator.pushNamed(context, AppRoutes.booking),
                      ),
                    ),
                    if (app.hasOrder) ...[
                      const SizedBox(height: 28),
                      const SectionHeader(title: 'Pesanan aktif'),
                      const SizedBox(height: 12),
                      FadeSlideIn(
                        delay: const Duration(milliseconds: 110),
                        child: _ActiveOrderCard(
                          location: app.order.location,
                          status: app.statusLabel,
                          queueNumber: app.order.queueNumber,
                          onTap: () => Navigator.pushNamed(
                            context,
                            AppRoutes.tracking,
                          ),
                        ),
                      ),
                    ],
                    const SizedBox(height: 28),
                    const SectionHeader(title: 'Pilih layanan'),
                    const SizedBox(height: 12),
                    FadeSlideIn(
                      delay: const Duration(milliseconds: 140),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: DummyData.categories.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: isWide ? 3 : 2,
                          childAspectRatio: isWide ? 1.45 : 1.25,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemBuilder: (context, index) {
                          final category = DummyData.categories[index];
                          return CategoryCard(
                            category: category,
                            onTap: () =>
                                Navigator.pushNamed(context, category.route),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _PrimaryAction extends StatelessWidget {
  const _PrimaryAction({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onTap: onTap,
      color: AppColors.primary,
      borderColor: AppColors.primary,
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Antrean selesai tanpa menunggu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    height: 1.18,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Pilih layanan, mitra kami yang antre untuk Anda.',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: .8),
                    fontSize: 13,
                    height: 1.35,
                  ),
                ),
                const SizedBox(height: 18),
                const Row(
                  children: [
                    Text(
                      'Pesan Mitra Sekarang',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(width: 7),
                    Icon(
                      Icons.arrow_forward_rounded,
                      color: Colors.white,
                      size: 18,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Container(
            width: 58,
            height: 58,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: .12),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(
              Icons.schedule_rounded,
              color: Colors.white,
              size: 29,
            ),
          ),
        ],
      ),
    );
  }
}

class _ActiveOrderCard extends StatelessWidget {
  const _ActiveOrderCard({
    required this.location,
    required this.status,
    required this.queueNumber,
    required this.onTap,
  });

  final String location;
  final String status;
  final String queueNumber;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onTap: onTap,
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: AppColors.mint,
              borderRadius: BorderRadius.circular(14),
            ),
            alignment: Alignment.center,
            child: Text(
              queueNumber,
              style: const TextStyle(
                color: AppColors.primaryDark,
                fontWeight: FontWeight.w900,
                fontSize: 11,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  location,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: AppColors.navy,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  status,
                  style: const TextStyle(
                    color: AppColors.subtext,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right_rounded, color: AppColors.subtext),
        ],
      ),
    );
  }
}

class _IconAction extends StatelessWidget {
  const _IconAction({
    required this.tooltip,
    required this.icon,
    required this.onTap,
  });

  final String tooltip;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: tooltip,
      onPressed: onTap,
      style: IconButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: AppColors.navy,
        side: const BorderSide(color: AppColors.border),
        minimumSize: const Size(44, 44),
      ),
      icon: Icon(icon),
    );
  }
}
