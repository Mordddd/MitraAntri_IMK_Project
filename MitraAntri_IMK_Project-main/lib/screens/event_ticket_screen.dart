import 'package:flutter/material.dart';
import '../core/app_colors.dart';
import '../data/dummy_data.dart';
import '../widgets/top_app_bar.dart';
import '../widgets/primary_button.dart';

class EventTicketScreen extends StatefulWidget {
  const EventTicketScreen({super.key});

  @override
  State<EventTicketScreen> createState() => _EventTicketScreenState();
}

class _EventTicketScreenState extends State<EventTicketScreen> {
  String? _selectedEvent;
  String? _selectedService;

  @override
  Widget build(BuildContext context) {
    final selectedEventData = _selectedEvent != null
        ? DummyData.events.firstWhere((e) => e.id == _selectedEvent)
        : null;

    return Scaffold(
      appBar: TopAppBar(title: 'Tiket Konser & Event'),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Select Event
          Text(
            'Pilih Event',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),

          Column(
            children: List.generate(
              DummyData.events.length,
              (index) {
                final event = DummyData.events[index];
                final isSelected = _selectedEvent == event.id;
                final dateStr = '${event.date.day}/${event.date.month}/${event.date.year}';

                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _selectedEvent = event.id;
                        _selectedService = null;
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
                          // Event poster
                          Container(
                            width: double.infinity,
                            height: 140,
                            decoration: BoxDecoration(
                              color: const Color(0xFF9C4DCC).withValues(alpha: 0.2),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12),
                              ),
                            ),
                            child: Icon(
                              Icons.event_rounded,
                              size: 48,
                              color: Color(0xFF9C4DCC).withValues(alpha: 0.8),
                            ),
                          ),

                          // Event info
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
                                        event.name,
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
                                    const Icon(Icons.calendar_today_rounded, size: 14, color: AppColors.teal),
                                    const SizedBox(width: 4),
                                    Text(
                                      dateStr,
                                      style: Theme.of(context).textTheme.labelSmall,
                                    ),
                                    const SizedBox(width: 16),
                                    const Icon(Icons.location_on_rounded, size: 14, color: AppColors.teal),
                                    const SizedBox(width: 4),
                                    Expanded(
                                      child: Text(
                                        event.venue,
                                        style: Theme.of(context).textTheme.labelSmall,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
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

          if (selectedEventData != null) ...[
            const SizedBox(height: 24),

            // Select Service
            Text(
              'Pilih Jenis Layanan',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),

            Column(
              children: List.generate(
                selectedEventData.services.length,
                (index) {
                  final service = selectedEventData.services[index];
                  final isSelected = _selectedService == service.id;

                  String getServiceLabel(String type) {
                    return switch (type) {
                      'wristband_exchange' => 'Pertukaran Gelang Masuk',
                      'ticket_queue' => 'Antri Pembelian Tiket',
                      'merchandise_queue' => 'Antri Merchandise',
                      _ => type,
                    };
                  }

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
                                    getServiceLabel(service.type),
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
                                  const SizedBox(height: 4),
                                  Text(
                                    '~${service.estimatedWaitTime} menit',
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
          ],
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: SafeArea(
          child: PrimaryButton(
            text: 'Pesan Mitra Sekarang',
            icon: Icons.arrow_forward_rounded,
            onPressed: _selectedEvent != null && _selectedService != null
                ? () {
                    final event = DummyData.events.firstWhere(
                      (e) => e.id == _selectedEvent,
                    );
                    final service = event.services.firstWhere(
                      (s) => s.id == _selectedService,
                    );
                    Navigator.of(context).pushNamed(
                      '/booking',
                      arguments: {
                        'type': 'event',
                        'event': event,
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
