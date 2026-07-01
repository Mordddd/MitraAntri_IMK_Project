import 'package:flutter/material.dart';

import '../../core/app_colors.dart';
import '../partner_scope.dart';

class PartnerOnlineSwitch extends StatelessWidget {
  const PartnerOnlineSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    final partner = PartnerScope.watch(context);
    final isOnline = partner.isOnline;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeOutCubic,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: isOnline
            ? AppColors.primary.withValues(alpha: 0.12)
            : AppColors.lightGrey,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: isOnline ? AppColors.primary : AppColors.border,
          width: 1.5,
        ),
        boxShadow: isOnline
            ? [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.25),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ]
            : null,
      ),
      child: Row(
        children: [
          Expanded(
            child: _SwitchSide(
              label: 'OFFLINE',
              icon: Icons.power_settings_new_rounded,
              active: !isOnline,
              activeColor: AppColors.subtext,
              onTap: () => partner.setOnline(false),
            ),
          ),
          Expanded(
            child: _SwitchSide(
              label: 'ONLINE',
              icon: Icons.bolt_rounded,
              active: isOnline,
              activeColor: AppColors.primary,
              onTap: () => partner.setOnline(true),
            ),
          ),
        ],
      ),
    );
  }
}

class _SwitchSide extends StatelessWidget {
  const _SwitchSide({
    required this.label,
    required this.icon,
    required this.active,
    required this.activeColor,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final bool active;
  final Color activeColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutCubic,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: active ? activeColor : Colors.transparent,
          borderRadius: BorderRadius.circular(18),
          boxShadow: active
              ? [
                  BoxShadow(
                    color: activeColor.withValues(alpha: 0.35),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 20,
              color: active ? Colors.white : AppColors.subtext,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 13,
                letterSpacing: 0.5,
                color: active ? Colors.white : AppColors.subtext,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
