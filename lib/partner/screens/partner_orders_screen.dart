import 'package:flutter/material.dart';

import '../../core/app_colors.dart';
import '../../core/app_routes.dart';
import '../partner_controller.dart';
import '../partner_scope.dart';
import '../widgets/partner_order_history_card.dart';
import '../widgets/partner_shimmer.dart';

class PartnerOrdersScreen extends StatefulWidget {
  const PartnerOrdersScreen({super.key});

  @override
  State<PartnerOrdersScreen> createState() => _PartnerOrdersScreenState();
}

class _PartnerOrdersScreenState extends State<PartnerOrdersScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final partner = PartnerScope.watch(context);

    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        title: const Text('Pesanan'),
        bottom: TabBar(
          controller: _tabController,
          labelColor: AppColors.primary,
          unselectedLabelColor: AppColors.subtext,
          indicatorColor: AppColors.primary,
          tabs: [
            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Aktif'),
                  if (partner.activeOrder != null) ...[
                    const SizedBox(width: 6),
                    Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            const Tab(text: 'Riwayat'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _ActiveTab(partner: partner),
          _HistoryTab(partner: partner),
        ],
      ),
    );
  }
}

class _ActiveTab extends StatelessWidget {
  const _ActiveTab({required this.partner});

  final PartnerController partner;

  @override
  Widget build(BuildContext context) {
    final active = partner.activeOrder;

    if (active == null) {
      return const PartnerEmptyState(
        icon: Icons.delivery_dining_rounded,
        title: 'Tidak ada pesanan aktif',
        subtitle: 'Terima pesanan dari dashboard untuk memulai perjalanan.',
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          PartnerOrderHistoryCard(
            order: active,
            onTap: () => Navigator.pushNamed(
              context,
              AppRoutes.partnerActiveOrder,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              onPressed: () => Navigator.pushNamed(
                context,
                AppRoutes.partnerActiveOrder,
              ),
              icon: const Icon(Icons.open_in_new_rounded),
              label: const Text('Buka Detail Pesanan'),
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.primary,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HistoryTab extends StatelessWidget {
  const _HistoryTab({required this.partner});

  final PartnerController partner;

  @override
  Widget build(BuildContext context) {
    final history = partner.orderHistory;

    if (history.isEmpty) {
      return const PartnerEmptyState(
        icon: Icons.history_rounded,
        title: 'Riwayat kosong',
        subtitle: 'Pesanan yang selesai akan tampil di sini.',
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: history.length,
      itemBuilder: (context, index) {
        return PartnerOrderHistoryCard(order: history[index]);
      },
    );
  }
}
