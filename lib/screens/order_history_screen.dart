import 'package:flutter/material.dart';

import '../core/app_colors.dart';
import '../core/app_routes.dart';
import '../dummy/dummy_data.dart';
import '../models/order.dart';
import '../utils/currency_formatter.dart';
import '../widgets/top_app_bar.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key, this.showBackButton = true});

  final bool showBackButton;

  @override
  Widget build(BuildContext context) {
    final orders = DummyData.orderHistory;

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (showBackButton)
              TopAppBar(title: 'Riwayat Pesanan')
            else
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 18, 20, 0),
                child: Text(
                  'Orders',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            Expanded(
              child: orders.isEmpty
                  ? const Center(child: Text('Belum ada riwayat pesanan'))
                  : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: orders.length,
                      itemBuilder: (context, index) {
                        return _OrderCard(order: orders[index]);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OrderCard extends StatelessWidget {
  const _OrderCard({required this.order});

  final QueueOrder order;

  @override
  Widget build(BuildContext context) {
    final statusColor = _statusColor(order.status);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.border),
      ),
      child: InkWell(
        onTap: () => Navigator.pushNamed(
          context,
          AppRoutes.driverProfile,
        ),
        borderRadius: BorderRadius.circular(18),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: statusColor.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Text(
                      order.status.label,
                      style: TextStyle(
                        color: statusColor,
                        fontWeight: FontWeight.w800,
                        fontSize: 11,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    order.category,
                    style: const TextStyle(
                      color: AppColors.subtext,
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                order.location,
                style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 16,
                  color: AppColors.navy,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                order.service,
                style: const TextStyle(color: AppColors.subtext),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  const Icon(Icons.calendar_today_rounded,
                      size: 14, color: AppColors.subtext),
                  const SizedBox(width: 4),
                  Text('${order.date} • ${order.time}',
                      style: const TextStyle(fontSize: 12)),
                  const Spacer(),
                  Text(
                    CurrencyFormatter.rupiah(order.totalPayment),
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.person_rounded,
                      size: 14, color: AppColors.primary),
                  const SizedBox(width: 4),
                  Text(
                    order.mitraName,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _statusColor(OrderDisplayStatus status) {
    return switch (status) {
      OrderDisplayStatus.waiting => AppColors.warning,
      OrderDisplayStatus.accepted => AppColors.blue,
      OrderDisplayStatus.onTheWay => AppColors.primary,
      OrderDisplayStatus.completed => AppColors.success,
      OrderDisplayStatus.cancelled => AppColors.danger,
    };
  }
}
