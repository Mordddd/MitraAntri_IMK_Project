import 'package:flutter/material.dart';
import '../core/app_colors.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key, this.compact = false, this.center = true});

  final bool compact;
  final bool center;

  @override
  Widget build(BuildContext context) {
    final icon = SizedBox(
      width: compact ? 58 : 90,
      height: compact ? 52 : 82,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: compact ? 5 : 10,
            top: 0,
            child: _Dot(size: compact ? 15 : 23, color: AppColors.teal),
          ),
          Positioned(
            right: compact ? 5 : 10,
            top: 0,
            child: _Dot(size: compact ? 15 : 23, color: AppColors.blue),
          ),
          Positioned(
            left: compact ? 7 : 12,
            bottom: 0,
            child: _Pillar(
                width: compact ? 18 : 29,
                height: compact ? 43 : 68,
                color: AppColors.teal),
          ),
          Positioned(
            right: compact ? 7 : 12,
            bottom: 0,
            child: _Pillar(
                width: compact ? 18 : 29,
                height: compact ? 43 : 68,
                color: AppColors.blue),
          ),
        ],
      ),
    );

    final wordmark = RichText(
      textAlign: center ? TextAlign.center : TextAlign.left,
      text: TextSpan(
        style: TextStyle(
          fontSize: compact ? 22 : 45,
          height: .98,
          fontWeight: FontWeight.w900,
          letterSpacing: -1.2,
        ),
        children: const [
          TextSpan(text: 'Mitra\n', style: TextStyle(color: AppColors.navy)),
          TextSpan(text: 'Antri', style: TextStyle(color: AppColors.teal)),
        ],
      ),
    );

    if (compact) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [icon, const SizedBox(width: 10), wordmark],
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment:
          center ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [icon, const SizedBox(height: 14), wordmark],
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot({required this.size, required this.color});
  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}

class _Pillar extends StatelessWidget {
  const _Pillar(
      {required this.width, required this.height, required this.color});
  final double width;
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(width),
      ),
    );
  }
}
