import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF16803D);
  static const Color primaryDark = Color(0xFF116832);
  static const Color navy = Color(0xFF17211B);
  static const Color navy2 = Color(0xFF26352B);
  static const Color teal = primary;
  static const Color tealDark = primaryDark;
  static const Color blue = Color(0xFF0E6ED6);
  static const Color sky = Color(0xFFEAF7FF);
  static const Color mint = Color(0xFFE8FAF5);
  static const Color softBlue = Color(0xFFF1F7FF);
  static const Color bg = Color(0xFFF7F9F7);
  static const Color card = Color(0xFFFFFFFF);
  static const Color text = Color(0xFF26302A);
  static const Color subtext = Color(0xFF657068);
  static const Color border = Color(0xFFE3E8E4);
  static const Color lightGrey = Color(0xFFF0F3F1);
  static const Color warning = Color(0xFFF6B846);
  static const Color danger = Color(0xFFE75A5A);
  static const Color success = Color(0xFF16A34A);

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
      color: navy.withValues(alpha: 0.04),
      blurRadius: 16,
      offset: const Offset(0, 6),
    ),
  ];
}
