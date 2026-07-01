import 'package:flutter/material.dart';
import '../core/app_colors.dart';

class FormTile extends StatelessWidget {
  const FormTile({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
    this.subtitle,
    this.trailing,
    this.onTap,
  });

  final String label;
  final String value;
  final String? subtitle;
  final IconData icon;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.card,
      borderRadius: BorderRadius.circular(24),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(24),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: Colors.white.withValues(alpha: .72)),
            boxShadow: AppColors.cardShadow,
          ),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.mint,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Icon(icon, color: AppColors.teal, size: 21),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(label,
                        style: const TextStyle(
                            color: AppColors.subtext,
                            fontSize: 11,
                            fontWeight: FontWeight.w500)),
                    const SizedBox(height: 3),
                    Text(value,
                        style: const TextStyle(
                            color: AppColors.navy,
                            fontSize: 13.5,
                            fontWeight: FontWeight.w700)),
                    if (subtitle != null) ...[
                      const SizedBox(height: 2),
                      Text(subtitle!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: AppColors.subtext, fontSize: 11)),
                    ],
                  ],
                ),
              ),
              trailing ??
                  const Icon(Icons.chevron_right_rounded,
                      color: AppColors.subtext),
            ],
          ),
        ),
      ),
    );
  }
}
