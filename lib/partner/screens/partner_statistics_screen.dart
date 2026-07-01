import 'package:flutter/material.dart';

import '../../core/app_colors.dart';
import '../../utils/currency_formatter.dart';
import '../../widgets/app_motion.dart';
import '../partner_scope.dart';
import '../widgets/partner_stat_card.dart';

class PartnerStatisticsScreen extends StatelessWidget {
  const PartnerStatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final driver = PartnerScope.watch(context).driver;

    return Scaffold(
      appBar: AppBar(title: const Text('Statistik kerja')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
        children: [
          const FadeSlideIn(
            child: Text(
              'Kinerja yang terlihat,\nkeputusan yang lebih jelas.',
              maxLines: 2,
              style: TextStyle(
                color: AppColors.navy,
                fontSize: 28,
                height: 1.06,
                letterSpacing: -.8,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 22),
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColors.navy,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: AppColors.navy.withValues(alpha: .18),
                  blurRadius: 34,
                  offset: const Offset(0, 16),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Pendapatan bulan ini',
                  style: TextStyle(color: Colors.white60),
                ),
                const SizedBox(height: 8),
                Text(
                  CurrencyFormatter.rupiah(driver.monthlyIncome),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    letterSpacing: -1,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 1.08,
            children: [
              PartnerStatCard(
                title: 'Pesanan hari ini',
                value: '${driver.todayOrders}',
                icon: Icons.receipt_long_outlined,
              ),
              PartnerStatCard(
                title: 'Pesanan selesai',
                value: '${driver.completedOrders}',
                icon: Icons.check_circle_outline_rounded,
                color: AppColors.success,
              ),
              PartnerStatCard(
                title: 'Dibatalkan',
                value: '${driver.cancelledOrders}',
                icon: Icons.cancel_outlined,
                color: AppColors.danger,
              ),
              PartnerStatCard(
                title: 'Acceptance rate',
                value: '${driver.acceptanceRate}%',
                icon: Icons.trending_up_rounded,
              ),
              PartnerStatCard(
                title: 'Rating',
                value: driver.rating.toStringAsFixed(1),
                icon: Icons.star_outline_rounded,
                color: AppColors.warning,
              ),
              PartnerStatCard(
                title: 'Pendapatan hari ini',
                value: CurrencyFormatter.rupiah(driver.todayIncome),
                icon: Icons.payments_outlined,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
