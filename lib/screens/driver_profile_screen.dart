import 'package:flutter/material.dart';

import '../core/app_colors.dart';
import '../dummy/dummy_data.dart';
import '../utils/snackbar_helper.dart';
import '../widgets/primary_button.dart';
import '../widgets/top_app_bar.dart';

class DriverProfileScreen extends StatelessWidget {
  const DriverProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final driver = DummyData.mitra;

    return Scaffold(
      appBar: TopAppBar(title: 'Profil Mitra'),
      body: SingleChildScrollView(
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
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 52,
                        backgroundColor:
                            AppColors.primary.withValues(alpha: 0.12),
                        child: const Icon(
                          Icons.person_rounded,
                          size: 52,
                          color: AppColors.primary,
                        ),
                      ),
                      if (driver.isOnline)
                        Positioned(
                          bottom: 4,
                          right: 4,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.success,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                            child: const Text(
                              'Online',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    driver.name,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.star_rounded,
                          color: Colors.amber, size: 20),
                      const SizedBox(width: 4),
                      Text(
                        driver.rating.toString(),
                        style: const TextStyle(fontWeight: FontWeight.w800),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '• ${driver.finishedOrders} pesanan',
                        style: const TextStyle(color: AppColors.subtext),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            _InfoCard(
              icon: Icons.directions_car_rounded,
              label: 'Nomor Kendaraan',
              value: driver.vehicleNumber,
            ),
            _InfoCard(
              icon: Icons.phone_rounded,
              label: 'Nomor Telepon',
              value: driver.phone,
            ),
            _InfoCard(
              icon: Icons.circle,
              iconColor:
                  driver.isOnline ? AppColors.success : AppColors.subtext,
              label: 'Status',
              value: driver.isOnline ? 'Online' : 'Offline',
            ),
            const SizedBox(height: 24),
            PrimaryButton(
              text: 'Contact via WhatsApp',
              icon: Icons.chat_rounded,
              onPressed: () {
                SnackbarHelper.show(
                  context,
                  'Membuka WhatsApp ke ${driver.name}...',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({
    required this.icon,
    required this.label,
    required this.value,
    this.iconColor = AppColors.primary,
  });

  final IconData icon;
  final String label;
  final String value;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Icon(icon, color: iconColor),
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
