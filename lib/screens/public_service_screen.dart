import 'package:flutter/material.dart';

import '../core/app_colors.dart';
import '../dummy/dummy_data.dart';
import '../models/public_service.dart';
import '../utils/snackbar_helper.dart';
import '../widgets/primary_button.dart';
import '../widgets/top_app_bar.dart';

class PublicServiceScreen extends StatefulWidget {
  const PublicServiceScreen({super.key});

  @override
  State<PublicServiceScreen> createState() => _PublicServiceScreenState();
}

class _PublicServiceScreenState extends State<PublicServiceScreen> {
  final _searchController = TextEditingController();
  final _budgetController = TextEditingController();
  String? _selectedLocation;
  String? _selectedService;

  @override
  void dispose() {
    _searchController.dispose();
    _budgetController.dispose();
    super.dispose();
  }

  List<PublicServiceLocation> get _filteredLocations {
    final query = _searchController.text.toLowerCase();
    if (query.isEmpty) return DummyData.publicServices;
    return DummyData.publicServices
        .where((l) => l.name.toLowerCase().contains(query))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final selectedLocationData = _selectedLocation != null
        ? DummyData.publicServices.firstWhere((l) => l.id == _selectedLocation)
        : null;

    return Scaffold(
      appBar: TopAppBar(title: 'Layanan publik'),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
        children: [
          const Text(
            'Urus dokumen,\ntanpa kehilangan hari.',
            maxLines: 2,
            style: TextStyle(
              color: AppColors.navy,
              fontSize: 30,
              height: 1.06,
              letterSpacing: -.9,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Temukan kantor tujuan dan pilih keperluan Anda.',
            style: TextStyle(color: AppColors.subtext),
          ),
          const SizedBox(height: 22),
          TextField(
            controller: _searchController,
            onChanged: (_) => setState(() {}),
            decoration: InputDecoration(
              hintText: 'Cari lokasi...',
              prefixIcon: const Icon(Icons.search_rounded),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Lokasi layanan',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
          ),
          const SizedBox(height: 12),
          ..._filteredLocations.map((location) {
            final isSelected = _selectedLocation == location.id;
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: InkWell(
                onTap: () => setState(() {
                  _selectedLocation = location.id;
                  _selectedService = null;
                }),
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.primary.withValues(alpha: 0.08)
                        : AppColors.card,
                    borderRadius: BorderRadius.circular(22),
                    border: Border.all(
                      color: isSelected ? AppColors.primary : Colors.white70,
                      width: isSelected ? 2 : 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.apartment_rounded,
                          color: AppColors.primary),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              location.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              location.address,
                              style: const TextStyle(
                                color: AppColors.subtext,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
          if (selectedLocationData != null) ...[
            const SizedBox(height: 16),
            Text(
              'Jenis keperluan',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
            const SizedBox(height: 12),
            ...DummyData.publicServiceTypes.map((typeName) {
              final isSelected = _selectedService == typeName;
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: InkWell(
                  onTap: () => setState(() => _selectedService = typeName),
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppColors.primary.withValues(alpha: 0.08)
                          : AppColors.card,
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(
                        color: isSelected ? AppColors.primary : Colors.white70,
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            typeName,
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                        if (isSelected)
                          const Icon(Icons.check_circle_rounded,
                              color: AppColors.primary),
                      ],
                    ),
                  ),
                ),
              );
            }),
            const SizedBox(height: 12),
            TextField(
              controller: _budgetController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Batas anggaran',
                prefixIcon: const Icon(Icons.attach_money_rounded),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ],
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: SafeArea(
          child: PrimaryButton(
            text: 'Pesan mitra layanan',
            icon: Icons.person_search_rounded,
            onPressed: _selectedLocation != null && _selectedService != null
                ? () => SnackbarHelper.orderCreated(context)
                : null,
          ),
        ),
      ),
    );
  }
}
