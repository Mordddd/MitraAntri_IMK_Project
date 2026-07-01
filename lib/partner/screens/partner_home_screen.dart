import 'package:flutter/material.dart';

import '../../core/app_colors.dart';
import '../../utils/currency_formatter.dart';
import '../../utils/snackbar_helper.dart';
import '../../core/app_routes.dart';
import '../partner_scope.dart';
import '../widgets/partner_glass_header.dart';
import '../widgets/partner_incoming_order_card.dart';
import '../widgets/partner_online_switch.dart';
import '../widgets/partner_shimmer.dart';
import '../widgets/partner_stat_card.dart';

class PartnerHomeScreen extends StatelessWidget {
  const PartnerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final partner = PartnerScope.watch(context);
    final driver = partner.driver;

    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        bottom: false,
        child: RefreshIndicator(
          color: AppColors.primary,
          onRefresh: () async {
            partner.refreshDashboard();
            await Future.delayed(const Duration(milliseconds: 1300));
          },
          child: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
                      child: Row(
                        children: [
                          const Text(
                            'Dashboard Mitra',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w900,
                              color: AppColors.navy,
                            ),
                          ),
                          const Spacer(),
                          IconButton.filledTonal(
                            style: IconButton.styleFrom(
                              backgroundColor: Colors.white,
                            ),
                            onPressed: () => Navigator.pushNamed(
                              context,
                              AppRoutes.partnerStatistics,
                            ),
                            icon: const Icon(Icons.bar_chart_rounded),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    PartnerShimmer(
                      isLoading: partner.isDashboardLoading,
                      child: PartnerGlassHeader(driver: driver),
                    ),
                    const SizedBox(height: 16),
                    const PartnerOnlineSwitch(),
                    const SizedBox(height: 20),
                    if (partner.activeOrder != null) ...[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: _ActiveOrderBanner(
                          customerName: partner.activeOrder!.customerName,
                          onTap: () => Navigator.pushNamed(
                            context,
                            AppRoutes.partnerActiveOrder,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          const Text(
                            'Permintaan Masuk',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                              color: AppColors.navy,
                            ),
                          ),
                          const Spacer(),
                          if (partner.isOnline)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color:
                                    AppColors.primary.withValues(alpha: 0.12),
                                borderRadius: BorderRadius.circular(99),
                              ),
                              child: Text(
                                '${partner.incomingOrders.length} baru',
                                style: const TextStyle(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 11,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
              if (partner.isDashboardLoading)
                const SliverToBoxAdapter(child: SizedBox(height: 200))
              else if (!partner.isOnline)
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: PartnerEmptyState(
                    icon: Icons.power_settings_new_rounded,
                    title: 'Anda sedang OFFLINE',
                    subtitle:
                        'Aktifkan mode ONLINE untuk menerima pesanan masuk dari pelanggan.',
                    actionLabel: 'Aktifkan mode online',
                    onAction: () => partner.setOnline(true),
                  ),
                )
              else if (partner.incomingOrders.isEmpty)
                const SliverFillRemaining(
                  hasScrollBody: false,
                  child: PartnerEmptyState(
                    icon: Icons.inbox_rounded,
                    title: 'Belum ada pesanan',
                    subtitle:
                        'Pesanan baru akan muncul di sini saat pelanggan membutuhkan layanan Anda.',
                  ),
                )
              else
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final order = partner.incomingOrders[index];
                        return PartnerIncomingOrderCard(
                          order: order,
                          onAccept: () {
                            partner.acceptOrder(order.id);
                            SnackbarHelper.show(
                              context,
                              'Pesanan dari ${order.customerName} diterima',
                            );
                            Navigator.pushNamed(
                              context,
                              AppRoutes.partnerActiveOrder,
                            );
                          },
                          onReject: () {
                            partner.rejectOrder(order.id);
                            SnackbarHelper.show(
                              context,
                              'Pesanan ditolak',
                            );
                          },
                        );
                      },
                      childCount: partner.incomingOrders.length,
                    ),
                  ),
                ),
              if (!partner.isDashboardLoading) ...[
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Ringkasan Hari Ini',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                            color: AppColors.navy,
                          ),
                        ),
                        const SizedBox(height: 12),
                        GridView.count(
                          crossAxisCount: 2,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 1.35,
                          children: [
                            PartnerStatCard(
                              title: 'Pesanan Hari Ini',
                              value: '${driver.todayOrders}',
                              icon: Icons.receipt_long_rounded,
                            ),
                            PartnerStatCard(
                              title: 'Pendapatan',
                              value:
                                  CurrencyFormatter.rupiah(driver.todayIncome),
                              icon: Icons.payments_rounded,
                              color: AppColors.warning,
                            ),
                            PartnerStatCard(
                              title: 'Rating',
                              value: driver.rating.toStringAsFixed(1),
                              icon: Icons.star_rounded,
                              color: AppColors.warning,
                            ),
                            PartnerStatCard(
                              title: 'Acceptance Rate',
                              value: '${driver.acceptanceRate}%',
                              icon: Icons.trending_up_rounded,
                              color: AppColors.blue,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _ActiveOrderBanner extends StatelessWidget {
  const _ActiveOrderBanner({
    required this.customerName,
    required this.onTap,
  });

  final String customerName;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            const Icon(Icons.navigation_rounded, color: Colors.white, size: 28),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Pesanan Aktif',
                    style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    customerName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right_rounded, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
