import 'package:flutter/material.dart';

import '../../core/app_colors.dart';
import '../../utils/currency_formatter.dart';
import '../models/partner_driver.dart';

class PartnerGlassHeader extends StatelessWidget {
  const PartnerGlassHeader({
    super.key,
    required this.driver,
    this.trailing,
  });

  final PartnerDriver driver;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 4, 16, 0),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Hero(
                tag: 'partner_avatar',
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: AppColors.primary.withValues(alpha: 0.15),
                  child: const Icon(
                    Icons.person_rounded,
                    size: 34,
                    color: AppColors.primary,
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      driver.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        color: AppColors.navy,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(
                          Icons.star_rounded,
                          size: 16,
                          color: AppColors.warning,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          driver.rating.toStringAsFixed(1),
                          style: const TextStyle(
                            fontWeight: FontWeight.w800,
                            color: AppColors.navy,
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Icon(
                          Icons.two_wheeler_rounded,
                          size: 16,
                          color: AppColors.subtext.withValues(alpha: 0.9),
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            '${driver.vehicleType} • ${driver.vehiclePlate}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: AppColors.subtext,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              if (trailing != null) trailing!,
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Expanded(
                  child: _MetricColumn(
                    label: 'Saldo Dompet',
                    value: CurrencyFormatter.rupiah(driver.balance),
                  ),
                ),
                Container(
                  width: 1,
                  height: 36,
                  color: Colors.white.withValues(alpha: 0.35),
                ),
                Expanded(
                  child: _MetricColumn(
                    label: 'Pendapatan Hari Ini',
                    value: CurrencyFormatter.rupiah(driver.todayIncome),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _MiniStat(
                  icon: Icons.receipt_long_rounded,
                  label: 'Pesanan Hari Ini',
                  value: '${driver.todayOrders}',
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _MiniStat(
                  icon: Icons.calendar_view_week_rounded,
                  label: 'Minggu Ini',
                  value: CurrencyFormatter.rupiah(driver.weeklyIncome),
                  compact: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MetricColumn extends StatelessWidget {
  const _MetricColumn({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.85),
            fontSize: 11,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
    );
  }
}

class _MiniStat extends StatelessWidget {
  const _MiniStat({
    required this.icon,
    required this.label,
    required this.value,
    this.compact = false,
  });

  final IconData icon;
  final String label;
  final String value;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(icon, size: 18, color: AppColors.primary),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: AppColors.subtext,
                  ),
                ),
                Text(
                  value,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: compact ? 11 : 14,
                    fontWeight: FontWeight.w900,
                    color: AppColors.navy,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
