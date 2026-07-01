import 'package:flutter/material.dart';
import '../core/app_colors.dart';

class GradientBackground extends StatelessWidget {
  const GradientBackground({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.bg,
        gradient: RadialGradient(
          center: Alignment(1.05, -0.85),
          radius: 1.15,
          colors: [Color(0xFFDCE9DF), AppColors.bg],
          stops: [0, .72],
        ),
      ),
      child: child,
    );
  }
}
