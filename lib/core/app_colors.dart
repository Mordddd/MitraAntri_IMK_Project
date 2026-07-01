import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF286044);
  static const Color primaryDark = Color(0xFF183F2D);
  static const Color navy = Color(0xFF17211C);
  static const Color navy2 = Color(0xFF304039);
  static const Color teal = primary;
  static const Color tealDark = primaryDark;
  static const Color blue = Color(0xFF42637A);
  static const Color sky = Color(0xFFE9F0F2);
  static const Color mint = Color(0xFFE3EEE7);
  static const Color softBlue = Color(0xFFF0F4F3);
  static const Color bg = Color(0xFFF4F2EA);
  static const Color card = Color(0xFFFCFBF7);
  static const Color text = Color(0xFF29332E);
  static const Color subtext = Color(0xFF68736D);
  static const Color border = Color(0xFFDDE1DA);
  static const Color lightGrey = Color(0xFFECEDE7);
  static const Color warning = Color(0xFFC1873D);
  static const Color danger = Color(0xFFB8534E);
  static const Color success = Color(0xFF3E7355);
  static const Color shell = Color(0xFFE9E7DE);

  static LinearGradient primaryGradient({
    Alignment begin = Alignment.topLeft,
    Alignment end = Alignment.bottomRight,
  }) {
    return LinearGradient(
      begin: begin,
      end: end,
      colors: const [primary, primaryDark],
    );
  }

  static final List<BoxShadow> cardShadow = [
    BoxShadow(
      color: navy.withValues(alpha: 0.075),
      blurRadius: 28,
      offset: const Offset(0, 12),
    ),
  ];
}
