import 'package:flutter/material.dart';

import '../core/app_colors.dart';

class SnackbarHelper {
  static void show(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          behavior: SnackBarBehavior.floating,
          backgroundColor: AppColors.navy,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          margin: const EdgeInsets.all(16),
        ),
      );
  }

  static void orderCreated(BuildContext context) =>
      show(context, 'Pesanan berhasil dibuat');

  static void partnerAccepted(BuildContext context) =>
      show(context, 'Mitra menerima pesanan Anda');

  static void partnerArrived(BuildContext context) =>
      show(context, 'Mitra sudah tiba di lokasi');

  static void orderCompleted(BuildContext context) =>
      show(context, 'Pesanan selesai');
}
