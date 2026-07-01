import 'package:flutter/material.dart';
import '../app/app_controller.dart';
import '../app/app_scope.dart';
import '../core/app_colors.dart';
import '../core/app_routes.dart';
import '../widgets/app_card.dart';
import '../widgets/bottom_nav.dart';
import '../widgets/gradient_background.dart';
import '../widgets/metric_card.dart';
import '../widgets/primary_button.dart';
import '../widgets/section_header.dart';

class MitraDashboardScreen extends StatelessWidget {
  const MitraDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final app = AppScope.watch(context);
    final order = app.order;

    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(20, 18, 20, 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Hai, Budi! 👋',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    Container(
                                        width: 8,
                                        height: 8,
                                        decoration: const BoxDecoration(
                                            color: AppColors.success,
                                            shape: BoxShape.circle)),
                                    const SizedBox(width: 6),
                                    const Text(
                                        'Online dan siap menerima pesanan',
                                        style: TextStyle(
                                            color: AppColors.subtext,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          IconButton.filledTonal(
                            style: IconButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: AppColors.navy),
                            onPressed: () => _showMessage(
                                context, 'Belum ada notifikasi baru.'),
                            icon: const Icon(Icons.notifications_none_rounded),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      _EarningCard(),
                      const SizedBox(height: 14),
                      const Row(
                        children: [
                          Expanded(
                              child: MetricCard(
                                  title: 'Rating Saya',
                                  value: '4.9',
                                  icon: Icons.star_rounded,
                                  color: AppColors.warning)),
                          SizedBox(width: 10),
                          Expanded(
                              child: MetricCard(
                                  title: 'Selesai',
                                  value: '128',
                                  icon: Icons.task_alt_rounded,
                                  color: AppColors.teal)),
                          SizedBox(width: 10),
                          Expanded(
                              child: MetricCard(
                                  title: 'Batal',
                                  value: '2',
                                  icon: Icons.cancel_rounded,
                                  color: AppColors.danger)),
                        ],
                      ),
                      const SizedBox(height: 22),
                      const SectionHeader(title: 'Permintaan Masuk'),
                      const SizedBox(height: 12),
                      AppCard(
                        padding: const EdgeInsets.all(16),
                        radius: 24,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(order.location,
                                      style: const TextStyle(
                                          color: AppColors.navy,
                                          fontWeight: FontWeight.w900,
                                          fontSize: 15)),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 9, vertical: 5),
                                  decoration: BoxDecoration(
                                      color: AppColors.warning
                                          .withValues(alpha: .15),
                                      borderRadius: BorderRadius.circular(99)),
                                  child: const Text('Baru',
                                      style: TextStyle(
                                          color: Color(0xFFB7791F),
                                          fontWeight: FontWeight.w900,
                                          fontSize: 11)),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            const Text('Poli Spesialis – Anak',
                                style: TextStyle(
                                    color: AppColors.subtext,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700)),
                            const SizedBox(height: 10),
                            const Row(
                              children: [
                                Icon(Icons.schedule_rounded,
                                    color: AppColors.teal, size: 16),
                                SizedBox(width: 5),
                                Text('Hari ini, 10:00',
                                    style: TextStyle(
                                        color: AppColors.subtext,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12)),
                                Spacer(),
                                Icon(Icons.place_rounded,
                                    color: AppColors.blue, size: 16),
                                SizedBox(width: 5),
                                Text('2.1 km',
                                    style: TextStyle(
                                        color: AppColors.subtext,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12)),
                              ],
                            ),
                            const SizedBox(height: 12),
                            const Text('Rp 90.000 – 110.000',
                                style: TextStyle(
                                    color: AppColors.navy,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 16)),
                            const SizedBox(height: 14),
                            Row(
                              children: [
                                Expanded(
                                  child: OutlinedButton(
                                    onPressed:
                                        app.orderStatus == OrderStatus.cancelled
                                            ? null
                                            : app.rejectOrder,
                                    style: OutlinedButton.styleFrom(
                                      foregroundColor: AppColors.navy,
                                      side: const BorderSide(
                                          color: AppColors.border),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16)),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 14),
                                    ),
                                    child: const Text('Tolak',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w900)),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: PrimaryButton(
                                    text:
                                        app.orderStatus == OrderStatus.assigned
                                            ? 'Diterima'
                                            : 'Terima Pesanan',
                                    height: 48,
                                    onPressed: app.acceptOrder,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 22),
                      SectionHeader(
                          title: 'Tugas Aktif',
                          actionText: 'Detail',
                          onAction: () => _showMessage(context,
                              'Detail tugas aktif ditampilkan di kartu ini.')),
                      const SizedBox(height: 12),
                      AppCard(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  gradient: AppColors.primaryGradient(),
                                  borderRadius: BorderRadius.circular(18)),
                              child: const Icon(Icons.directions_walk_rounded,
                                  color: Colors.white),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                        color: AppColors.teal
                                            .withValues(alpha: .10),
                                        borderRadius:
                                            BorderRadius.circular(99)),
                                    child: const Text('Berlangsung',
                                        style: TextStyle(
                                            color: AppColors.teal,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w900)),
                                  ),
                                  const SizedBox(height: 7),
                                  Text(order.location,
                                      style: const TextStyle(
                                          color: AppColors.navy,
                                          fontWeight: FontWeight.w900,
                                          fontSize: 14)),
                                  const SizedBox(height: 3),
                                  Text(
                                      '${order.service} • Estimasi 35 menit lagi',
                                      style: const TextStyle(
                                          color: AppColors.subtext,
                                          fontSize: 11.5,
                                          fontWeight: FontWeight.w700)),
                                ],
                              ),
                            ),
                            Text(order.queueNumber,
                                style: const TextStyle(
                                    color: AppColors.teal,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 17)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 22),
                      SectionHeader(
                          title: 'Riwayat Pesanan',
                          actionText: 'Lihat semua',
                          onAction: () => _showMessage(context,
                              'Riwayat lengkap memerlukan koneksi backend.')),
                      const SizedBox(height: 12),
                      const AppCard(
                        padding: EdgeInsets.all(15),
                        child: Row(
                          children: [
                            Icon(Icons.check_circle_rounded,
                                color: AppColors.success),
                            SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                  '3 pesanan selesai hari ini. Pertahankan rating bagusmu!',
                                  style: TextStyle(
                                      color: AppColors.navy,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 12.5)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              MockBottomNav(
                currentIndex: 0,
                items: const [
                  BottomNavItem(
                      icon: Icons.dashboard_rounded, label: 'Beranda'),
                  BottomNavItem(
                      icon: Icons.assignment_rounded, label: 'Pesanan'),
                  BottomNavItem(
                      icon: Icons.account_balance_wallet_rounded,
                      label: 'Dompet'),
                  BottomNavItem(icon: Icons.person_rounded, label: 'Akun'),
                ],
                onTap: (index) {
                  if (index == 3) {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      AppRoutes.onboarding,
                      (_) => false,
                    );
                  } else if (index != 0) {
                    _showMessage(
                        context, 'Fitur ini memerlukan koneksi backend.');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }
}

class _EarningCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: AppColors.primaryGradient(),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
              color: AppColors.teal.withValues(alpha: .22),
              blurRadius: 24,
              offset: const Offset(0, 14))
        ],
      ),
      child: Row(
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Pendapatan Hari Ini',
                    style: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.w800,
                        fontSize: 12)),
                SizedBox(height: 8),
                Text('Rp 320.000',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 27,
                        letterSpacing: -.6)),
                SizedBox(height: 5),
                Text('3 Pesanan selesai',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 12)),
              ],
            ),
          ),
          SizedBox(
            width: 118,
            height: 80,
            child: CustomPaint(painter: _MiniChartPainter()),
          ),
        ],
      ),
    );
  }
}

class _MiniChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final barPaint = Paint()..color = Colors.white.withValues(alpha: .28);
    final linePaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    final dotPaint = Paint()..color = Colors.white;

    const values = [0.35, 0.55, 0.42, 0.72, 0.60, 0.88, 0.70];
    final gap = size.width / values.length;
    for (var i = 0; i < values.length; i++) {
      final x = i * gap + gap * .28;
      final h = size.height * values[i];
      canvas.drawRRect(
        RRect.fromRectAndRadius(Rect.fromLTWH(x, size.height - h, gap * .42, h),
            const Radius.circular(8)),
        barPaint,
      );
    }

    final path = Path();
    for (var i = 0; i < values.length; i++) {
      final x = i * gap + gap * .5;
      final y = size.height - (size.height * values[i]) + 6;
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    canvas.drawPath(path, linePaint);
    for (var i = 0; i < values.length; i++) {
      final x = i * gap + gap * .5;
      final y = size.height - (size.height * values[i]) + 6;
      canvas.drawCircle(Offset(x, y), 3.2, dotPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
