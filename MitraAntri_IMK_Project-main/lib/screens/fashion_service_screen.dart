import 'package:flutter/material.dart';
import '../core/app_colors.dart';
import '../data/dummy_data.dart';
import '../widgets/top_app_bar.dart';
import '../widgets/primary_button.dart';

class FashionServiceScreen extends StatefulWidget {
  const FashionServiceScreen({super.key});

  @override
  State<FashionServiceScreen> createState() => _FashionServiceScreenState();
}

class _FashionServiceScreenState extends State<FashionServiceScreen> {
  String? _selectedBrand;
  String? _selectedService;

  @override
  Widget build(BuildContext context) {
    final selectedBrandData = _selectedBrand != null
        ? DummyData.fashionBrands.firstWhere((b) => b.id == _selectedBrand)
        : null;

    return Scaffold(
      appBar: TopAppBar(title: 'Layanan Fashion'),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Step 1: Select Brand
          Text(
            'Langkah 1: Pilih Brand',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),

          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: List.generate(
              DummyData.fashionBrands.length,
              (index) {
                final brand = DummyData.fashionBrands[index];
                final isSelected = _selectedBrand == brand.id;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedBrand = brand.id;
                      _selectedService = null;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: isSelected ? AppColors.teal : Colors.white,
                      border: Border.all(
                        color: isSelected ? AppColors.teal : Colors.grey[300]!,
                        width: isSelected ? 2 : 1,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Brand icon
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: isSelected
                              ? Colors.white.withValues(alpha: 0.2)
                                : Colors.grey[200],
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Icon(
                            Icons.shopping_bag_rounded,
                            size: 16,
                            color: isSelected ? Colors.white : AppColors.teal,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          brand.name,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: isSelected ? Colors.white : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 24),

          // Step 2: Select Service
          if (selectedBrandData != null) ...[
            Text(
              'Langkah 2: Pilih Layanan',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),

            Column(
              children: List.generate(
                selectedBrandData.services.length,
                (index) {
                  final service = selectedBrandData.services[index];
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
                          color: isSelected ? AppColors.teal.withValues(alpha: 0.05) : Colors.white,
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
                                    service.type,
                                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    service.description,
                                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 12),
                            Text(
                              'Rp ${service.fee}',
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

            // Step 3: Upload photos
            Text(
              'Langkah 3: Upload Foto Produk',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),

            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300]!, style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey[50],
              ),
              child: Column(
                children: [
                  Icon(Icons.image_rounded, size: 48, color: AppColors.teal),
                  const SizedBox(height: 12),
                  Text(
                    'Tap untuk upload foto',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Maksimal 3 foto',
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: SafeArea(
          child: PrimaryButton(
            text: 'Pesan Sekarang',
            icon: Icons.arrow_forward_rounded,
            onPressed: _selectedBrand != null && _selectedService != null
                ? () {
                    final brand = DummyData.fashionBrands.firstWhere(
                      (b) => b.id == _selectedBrand,
                    );
                    final service = brand.services.firstWhere(
                      (s) => s.id == _selectedService,
                    );
                    Navigator.of(context).pushNamed(
                      '/booking',
                      arguments: {
                        'type': 'fashion',
                        'brand': brand,
                        'service': service,
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
