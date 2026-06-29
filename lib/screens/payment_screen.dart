import 'package:flutter/material.dart';
import '../app/app_controller.dart';
import '../app/app_scope.dart';
import '../core/app_colors.dart';
import '../core/app_routes.dart';
import '../widgets/app_card.dart';
import '../widgets/gradient_background.dart';
import '../widgets/order_header_card.dart';
import '../widgets/payment_option.dart';
import '../widgets/primary_button.dart';
import '../widgets/section_header.dart';
import '../widgets/top_app_bar.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final app = AppScope.watch(context);
    final order = app.order;

    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: Column(
            children: [
              const TopAppBar(title: 'Detail Pesanan'),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      OrderHeaderCard(order: order),
                      const SizedBox(height: 16),
                      const SectionHeader(title: 'Ringkasan Pesanan'),
                      const SizedBox(height: 12),
                      AppCard(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            _SummaryRow(label: 'Layanan', value: order.service),
                            _SummaryRow(label: 'Tanggal', value: order.date),
                            _SummaryRow(label: 'Waktu', value: order.time),
                            _SummaryRow(label: 'Mitra', value: order.mitraName),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      const SectionHeader(title: 'Rincian Biaya'),
                      const SizedBox(height: 12),
                      const AppCard(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          children: [
                            _SummaryRow(
                                label: 'Jasa Layanan', value: 'Rp 90.000'),
                            _SummaryRow(
                                label: 'Biaya Tambahan', value: 'Rp 10.000'),
                            _SummaryRow(label: 'Subtotal', value: 'Rp 100.000'),
                            _SummaryRow(
                                label: 'Biaya Platform', value: 'Rp 5.000'),
                            Divider(height: 22, color: AppColors.border),
                            _SummaryRow(
                                label: 'Total Pembayaran',
                                value: 'Rp 105.000',
                                bold: true),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      const SectionHeader(title: 'Metode Pembayaran'),
                      const SizedBox(height: 12),
                      PaymentOption(
                        title: 'Saldo Mitra Antri',
                        subtitle: 'Saldo tersedia: Rp 150.000',
                        icon: Icons.account_balance_wallet_rounded,
                        selected: app.paymentMethod == PaymentMethod.balance,
                        onTap: () =>
                            app.selectPaymentMethod(PaymentMethod.balance),
                      ),
                      PaymentOption(
                        title: 'Transfer Bank',
                        subtitle: 'BCA, Mandiri, BRI, BNI',
                        icon: Icons.account_balance_rounded,
                        selected:
                            app.paymentMethod == PaymentMethod.bankTransfer,
                        onTap: () =>
                            app.selectPaymentMethod(PaymentMethod.bankTransfer),
                      ),
                      PaymentOption(
                        title: 'QRIS / E-Wallet',
                        subtitle: 'Scan QR atau bayar lewat dompet digital',
                        icon: Icons.qr_code_rounded,
                        selected: app.paymentMethod == PaymentMethod.qris,
                        onTap: () =>
                            app.selectPaymentMethod(PaymentMethod.qris),
                      ),
                      const SizedBox(height: 14),
                      AppCard(
                        color: AppColors.mint,
                        borderColor: AppColors.teal.withValues(alpha: .12),
                        padding: const EdgeInsets.all(14),
                        child: const Row(
                          children: [
                            Icon(Icons.lock_rounded, color: AppColors.teal),
                            SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                'Pembayaran dilindungi. Dana diteruskan setelah pesanan selesai.',
                                style: TextStyle(
                                    color: AppColors.navy,
                                    fontSize: 12.5,
                                    fontWeight: FontWeight.w700,
                                    height: 1.35),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      PrimaryButton(
                        text: 'Konfirmasi & Bayar',
                        icon: Icons.lock_rounded,
                        onPressed: () => _confirmPayment(context, app),
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

  Future<void> _confirmPayment(BuildContext context, AppController app) async {
    if (!app.pay()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Pesanan harus selesai sebelum dibayar.')),
      );
      return;
    }

    await showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(Icons.check_circle_rounded,
            color: AppColors.success, size: 48),
        title: const Text('Pembayaran berhasil'),
        content: const Text('Pesanan telah selesai dan pembayaran tercatat.'),
        actions: [
          FilledButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Kembali ke Beranda'),
          ),
        ],
      ),
    );
    if (!context.mounted) return;
    Navigator.pushNamedAndRemoveUntil(context, AppRoutes.home, (_) => false);
  }
}

class _SummaryRow extends StatelessWidget {
  const _SummaryRow(
      {required this.label, required this.value, this.bold = false});

  final String label;
  final String value;
  final bool bold;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: Text(
              label,
              style: TextStyle(
                  color: bold ? AppColors.navy : AppColors.subtext,
                  fontWeight: bold ? FontWeight.w900 : FontWeight.w700,
                  fontSize: bold ? 14 : 12.5),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 5,
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: TextStyle(
                  color: AppColors.navy,
                  fontWeight: bold ? FontWeight.w900 : FontWeight.w800,
                  fontSize: bold ? 16 : 12.5),
            ),
          ),
        ],
      ),
    );
  }
}
