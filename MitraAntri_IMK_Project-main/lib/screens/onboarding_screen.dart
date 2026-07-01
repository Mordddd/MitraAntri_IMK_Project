import 'package:flutter/material.dart';
import '../app/app_scope.dart';
import '../core/app_colors.dart';
import '../core/app_routes.dart';
import '../widgets/app_logo.dart';
import '../widgets/gradient_background.dart';
import '../widgets/illustrations.dart';
import '../widgets/primary_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
                child: ConstrainedBox(
                  constraints:
                      BoxConstraints(minHeight: constraints.maxHeight - 48),
                  child: Column(
                    children: [
                      const SizedBox(height: 6),
                      const AppLogo(),
                      const SizedBox(height: 28),
                      Text(
                        'Mitra tepercaya untuk\nmengantre, mengurus, dan\nmenghemat waktu Anda.',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              height: 1.42,
                              fontSize: 22,
                              fontWeight: FontWeight.w900,
                            ),
                      ),
                      const SizedBox(height: 22),
                      const Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        alignment: WrapAlignment.center,
                        children: [
                          _FeaturePill(
                              icon: Icons.verified_user_rounded,
                              text: 'Terverifikasi'),
                          _FeaturePill(
                              icon: Icons.schedule_rounded,
                              text: 'Hemat waktu'),
                          _FeaturePill(
                              icon: Icons.lock_rounded,
                              text: 'Pembayaran aman'),
                        ],
                      ),
                      const SizedBox(height: 26),
                      const QueueHeroIllustration(height: 230),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(3, (index) {
                          final active = index == 0;
                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 180),
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            width: active ? 24 : 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: active ? AppColors.teal : AppColors.border,
                              borderRadius: BorderRadius.circular(99),
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 24),
                      PrimaryButton(
                        text: 'Mulai sebagai Pengguna',
                        icon: Icons.arrow_forward_rounded,
                        onPressed: () {
                          AppScope.read(context).enterCustomerMode();
                          Navigator.pushReplacementNamed(
                              context, AppRoutes.home);
                        },
                      ),
                      const SizedBox(height: 8),
                      OutlinedButton.icon(
                        onPressed: () {
                          AppScope.read(context).enterPartnerMode();
                          Navigator.pushReplacementNamed(
                              context, AppRoutes.dashboard);
                        },
                        icon: const Icon(Icons.badge_rounded),
                        label: const Text('Masuk sebagai Mitra'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: AppColors.navy,
                          minimumSize: const Size(double.infinity, 48),
                          side: const BorderSide(color: AppColors.border),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _FeaturePill extends StatelessWidget {
  const _FeaturePill({required this.icon, required this.text});
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(99),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
              color: AppColors.navy.withValues(alpha: .05),
              blurRadius: 12,
              offset: const Offset(0, 6))
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: AppColors.teal),
          const SizedBox(width: 6),
          Text(text,
              style: const TextStyle(
                  color: AppColors.navy,
                  fontWeight: FontWeight.w800,
                  fontSize: 11.5)),
        ],
      ),
    );
  }
}
