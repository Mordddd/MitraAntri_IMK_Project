import 'package:flutter/material.dart';

import '../core/app_colors.dart';

class MiniBuilding extends StatelessWidget {
  const MiniBuilding({super.key, this.size = 58});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: AppColors.softBlue,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          Positioned(
            left: size * .22,
            bottom: size * .18,
            child: Container(
              width: size * .25,
              height: size * .48,
              decoration: BoxDecoration(
                color: AppColors.blue.withValues(alpha: .35),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          Positioned(
            right: size * .22,
            bottom: size * .18,
            child: Container(
              width: size * .24,
              height: size * .60,
              decoration: BoxDecoration(
                color: AppColors.teal.withValues(alpha: .55),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          Positioned(
            left: size * .18,
            right: size * .18,
            bottom: size * .14,
            child: Container(
              height: size * .06,
              decoration: BoxDecoration(
                color: AppColors.navy.withValues(alpha: .18),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
