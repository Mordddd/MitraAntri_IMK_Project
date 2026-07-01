import 'package:flutter/material.dart';
import '../core/app_colors.dart';
import '../models/service_category.dart';
import 'app_card.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category, required this.onTap});

  final ServiceCategory category;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onTap: onTap,
      padding: const EdgeInsets.all(14),
      radius: 16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: AppColors.mint,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(category.icon, color: AppColors.primary, size: 22),
          ),
          const Spacer(),
          Text(
            category.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                fontWeight: FontWeight.w800,
                color: AppColors.navy,
                fontSize: 13.5),
          ),
          const SizedBox(height: 3),
          Text(
            category.subtitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                color: AppColors.subtext, fontSize: 10.5, height: 1.2),
          ),
        ],
      ),
    );
  }
}
