import 'package:flutter/material.dart';
import '../core/app_colors.dart';

class PaymentOption extends StatelessWidget {
  const PaymentOption({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    this.selected = false,
    this.onTap,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      selected: selected,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(24),
          child: Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: selected
                  ? AppColors.teal.withValues(alpha: .08)
                  : AppColors.card,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                  color: selected ? AppColors.teal : Colors.white70,
                  width: selected ? 1.6 : 1),
              boxShadow: selected ? null : AppColors.cardShadow,
            ),
            child: Row(
              children: [
                Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                      color: selected ? AppColors.teal : AppColors.softBlue,
                      borderRadius: BorderRadius.circular(15)),
                  child: Icon(icon,
                      color: selected ? Colors.white : AppColors.teal,
                      size: 20),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              color: AppColors.navy,
                              fontSize: 13.5)),
                      const SizedBox(height: 3),
                      Text(subtitle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: AppColors.subtext,
                              fontSize: 11.2,
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                ),
                Icon(
                    selected
                        ? Icons.check_circle_rounded
                        : Icons.radio_button_unchecked_rounded,
                    color: selected ? AppColors.teal : AppColors.subtext,
                    size: 22),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
