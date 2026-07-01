import 'package:flutter/material.dart';

import '../../core/app_colors.dart';

class PartnerBottomNav extends StatelessWidget {
  const PartnerBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  static const items = [
    _NavItem(Icons.home_rounded, 'Beranda'),
    _NavItem(Icons.receipt_long_rounded, 'Pesanan'),
    _NavItem(Icons.account_balance_wallet_rounded, 'Dompet'),
    _NavItem(Icons.notifications_rounded, 'Notifikasi'),
    _NavItem(Icons.person_rounded, 'Profil'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      padding: const EdgeInsets.fromLTRB(8, 6, 8, 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: const Border(top: BorderSide(color: AppColors.border)),
      ),
      child: Row(
        children: List.generate(items.length, (index) {
          final item = items[index];
          final active = index == currentIndex;
          return Expanded(
            child: Semantics(
              button: true,
              selected: active,
              label: item.label,
              child: InkWell(
                onTap: () => onTap(index),
                borderRadius: BorderRadius.circular(16),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 240),
                  curve: Curves.easeOutCubic,
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  decoration: BoxDecoration(
                    color: active
                        ? AppColors.primary.withValues(alpha: 0.09)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AnimatedScale(
                        scale: active ? 1.04 : 1,
                        duration: const Duration(milliseconds: 240),
                        curve: Curves.easeOutBack,
                        child: Icon(
                          item.icon,
                          size: 22,
                          color: active ? AppColors.primary : AppColors.subtext,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        item.label,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight:
                              active ? FontWeight.w900 : FontWeight.w700,
                          color: active
                              ? AppColors.primaryDark
                              : AppColors.subtext,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class _NavItem {
  const _NavItem(this.icon, this.label);
  final IconData icon;
  final String label;
}
