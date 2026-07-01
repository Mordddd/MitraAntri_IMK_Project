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
      height: 72,
      padding: const EdgeInsets.fromLTRB(10, 6, 10, 10),
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
                onTap: () => onTap?.call(index),
                borderRadius: BorderRadius.circular(16),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 240),
                  curve: Curves.easeOutCubic,
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  decoration: BoxDecoration(
                    color: active
                        ? AppColors.primary.withValues(alpha: .08)
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
                          size: 21,
                          color: active ? AppColors.primary : AppColors.subtext,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        item.label,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: active
                              ? AppColors.primaryDark
                              : AppColors.subtext,
                          fontSize: 10.5,
                          fontWeight:
                              active ? FontWeight.w900 : FontWeight.w700,
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

class BottomNavItem {
  const BottomNavItem({required this.icon, required this.label});
  final IconData icon;
  final String label;
}
