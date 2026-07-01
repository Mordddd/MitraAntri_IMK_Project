import 'package:flutter/material.dart';

import '../core/app_colors.dart';
import '../core/app_routes.dart';
import '../utils/snackbar_helper.dart';
import '../widgets/primary_button.dart';
import '../models/hospital.dart';

class HospitalDetailsScreen extends StatefulWidget {
  const HospitalDetailsScreen({super.key, required this.hospital});

  final Hospital hospital;

  @override
  State<HospitalDetailsScreen> createState() => _HospitalDetailsScreenState();
}

class _HospitalDetailsScreenState extends State<HospitalDetailsScreen> {
  String? _selectedService;

  @override
  Widget build(BuildContext context) {
    final hospital = widget.hospital;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          hospital.name,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
        ),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 140,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Icon(
                Icons.local_hospital_rounded,
                size: 64,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              hospital.name,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.star_rounded, color: Colors.amber, size: 18),
                const SizedBox(width: 4),
                Text(
                  hospital.rating.toString(),
                  style: const TextStyle(fontWeight: FontWeight.w800),
                ),
                const SizedBox(width: 12),
                Text(
                  hospital.district,
                  style: const TextStyle(color: AppColors.subtext),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.location_on_rounded,
                    size: 18, color: AppColors.primary),
                const SizedBox(width: 8),
                Expanded(child: Text(hospital.address)),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              'Pilih Layanan',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
            ),
            const SizedBox(height: 12),
            ...hospital.departments.map((service) {
              final selected = _selectedService == service;
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: InkWell(
                  onTap: () => setState(() => _selectedService = service),
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: selected
                          ? AppColors.primary.withValues(alpha: 0.08)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: selected ? AppColors.primary : AppColors.border,
                        width: selected ? 2 : 1,
                      ),
                      boxShadow: selected ? AppColors.cardShadow : null,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          _serviceIcon(service),
                          color: AppColors.primary,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            service,
                            style: const TextStyle(fontWeight: FontWeight.w800),
                          ),
                        ),
                        if (selected)
                          const Icon(Icons.check_circle_rounded,
                              color: AppColors.primary),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: SafeArea(
          child: PrimaryButton(
            text: 'Order Partner',
            icon: Icons.person_search_rounded,
            onPressed: _selectedService == null
                ? null
                : () {
                    SnackbarHelper.orderCreated(context);
                    Navigator.pushNamed(context, AppRoutes.driverProfile);
                  },
          ),
        ),
      ),
    );
  }

  IconData _serviceIcon(String service) {
    return switch (service) {
      'Take Medicine' => Icons.medication_rounded,
      'Hospital Registration' => Icons.app_registration_rounded,
      'Payment' => Icons.payments_rounded,
      'Administration' => Icons.description_rounded,
      'Take Laboratory Result' => Icons.biotech_rounded,
      _ => Icons.medical_services_rounded,
    };
  }
}
