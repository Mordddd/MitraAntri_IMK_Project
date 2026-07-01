import 'package:flutter/material.dart';

import '../../core/app_colors.dart';
import '../../utils/currency_formatter.dart';
import '../partner_scope.dart';
import '../widgets/partner_stat_card.dart';

class PartnerStatisticsScreen extends StatelessWidget {
  const PartnerStatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final driver = PartnerScope.watch(context).driver;

    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(title: const Text('Statistik')),
      body: GridView(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 1.2,
        ),
        children: [
          PartnerStatCard(
            title: 'Pesanan Hari Ini',
            value: '${driver.todayOrders}',
            icon: Icons.receipt_long_rounded,
          ),
          PartnerStatCard(
            title: 'Pesanan Selesai',
            value: '${driver.completedOrders}',
            icon: Icons.check_circle_rounded,
            color: AppColors.success,
          ),
          PartnerStatCard(
            title: 'Pesanan Dibatalkan',
            value: '${driver.cancelledOrders}',
            icon: Icons.cancel_rounded,
            color: AppColors.danger,
          ),
          PartnerStatCard(
            title: 'Acceptance Rate',
            value: '${driver.acceptanceRate}%',
            icon: Icons.trending_up_rounded,
            color: AppColors.blue,
          ),
          PartnerStatCard(
            title: 'Rating',
            value: driver.rating.toStringAsFixed(1),
            icon: Icons.star_rounded,
            color: AppColors.warning,
          ),
          PartnerStatCard(
            title: 'Pendapatan Hari Ini',
            value: CurrencyFormatter.rupiah(driver.todayIncome),
            icon: Icons.payments_rounded,
          ),
          PartnerStatCard(
            title: 'Pendapatan Minggu Ini',
            value: CurrencyFormatter.rupiah(driver.weeklyIncome),
            icon: Icons.calendar_view_week_rounded,
            color: AppColors.blue,
          ),
        ],
      ),
    );
  }
}
