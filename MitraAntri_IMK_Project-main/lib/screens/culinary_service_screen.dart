import 'package:flutter/material.dart';
import '../core/app_colors.dart';
import '../data/dummy_data.dart';
import '../widgets/top_app_bar.dart';
import '../widgets/primary_button.dart';

class CulinaryServiceScreen extends StatefulWidget {
  const CulinaryServiceScreen({super.key});

  @override
  State<CulinaryServiceScreen> createState() => _CulinaryServiceScreenState();
}

class _CulinaryServiceScreenState extends State<CulinaryServiceScreen> {
  String? _selectedRestaurant;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopAppBar(title: 'Layanan Kuliner'),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Info banner
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFF59E0B).withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFF59E0B).withValues(alpha: 0.3)),
            ),
            child: Row(
              children: [
                Icon(Icons.info_rounded, color: Color(0xFFF59E0B)),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Pilih restoran dan biarkan kami ambil nomor meja untuk Anda',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Color(0xFFF59E0B),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Restaurant list
          Text(
            'Restoran Tersedia',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),

          Column(
            children: List.generate(
              DummyData.culinaryServices.length,
              (index) {
                final service = DummyData.culinaryServices[index];
                final isSelected = _selectedRestaurant == service.id;

                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _selectedRestaurant = service.id;
                      });
                    },
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: isSelected ? AppColors.teal : Colors.grey[300]!,
                          width: isSelected ? 2 : 1,
                        ),
                        borderRadius: BorderRadius.circular(12),
                        color: isSelected ? AppColors.teal.withOpacity(0.05) : Colors.white,
                      ),
                      child: Column(
                        children: [
                          // Restaurant image placeholder
                          Container(
                            width: double.infinity,
                            height: 140,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12),
                              ),
                            ),
                            child: Icon(
                              Icons.restaurant_rounded,
                              size: 48,
                              color: Colors.grey[400],
                            ),
                          ),

                          // Info
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        service.restaurantName,
                                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    if (isSelected)
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                        decoration: BoxDecoration(
                                          color: AppColors.teal,
                                          borderRadius: BorderRadius.circular(6),
                                        ),
                                        child: const Icon(Icons.check_rounded, size: 16, color: Colors.white),
                                      ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    const Icon(Icons.location_on_rounded, size: 14, color: AppColors.teal),
                                    const SizedBox(width: 4),
                                    Expanded(
                                      child: Text(
                                        service.address,
                                        style: Theme.of(context).textTheme.labelSmall,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.access_time_rounded, size: 14, color: Colors.grey[600]),
                                        const SizedBox(width: 4),
                                        Text(
                                          '~${service.estimatedTime} min',
                                          style: Theme.of(context).textTheme.labelSmall,
                                        ),
                                      ],
                                    ),
                                    Text(
                                      'Rp ${service.fee}',
                                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.teal,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
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
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: SafeArea(
          child: PrimaryButton(
            text: 'Pesan Sekarang',
            icon: Icons.arrow_forward_rounded,
            onPressed: _selectedRestaurant != null
                ? () {
                    final service = DummyData.culinaryServices.firstWhere(
                      (s) => s.id == _selectedRestaurant,
                    );
                    Navigator.of(context).pushNamed(
                      '/booking',
                      arguments: {
                        'type': 'culinary',
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
