import 'package:flutter/material.dart';

import '../core/app_colors.dart';
import '../core/app_routes.dart';
import '../dummy/dummy_data.dart';
import '../widgets/gradient_background.dart';
import '../widgets/top_app_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key, this.showBackButton = true});

  final bool showBackButton;

  @override
  Widget build(BuildContext context) {
    final user = DummyData.currentUser;

    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              if (showBackButton)
                TopAppBar(title: 'Profil')
              else
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 18, 20, 0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Profil',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(color: AppColors.border),
                        ),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 48,
                              backgroundColor:
                                  AppColors.primary.withValues(alpha: 0.12),
                              child: const Icon(
                                Icons.person_rounded,
                                size: 48,
                                color: AppColors.primary,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              user.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(fontWeight: FontWeight.w900),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              user.email,
                              style: const TextStyle(color: AppColors.subtext),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      _ProfileTile(
                        icon: Icons.email_outlined,
                        label: 'Email',
                        value: user.email,
                      ),
                      _ProfileTile(
                        icon: Icons.phone_outlined,
                        label: 'Nomor telepon',
                        value: user.phone,
                      ),
                      _ProfileTile(
                        icon: Icons.verified_user_outlined,
                        label: 'Status',
                        value: user.verified
                            ? 'Terverifikasi'
                            : 'Belum verifikasi',
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton.icon(
                          onPressed: () {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              AppRoutes.login,
                              (_) => false,
                            );
                          },
                          icon: const Icon(Icons.logout_rounded,
                              color: AppColors.danger),
                          label: const Text(
                            'Keluar',
                            style: TextStyle(
                              color: AppColors.danger,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            side: const BorderSide(color: AppColors.danger),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
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
}

class _ProfileTile extends StatelessWidget {
  const _ProfileTile({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primary),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    color: AppColors.subtext,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: const TextStyle(
                    fontWeight: FontWeight.w800,
                    color: AppColors.navy,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
