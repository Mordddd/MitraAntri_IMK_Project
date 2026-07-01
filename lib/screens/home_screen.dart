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
            padding: const EdgeInsets.fromLTRB(20, 18, 20, 36),
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
                    const SizedBox(height: 42),
                    FadeSlideIn(
                      delay: const Duration(milliseconds: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text.rich(
                            const TextSpan(
                              children: [
                                TextSpan(text: 'Waktu Anda untuk '),
                                TextSpan(
                                  text: 'hal yang penting.',
                                  style: TextStyle(
                                    color: AppColors.primaryDark,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            style: Theme.of(context).textTheme.headlineLarge,
                            maxLines: 3,
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            'Halo, Ardi. Serahkan antreannya kepada mitra kami.',
                            style: TextStyle(
                              color: AppColors.subtext,
                              fontSize: 15,
                              height: 1.45,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 26),
                    FadeSlideIn(
                      delay: const Duration(milliseconds: 80),
                      child: _PrimaryAction(
                        onTap: () =>
                            Navigator.pushNamed(context, AppRoutes.booking),
                      ),
                    ),
                    if (app.hasOrder) ...[
                      const SizedBox(height: 36),
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
                    const SizedBox(height: 42),
                    const SectionHeader(title: 'Layanan untuk hari ini'),
                    const SizedBox(height: 16),
                    FadeSlideIn(
                      delay: const Duration(milliseconds: 140),
                      child: Column(
                        children: [
                          SizedBox(
                            height: isWide ? 164 : 148,
                            child: CategoryCard(
                              category: DummyData.categories.first,
                              featured: true,
                              onTap: () => Navigator.pushNamed(
                                context,
                                DummyData.categories.first.route,
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: DummyData.categories.length - 1,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: isWide ? 4 : 2,
                              childAspectRatio: isWide ? 1.2 : 1.05,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12,
                            ),
                            itemBuilder: (context, index) {
                              final category = DummyData.categories[index + 1];
                              return CategoryCard(
                                category: category,
                                onTap: () => Navigator.pushNamed(
                                  context,
                                  category.route,
                                ),
                              );
                            },
                          ),
                        ],
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
      color: AppColors.navy,
      borderColor: AppColors.navy2,
      radius: 30,
      padding: EdgeInsets.zero,
      child: Stack(
        children: [
          Positioned(
            right: -38,
            top: -46,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primary.withValues(alpha: .42),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 26, 22, 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Kami yang mengantre.\nAnda tetap melaju.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.7,
                    height: 1.08,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Pilih tujuan, atur jadwal, lalu pantau prosesnya langsung.',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: .68),
                    fontSize: 14,
                    height: 1.45,
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(18, 10, 6, 10),
                      decoration: BoxDecoration(
                        color: AppColors.card,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Row(
                        children: [
                          Text(
                            'Pesan Mitra Sekarang',
                            style: TextStyle(
                              color: AppColors.navy,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(width: 12),
                          CircleAvatar(
                            radius: 16,
                            backgroundColor: AppColors.primary,
                            child: Icon(
                              Icons.arrow_outward_rounded,
                              color: Colors.white,
                              size: 17,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
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
        backgroundColor: AppColors.card,
        foregroundColor: AppColors.navy,
        side: BorderSide(color: Colors.white.withValues(alpha: .8)),
        minimumSize: const Size(44, 44),
      ),
      icon: Icon(icon),
    );
  }
}
