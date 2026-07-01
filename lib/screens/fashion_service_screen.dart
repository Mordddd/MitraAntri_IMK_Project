import 'package:flutter/material.dart';

import '../core/app_colors.dart';
import '../dummy/dummy_data.dart';
import '../utils/snackbar_helper.dart';
import '../widgets/primary_button.dart';
import '../widgets/top_app_bar.dart';

class FashionServiceScreen extends StatefulWidget {
  const FashionServiceScreen({super.key});

  @override
  State<FashionServiceScreen> createState() => _FashionServiceScreenState();
}

class _FashionServiceScreenState extends State<FashionServiceScreen> {
  final _searchController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _addressController = TextEditingController();
  final _notesController = TextEditingController();
  String? _selectedBrandId;

  @override
  void dispose() {
    _searchController.dispose();
    _descriptionController.dispose();
    _addressController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  List<String> get _filteredBrands {
    final query = _searchController.text.toLowerCase();
    if (query.isEmpty) return DummyData.fashionBrandNames;
    return DummyData.fashionBrandNames
        .where((b) => b.toLowerCase().contains(query))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopAppBar(title: 'Fashion Service'),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextField(
            controller: _searchController,
            onChanged: (_) => setState(() {}),
            decoration: InputDecoration(
              hintText: 'Cari brand...',
              prefixIcon: const Icon(Icons.search_rounded),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Brand',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w900,
                ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: _filteredBrands.map((brandName) {
              final brand = DummyData.fashionBrands
                  .firstWhere((b) => b.name == brandName);
              final selected = _selectedBrandId == brand.id;
              return ChoiceChip(
                label: Text(brandName),
                selected: selected,
                selectedColor: AppColors.primary.withValues(alpha: 0.15),
                onSelected: (_) =>
                    setState(() => _selectedBrandId = brand.id),
              );
            }).toList(),
          ),
          if (_selectedBrandId != null) ...[
            const SizedBox(height: 16),
            Container(
              height: 120,
              decoration: BoxDecoration(
                color: AppColors.lightGrey,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.border),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.image_rounded,
                      size: 40, color: AppColors.primary),
                  SizedBox(height: 8),
                  Text('Upload Product Image'),
                ],
              ),
            ),
          ],
          const SizedBox(height: 16),
          TextField(
            controller: _descriptionController,
            maxLines: 3,
            decoration: InputDecoration(
              labelText: 'Description',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _addressController,
            decoration: InputDecoration(
              labelText: 'Address',
              prefixIcon: const Icon(Icons.location_on_outlined),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _notesController,
            maxLines: 2,
            decoration: InputDecoration(
              labelText: 'Notes',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: SafeArea(
          child: PrimaryButton(
            text: 'Order Partner',
            icon: Icons.person_search_rounded,
            onPressed: _selectedBrandId == null ||
                    _addressController.text.trim().isEmpty
                ? null
                : () {
                    SnackbarHelper.orderCreated(context);
                  },
          ),
        ),
      ),
    );
  }
}
