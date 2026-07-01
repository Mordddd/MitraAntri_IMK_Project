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
      appBar: TopAppBar(title: 'Titip kuliner'),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
        children: [
          const Text(
            'Makanannya datang.\nAntreannya tidak.',
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
            'Berikan detail restoran dan menu untuk mitra.',
            style: TextStyle(color: AppColors.subtext),
          ),
          const SizedBox(height: 22),
          TextField(
            controller: _restaurantController,
            onChanged: (_) => setState(() {}),
            decoration: InputDecoration(
              labelText: 'Nama restoran',
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
              labelText: 'Nama menu',
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
              labelText: 'Alamat restoran',
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
              labelText: 'Tautan Google Maps',
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
              labelText: 'Detail pesanan',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            height: 120,
            decoration: BoxDecoration(
              color: AppColors.card,
              borderRadius: BorderRadius.circular(26),
              border: Border.all(color: Colors.white70),
              boxShadow: AppColors.cardShadow,
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.add_a_photo_outlined,
                    size: 40, color: AppColors.primary),
                SizedBox(height: 8),
                Text('Tambahkan foto referensi'),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: SafeArea(
          child: PrimaryButton(
            text: 'Pesan mitra kuliner',
            icon: Icons.person_search_rounded,
            onPressed:
                _canSubmit ? () => SnackbarHelper.orderCreated(context) : null,
          ),
        ),
      ),
    );
  }
}
