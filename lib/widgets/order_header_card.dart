import 'package:flutter/material.dart';
import '../core/app_colors.dart';
import '../models/order.dart';
import 'app_card.dart';
import 'illustrations.dart';

class OrderHeaderCard extends StatelessWidget {
  const OrderHeaderCard({super.key, required this.order});

  final QueueOrder order;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.all(14),
      radius: 22,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(order.location,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        color: AppColors.navy,
                        fontWeight: FontWeight.w900,
                        fontSize: 14)),
                const SizedBox(height: 5),
                Text(order.service,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        color: AppColors.subtext,
                        fontWeight: FontWeight.w700,
                        fontSize: 12)),
                const SizedBox(height: 7),
                Row(
                  children: [
                    const Icon(Icons.calendar_month_rounded,
                        size: 15, color: AppColors.teal),
                    const SizedBox(width: 4),
                    Flexible(
                        child: Text('${order.date} • ${order.time}',
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: AppColors.subtext,
                                fontSize: 11.5,
                                fontWeight: FontWeight.w700))),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          const SmallBuilding(width: 70, height: 56),
        ],
      ),
    );
  }
}
