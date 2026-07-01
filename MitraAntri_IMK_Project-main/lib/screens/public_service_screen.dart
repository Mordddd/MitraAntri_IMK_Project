import 'package:flutter/material.dart';
import '../core/app_colors.dart';
import '../data/dummy_data.dart';
import '../widgets/top_app_bar.dart';
import '../widgets/primary_button.dart';

class PublicServiceScreen extends StatefulWidget {
  const PublicServiceScreen({super.key});

  @override
  State<PublicServiceScreen> createState() => _PublicServiceScreenState();
}

class _PublicServiceScreenState extends State<PublicServiceScreen> {
  String? _selectedLocation;
  String? _selectedService;
  int? _budget;

  @override
  Widget build(BuildContext context) {
    final selectedLocationData = _selectedLocation != null
        ? DummyData.publicServices.firstWhere((l) => l.id == _selectedLocation)
        : null;

    return Scaffold(
      appBar: TopAppBar(title: 'Layanan Publik'),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Select Location
          Text(
            'Pilih Lokasi Layanan',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),

          Column(
            children: List.generate(
              DummyData.publicServices.length,
              (index) {
                final location = DummyData.publicServices[index];
                final isSelected = _selectedLocation == location.id;

                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _selectedLocation = location.id;
                        _selectedService = null;
                      });
                    },
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: isSelected ? AppColors.teal : Colors.grey[300]!,
                          width: isSelected ? 2 : 1,
                        ),
                        borderRadius: BorderRadius.circular(12),
                        color: isSelected ? AppColors.teal.withValues(alpha: 0.05) : Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  location.name,
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              if (isSelected)
                                const Icon(Icons.check_circle_rounded, color: AppColors.teal),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Icon(Icons.location_on_rounded, size: 14, color: AppColors.teal),
                              const SizedBox(width: 4),
                              Expanded(
                                child: Text(
                                  location.address,
                                  style: Theme.of(context).textTheme.labelSmall,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              const Icon(Icons.phone_rounded, size: 14, color: AppColors.teal),
                              const SizedBox(width: 4),
                              Text(
                                location.phone,
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          if (selectedLocationData != null) ...[
            const SizedBox(height: 24),

            // Select Service Type
            Text(
              'Pilih Jenis Layanan',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),

            Column(
              children: List.generate(
                selectedLocationData.services.length,
                (index) {
                  final service = selectedLocationData.services[index];
                  final isSelected = _selectedService == service.id;

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _selectedService = service.id;
                        });
                      },
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: isSelected ? AppColors.teal : Colors.grey[300]!,
                            width: isSelected ? 2 : 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                          color: isSelected ? AppColors.teal.withOpacity(0.05) : Colors.white,
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: isSelected ? AppColors.teal : Colors.grey[300]!,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: isSelected
                                  ? const Center(
                                      child: Icon(
                                        Icons.check_rounded,
                                        size: 14,
                                        color: AppColors.teal,
                                      ),
                                    )
                                  : null,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    service.name,
                                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    '${service.estimatedWaitTime} menit',
                                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 12),
                            Text(
                              service.fee == 0 ? 'Gratis' : 'Rp ${service.fee}',
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppColors.teal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 24),

            // Budget Input
            Text(
              'Atur Anggaran (Opsional)',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),

            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Masukkan nominal anggaran',
                prefixIcon: const Icon(Icons.attach_money_rounded),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
              onChanged: (value) {
                setState(() {
                  _budget = int.tryParse(value);
                });
              },
            ),
          ],
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: SafeArea(
          child: PrimaryButton(
            text: 'Pesan Mitra Sekarang',
            icon: Icons.arrow_forward_rounded,
            onPressed: _selectedLocation != null && _selectedService != null
                ? () {
                    final location = DummyData.publicServices.firstWhere(
                      (l) => l.id == _selectedLocation,
                    );
                    final service = location.services.firstWhere(
                      (s) => s.id == _selectedService,
                    );
                    Navigator.of(context).pushNamed(
                      '/booking',
                      arguments: {
                        'type': 'public_service',
                        'location': location,
                        'service': service,
                        'budget': _budget,
                      },
                    );
                  }
                : null,
          ),
        ),
      ),
    );
  }
}
