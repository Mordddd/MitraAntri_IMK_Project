import 'package:flutter/material.dart';
import '../core/app_colors.dart';

class MockBottomNav extends StatelessWidget {
  const MockBottomNav(
      {super.key, required this.currentIndex, required this.items, this.onTap});

  final int currentIndex;
  final List<BottomNavItem> items;
  final ValueChanged<int>? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 76,
      padding: const EdgeInsets.fromLTRB(10, 8, 10, 12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
            top: BorderSide(color: AppColors.border.withValues(alpha: .8))),
        boxShadow: [
          BoxShadow(
              color: AppColors.navy.withValues(alpha: .06),
              blurRadius: 18,
              offset: const Offset(0, -8)),
        ],
      ),
      child: Row(
        children: List.generate(items.length, (index) {
          final item = items[index];
          final active = index == currentIndex;
          return Expanded(
            child: InkWell(
              onTap: () => onTap?.call(index),
              borderRadius: BorderRadius.circular(18),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                padding: const EdgeInsets.symmetric(vertical: 6),
                decoration: BoxDecoration(
                  color: active
                      ? AppColors.teal.withValues(alpha: .10)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(item.icon,
                        size: 21,
                        color: active ? AppColors.teal : AppColors.subtext),
                    const SizedBox(height: 3),
                    Text(
                      item.label,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: active ? AppColors.teal : AppColors.subtext,
                        fontSize: 10.5,
                        fontWeight: active ? FontWeight.w900 : FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class BottomNavItem {
  const BottomNavItem({required this.icon, required this.label});
  final IconData icon;
  final String label;
}
