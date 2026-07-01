import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData light() {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.bg,
      fontFamily: 'Roboto',
      colorScheme: ColorScheme.fromSeed(
<<<<<<< HEAD
        seedColor: AppColors.primary,
        brightness: Brightness.light,
        primary: AppColors.primary,
        secondary: AppColors.primaryDark,
=======
        seedColor: AppColors.teal,
        brightness: Brightness.light,
        primary: AppColors.teal,
        secondary: AppColors.blue,
>>>>>>> e779af82024cf7b88993b7a681383685aaa57ba5
        surface: AppColors.card,
      ),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        centerTitle: true,
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.bg,
        foregroundColor: AppColors.navy,
        titleTextStyle: TextStyle(
          color: AppColors.navy,
          fontWeight: FontWeight.w800,
          fontSize: 16,
        ),
      ),
<<<<<<< HEAD
      cardTheme: CardThemeData(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: AppColors.card,
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          fontSize: 34,
          fontWeight: FontWeight.w900,
          color: AppColors.navy,
          height: 1.1,
        ),
        headlineMedium: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.w900,
          color: AppColors.navy,
          height: 1.15,
        ),
        headlineSmall: TextStyle(
          fontSize: 21,
          fontWeight: FontWeight.w800,
          color: AppColors.navy,
          height: 1.2,
        ),
        titleLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w800,
          color: AppColors.navy,
        ),
        titleMedium: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w800,
          color: AppColors.text,
        ),
        bodyLarge: TextStyle(
          fontSize: 15,
          color: AppColors.text,
          height: 1.45,
        ),
        bodyMedium: TextStyle(
          fontSize: 13,
          color: AppColors.text,
          height: 1.35,
        ),
        bodySmall: TextStyle(
          fontSize: 11.5,
          color: AppColors.subtext,
          height: 1.3,
        ),
=======
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.w900,
            color: AppColors.navy,
            height: 1.1),
        headlineMedium: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w900,
            color: AppColors.navy,
            height: 1.15),
        headlineSmall: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.w800,
            color: AppColors.navy,
            height: 1.2),
        titleLarge: TextStyle(
            fontSize: 18, fontWeight: FontWeight.w800, color: AppColors.navy),
        titleMedium: TextStyle(
            fontSize: 15, fontWeight: FontWeight.w800, color: AppColors.text),
        bodyLarge: TextStyle(fontSize: 15, color: AppColors.text, height: 1.45),
        bodyMedium:
            TextStyle(fontSize: 13, color: AppColors.text, height: 1.35),
        bodySmall:
            TextStyle(fontSize: 11.5, color: AppColors.subtext, height: 1.3),
>>>>>>> e779af82024cf7b88993b7a681383685aaa57ba5
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
<<<<<<< HEAD
          borderSide: const BorderSide(color: AppColors.primary, width: 1.4),
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
=======
          borderSide: const BorderSide(color: AppColors.teal, width: 1.4),
        ),
      ),
>>>>>>> e779af82024cf7b88993b7a681383685aaa57ba5
    );
  }
}
