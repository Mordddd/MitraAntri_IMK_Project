import 'package:flutter/material.dart';

import '../core/app_colors.dart';
import '../dummy/dummy_data.dart';
import '../utils/snackbar_helper.dart';
import '../widgets/top_app_bar.dart';
import '../widgets/primary_button.dart';

class DriverChatScreen extends StatelessWidget {
  const DriverChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final driver = DummyData.mitra;

    return Scaffold(
      appBar: TopAppBar(title: driver.name),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 48,
                backgroundColor: AppColors.primary.withValues(alpha: 0.12),
                child: const Icon(
                  Icons.person_rounded,
                  size: 48,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                driver.name,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                'Hubungi mitra melalui WhatsApp',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.subtext,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              PrimaryButton(
                text: 'Contact via WhatsApp',
                icon: Icons.chat_rounded,
                onPressed: () {
                  SnackbarHelper.show(
                    context,
                    'Membuka WhatsApp ke ${driver.phone}...',
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
