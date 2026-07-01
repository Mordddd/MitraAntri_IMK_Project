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
                        'Antrean berjalan.\nHidup Anda juga.',
                        textAlign: TextAlign.center,
                        style:
                            Theme.of(context).textTheme.headlineLarge?.copyWith(
                                  height: 1.05,
                                  fontSize: 34,
                                  letterSpacing: -1,
                                  fontWeight: FontWeight.w700,
                                ),
                      ),
                      const SizedBox(height: 14),
                      const Text(
                        'Mitra terverifikasi menangani antrean, pembelian, dan urusan layanan untuk Anda.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.subtext,
                          height: 1.45,
                        ),
                      ),
                      const SizedBox(height: 26),
                      const QueueHeroIllustration(height: 230),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(3, (index) {
                          final active = index == 0;
                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 520),
                            curve: Curves.easeOutQuart,
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
                          side: BorderSide.none,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
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
