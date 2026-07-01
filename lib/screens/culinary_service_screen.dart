import 'package:flutter/material.dart';

import '../core/app_colors.dart';
import '../utils/snackbar_helper.dart';
import '../widgets/primary_button.dart';
import '../widgets/top_app_bar.dart';

class CulinaryServiceScreen extends StatefulWidget {
  const CulinaryServiceScreen({super.key});

  @override
  State<CulinaryServiceScreen> createState() => _CulinaryServiceScreenState();
}

class _CulinaryServiceScreenState extends State<CulinaryServiceScreen> {
  final _restaurantController = TextEditingController();
  final _foodController = TextEditingController();
  final _addressController = TextEditingController();
  final _mapsController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void dispose() {
    _restaurantController.dispose();
    _foodController.dispose();
    _addressController.dispose();
    _mapsController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  bool get _canSubmit =>
      _restaurantController.text.trim().isNotEmpty &&
      _foodController.text.trim().isNotEmpty &&
      _addressController.text.trim().isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopAppBar(title: 'Culinary Service'),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextField(
            controller: _restaurantController,
            onChanged: (_) => setState(() {}),
            decoration: InputDecoration(
              labelText: 'Restaurant Name',
              prefixIcon: const Icon(Icons.storefront_outlined),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _foodController,
            onChanged: (_) => setState(() {}),
            decoration: InputDecoration(
              labelText: 'Food Name',
              prefixIcon: const Icon(Icons.restaurant_outlined),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _addressController,
            onChanged: (_) => setState(() {}),
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
            controller: _mapsController,
            decoration: InputDecoration(
              labelText: 'Google Maps Link',
              prefixIcon: const Icon(Icons.map_outlined),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          const SizedBox(height: 12),
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
                Icon(Icons.add_a_photo_outlined,
                    size: 40, color: AppColors.primary),
                SizedBox(height: 8),
                Text('Upload Food Photo'),
              ],
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
            onPressed: _canSubmit
                ? () => SnackbarHelper.orderCreated(context)
                : null,
          ),
        ),
      ),
    );
  }
}
