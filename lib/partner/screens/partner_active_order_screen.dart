import 'package:flutter/material.dart';

import '../../core/app_colors.dart';
import '../../utils/currency_formatter.dart';
import '../../utils/snackbar_helper.dart';
import '../models/partner_order.dart';
import '../partner_scope.dart';

class PartnerActiveOrderScreen extends StatelessWidget {
  const PartnerActiveOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final partner = PartnerScope.watch(context);
    final order = partner.activeOrder;

    if (order == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Pesanan Aktif')),
        body: const Center(child: Text('Tidak ada pesanan aktif')),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        title: const Text('Pesanan Aktif'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.3),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(99),
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.circle, size: 8, color: Colors.white),
                            SizedBox(width: 6),
                            Text(
                              'Sedang Berlangsung',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    order.customerName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    order.serviceType,
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.85),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            _DetailCard(
              icon: Icons.location_on_rounded,
              title: 'Destinasi',
              subtitle: order.destination,
              detail: order.address,
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _DetailCard(
                    icon: Icons.place_rounded,
                    title: 'Jarak',
                    subtitle: '${order.distanceKm} km',
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _DetailCard(
                    icon: Icons.schedule_rounded,
                    title: 'Estimasi',
                    subtitle: '${order.estimatedMinutes} menit',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _DetailCard(
              icon: order.category.icon,
              title: 'Jenis Layanan',
              subtitle: order.category.label,
              iconColor: order.category.color,
            ),
            const SizedBox(height: 12),
            _DetailCard(
              icon: Icons.payments_rounded,
              title: 'Pendapatan',
              subtitle: CurrencyFormatter.rupiah(order.price),
              iconColor: AppColors.primary,
            ),
            const SizedBox(height: 24),
            _ActionButton(
              icon: Icons.map_rounded,
              label: 'Buka Maps',
              color: AppColors.blue,
              onTap: () => SnackbarHelper.show(
                context,
                'Fitur peta belum terhubung.',
              ),
            ),
            const SizedBox(height: 10),
            _ActionButton(
              icon: Icons.phone_rounded,
              label: 'Telepon Pelanggan',
              color: AppColors.navy,
              onTap: () => SnackbarHelper.show(
                context,
                'Fitur panggilan belum terhubung.',
              ),
            ),
            const SizedBox(height: 10),
            _ActionButton(
              icon: Icons.chat_rounded,
              label: 'WhatsApp',
              color: const Color(0xFF25D366),
              onTap: () => SnackbarHelper.show(
                context,
                'Fitur WhatsApp belum terhubung.',
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: () {
                  partner.finishActiveOrder();
                  SnackbarHelper.show(context, 'Pesanan selesai!');
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.check_circle_rounded),
                label: const Text('Selesaikan Pesanan'),
                style: FilledButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DetailCard extends StatelessWidget {
  const _DetailCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.detail,
    this.iconColor = AppColors.primary,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final String? detail;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: iconColor.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: AppColors.subtext,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                    color: AppColors.navy,
                  ),
                ),
                if (detail != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    detail!,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.subtext,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        onPressed: onTap,
        icon: Icon(icon, color: color),
        label: Text(
          label,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.w800,
          ),
        ),
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 14),
          side: BorderSide(color: color.withValues(alpha: 0.4)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}
