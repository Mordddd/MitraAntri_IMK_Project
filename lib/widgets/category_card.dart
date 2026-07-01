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
      padding: const EdgeInsets.all(12),
      radius: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
<<<<<<< HEAD
          if (category.emoji.isNotEmpty)
            Text(
              category.emoji,
              style: const TextStyle(fontSize: 28),
            )
          else
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: category.color.withValues(alpha: .12),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(category.icon, color: category.color, size: 23),
            ),
=======
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: category.color.withValues(alpha: .12),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(category.icon, color: category.color, size: 23),
          ),
>>>>>>> e779af82024cf7b88993b7a681383685aaa57ba5
          const Spacer(),
          Text(
            category.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                fontWeight: FontWeight.w900,
                color: AppColors.navy,
                fontSize: 13),
          ),
          const SizedBox(height: 3),
          Text(
            category.subtitle,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                color: AppColors.subtext, fontSize: 10.5, height: 1.2),
          ),
        ],
      ),
    );
  }
}
