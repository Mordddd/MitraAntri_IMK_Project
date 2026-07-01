import 'package:flutter/material.dart';
import '../core/app_colors.dart';

class GradientBackground extends StatelessWidget {
  const GradientBackground({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFF9FCFF), AppColors.bg],
              ),
            ),
          ),
        ),
        Positioned(
          top: -110,
          right: -110,
          child: Container(
            width: 260,
            height: 260,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: AppColors.primaryGradient(),
              boxShadow: [
                BoxShadow(
                    color: AppColors.teal.withValues(alpha: .16),
                    blurRadius: 60),
              ],
            ),
          ),
        ),
        Positioned(
          top: 85,
          left: -85,
          child: Container(
            width: 170,
            height: 170,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.sky.withValues(alpha: .9),
            ),
          ),
        ),
        child,
      ],
    );
  }
}
