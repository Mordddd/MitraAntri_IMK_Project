import 'package:flutter/material.dart';

class AppColors {
  static const Color navy = Color(0xFF101A3A);
  static const Color navy2 = Color(0xFF1B2A55);
  static const Color teal = Color(0xFF009688);
  static const Color tealDark = Color(0xFF00796B);
  static const Color blue = Color(0xFF0E6ED6);
  static const Color sky = Color(0xFFEAF7FF);
  static const Color mint = Color(0xFFE8FAF5);
  static const Color softBlue = Color(0xFFF1F7FF);
  static const Color bg = Color(0xFFF7FAFD);
  static const Color card = Color(0xFFFFFFFF);
  static const Color text = Color(0xFF18213A);
  static const Color subtext = Color(0xFF6B7280);
  static const Color border = Color(0xFFE8EEF7);
  static const Color warning = Color(0xFFF6B846);
  static const Color danger = Color(0xFFE75A5A);
  static const Color success = Color(0xFF15B88E);

  static LinearGradient primaryGradient(
      {Alignment begin = Alignment.topLeft,
      Alignment end = Alignment.bottomRight}) {
    return LinearGradient(
      begin: begin,
      end: end,
      colors: const [teal, blue],
    );
  }
}
