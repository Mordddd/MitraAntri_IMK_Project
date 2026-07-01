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
          borderRadius: BorderRadius.circular(18),
          child: Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.all(13),
            decoration: BoxDecoration(
              color: selected
                  ? AppColors.teal.withValues(alpha: .08)
                  : Colors.white,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                  color: selected ? AppColors.teal : AppColors.border,
                  width: selected ? 1.4 : 1),
            ),
            child: Row(
              children: [
                Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                      color: selected ? AppColors.teal : AppColors.softBlue,
                      borderRadius: BorderRadius.circular(13)),
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
                              fontWeight: FontWeight.w900,
                              color: AppColors.navy,
                              fontSize: 13.5)),
                      const SizedBox(height: 3),
                      Text(subtitle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: AppColors.subtext,
                              fontSize: 11.2,
                              fontWeight: FontWeight.w600)),
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
