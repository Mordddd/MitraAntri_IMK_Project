import 'package:flutter/material.dart';
import '../core/app_colors.dart';
import '../models/service_category.dart';
import 'app_card.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.category,
    required this.onTap,
    this.featured = false,
  });

  final ServiceCategory category;
  final VoidCallback onTap;
  final bool featured;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onTap: onTap,
      padding: EdgeInsets.all(featured ? 22 : 16),
      radius: featured ? 28 : 22,
      color: featured ? AppColors.primaryDark : AppColors.card,
      borderColor: featured ? AppColors.primaryDark : null,
      child: featured
          ? Row(
              children: [
                Expanded(child: _CategoryCopy(category: category, light: true)),
                const SizedBox(width: 18),
                Container(
                  width: 76,
                  height: 76,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: .1),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Icon(category.icon, color: Colors.white, size: 32),
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: category.color.withValues(alpha: .12),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child:
                      Icon(category.icon, color: AppColors.primary, size: 21),
                ),
                const Spacer(),
                _CategoryCopy(category: category),
              ],
            ),
    );
  }
}

class _CategoryCopy extends StatelessWidget {
  const _CategoryCopy({required this.category, this.light = false});

  final ServiceCategory category;
  final bool light;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          category.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: light ? Colors.white : AppColors.navy,
            fontSize: light ? 22 : 14,
            letterSpacing: light ? -.4 : 0,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          category.subtitle,
          maxLines: light ? 2 : 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: light ? Colors.white60 : AppColors.subtext,
            fontSize: light ? 13 : 11,
            height: 1.3,
          ),
        ),
      ],
    );
  }
}
