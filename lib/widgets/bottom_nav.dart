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
    return SafeArea(
      minimum: const EdgeInsets.fromLTRB(16, 0, 16, 12),
      child: Container(
        height: 70,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: AppColors.shell,
          borderRadius: BorderRadius.circular(28),
          border: Border.all(color: Colors.white.withValues(alpha: .72)),
          boxShadow: [
            BoxShadow(
              color: AppColors.navy.withValues(alpha: .14),
              blurRadius: 32,
              offset: const Offset(0, 14),
            ),
          ],
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.navy,
            borderRadius: BorderRadius.circular(23),
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
                    borderRadius: BorderRadius.circular(19),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 240),
                      curve: Curves.easeOutQuart,
                      padding: const EdgeInsets.symmetric(vertical: 7),
                      decoration: BoxDecoration(
                        color: active ? AppColors.card : Colors.transparent,
                        borderRadius: BorderRadius.circular(19),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AnimatedScale(
                            scale: active ? 1.04 : 1,
                            duration: const Duration(milliseconds: 240),
                            curve: Curves.easeOutQuart,
                            child: Icon(
                              item.icon,
                              size: 21,
                              color: active
                                  ? AppColors.primaryDark
                                  : Colors.white60,
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
                                  : Colors.white60,
                              fontSize: 10.5,
                              fontWeight:
                                  active ? FontWeight.w700 : FontWeight.w500,
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
        ),
      ),
    );
  }
}

class BottomNavItem {
  const BottomNavItem({required this.icon, required this.label});
  final IconData icon;
  final String label;
}
