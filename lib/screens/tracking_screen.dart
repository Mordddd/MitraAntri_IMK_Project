import 'package:flutter/material.dart';
import '../app/app_controller.dart';
import '../app/app_scope.dart';
import '../core/app_colors.dart';
import '../core/app_routes.dart';
import '../data/dummy_data.dart';
import '../widgets/app_card.dart';
import '../widgets/gradient_background.dart';
import '../widgets/illustrations.dart';
import '../widgets/order_header_card.dart';
import '../widgets/primary_button.dart';
import '../widgets/progress_timeline.dart';
import '../widgets/top_app_bar.dart';

class TrackingScreen extends StatelessWidget {
  const TrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final app = AppScope.watch(context);
    final order = app.order;
    const mitra = DummyData.mitra;

    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: Column(
            children: [
              TopAppBar(
                title: 'Sedang Berlangsung',
                actions: [
                  IconButton(
                    onPressed: () => _showMessage(context,
                        'Gunakan tombol kembali untuk melihat pesanan lain.'),
                    icon: const Icon(Icons.more_vert_rounded,
                        color: AppColors.navy),
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
                  child: Column(
                    children: [
                      OrderHeaderCard(order: order),
                      const SizedBox(height: 16),
                      AppCard(
                        padding: const EdgeInsets.all(20),
                        radius: 18,
                        child: Column(
                          children: [
                            const Text('Nomor Antrean Anda',
                                style: TextStyle(
                                    color: AppColors.subtext,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 12)),
                            const SizedBox(height: 10),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 26, vertical: 15),
                              decoration: BoxDecoration(
                                color: AppColors.mint,
                                borderRadius: BorderRadius.circular(22),
                                border: Border.all(
                                    color:
                                        AppColors.teal.withValues(alpha: .15)),
                              ),
                              child: Text(
                                order.queueNumber,
                                style: const TextStyle(
                                    color: AppColors.tealDark,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 43,
                                    letterSpacing: 1.2),
                              ),
                            ),
                            const SizedBox(height: 12),
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                style: const TextStyle(
                                    color: AppColors.subtext,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700),
                                children: [
                                  const TextSpan(
                                      text: 'Estimasi giliran tiba dalam\n'),
                                  TextSpan(
                                    text: '± ${order.estimateMinutes} menit',
                                    style: const TextStyle(
                                        color: AppColors.navy,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 17),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 22),
                            ProgressTimeline(
                                steps: DummyData.activeSteps,
                                currentIndex: app.trackingStep),
                            const SizedBox(height: 14),
                            Text(
                              app.statusLabel,
                              style: const TextStyle(
                                  color: AppColors.tealDark,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      AppCard(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            const MitraAvatar(),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(mitra.name,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.navy,
                                          fontSize: 15)),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      const Icon(Icons.star_rounded,
                                          color: AppColors.warning, size: 17),
                                      Text(
                                          ' ${mitra.rating} (${mitra.finishedOrders})',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w800,
                                              color: AppColors.subtext,
                                              fontSize: 12)),
                                    ],
                                  ),
                                  const SizedBox(height: 6),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                        color: AppColors.teal
                                            .withValues(alpha: .10),
                                        borderRadius: BorderRadius.circular(7)),
                                    child: const Text('Mitra Terverifikasi',
                                        style: TextStyle(
                                            color: AppColors.teal,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 10.5)),
                                  ),
                                ],
                              ),
                            ),
                            IconButton.filledTonal(
                              style: IconButton.styleFrom(
                                  backgroundColor: AppColors.mint,
                                  foregroundColor: AppColors.teal),
                              onPressed: () => _showMessage(context,
                                  'Chat demo belum terhubung ke server.'),
                              icon: const Icon(Icons.chat_bubble_rounded),
                            ),
                            const SizedBox(width: 8),
                            IconButton.filledTonal(
                              style: IconButton.styleFrom(
                                  backgroundColor: AppColors.softBlue,
                                  foregroundColor: AppColors.blue),
                              onPressed: () => _showMessage(context,
                                  'Nomor mitra belum tersedia pada mode demo.'),
                              icon: const Icon(Icons.phone_rounded),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      AppCard(
                        color: AppColors.sky,
                        padding: const EdgeInsets.all(15),
                        borderColor: AppColors.blue.withValues(alpha: .12),
                        child: const Row(
                          children: [
                            Icon(Icons.info_rounded, color: AppColors.blue),
                            SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                'Pastikan ponsel Anda aktif supaya update dari mitra bisa langsung diterima.',
                                style: TextStyle(
                                    color: AppColors.navy,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12.5,
                                    height: 1.35),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      PrimaryButton(
                        text: _actionLabel(app.orderStatus),
                        icon: app.canPay
                            ? Icons.receipt_long_rounded
                            : Icons.sync_rounded,
                        onPressed: () {
                          if (app.canPay) {
                            Navigator.pushNamed(context, AppRoutes.payment);
                          } else if (app.orderStatus == OrderStatus.paid) {
                            Navigator.pushNamedAndRemoveUntil(
                                context, AppRoutes.home, (_) => false);
                          } else {
                            app.advanceOrder();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _actionLabel(OrderStatus status) {
    return switch (status) {
      OrderStatus.completed => 'Lihat Detail & Bayar',
      OrderStatus.paid => 'Kembali ke Beranda',
      _ => 'Perbarui Status Demo',
    };
  }

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }
}
