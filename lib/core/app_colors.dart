import 'package:flutter/material.dart';

class AppColors {
<<<<<<< HEAD
  static const Color primary = Color(0xFF16A34A);
  static const Color primaryDark = Color(0xFF15803D);
  static const Color navy = Color(0xFF101A3A);
  static const Color navy2 = Color(0xFF1B2A55);
  static const Color teal = primary;
  static const Color tealDark = primaryDark;
=======
  static const Color navy = Color(0xFF101A3A);
  static const Color navy2 = Color(0xFF1B2A55);
  static const Color teal = Color(0xFF009688);
  static const Color tealDark = Color(0xFF00796B);
>>>>>>> e779af82024cf7b88993b7a681383685aaa57ba5
  static const Color blue = Color(0xFF0E6ED6);
  static const Color sky = Color(0xFFEAF7FF);
  static const Color mint = Color(0xFFE8FAF5);
  static const Color softBlue = Color(0xFFF1F7FF);
<<<<<<< HEAD
  static const Color bg = Color(0xFFF5F5F5);
=======
  static const Color bg = Color(0xFFF7FAFD);
>>>>>>> e779af82024cf7b88993b7a681383685aaa57ba5
  static const Color card = Color(0xFFFFFFFF);
  static const Color text = Color(0xFF18213A);
  static const Color subtext = Color(0xFF6B7280);
  static const Color border = Color(0xFFE8EEF7);
<<<<<<< HEAD
  static const Color lightGrey = Color(0xFFF3F4F6);
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
      colors: const [primary, Color(0xFF22C55E)],
    );
  }

  static List<BoxShadow> cardShadow = [
    BoxShadow(
      color: navy.withValues(alpha: 0.06),
      blurRadius: 16,
      offset: const Offset(0, 8),
    ),
  ];
=======
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
>>>>>>> e779af82024cf7b88993b7a681383685aaa57ba5
}
