import 'package:flutter/material.dart';

import '../core/app_colors.dart';
import '../dummy/dummy_data.dart';
import '../models/event.dart';
import '../utils/snackbar_helper.dart';
import '../widgets/primary_button.dart';
import '../widgets/top_app_bar.dart';

class EventTicketScreen extends StatefulWidget {
  const EventTicketScreen({super.key});

  @override
  State<EventTicketScreen> createState() => _EventTicketScreenState();
}

class _EventTicketScreenState extends State<EventTicketScreen> {
  final _searchController = TextEditingController();
  String? _selectedEvent;
  String? _selectedService;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<Event> get _filteredEvents {
    final query = _searchController.text.toLowerCase();
    if (query.isEmpty) return DummyData.events;
    return DummyData.events
        .where((e) => e.name.toLowerCase().contains(query))
        .toList();
  }

  String _serviceLabel(String type) {
    return switch (type) {
      'ticket_war' => 'Ticket War',
      'bracelet_exchange' => 'Bracelet Exchange',
      'merchandise_queue' => 'Merchandise Queue',
      'event_checkin' => 'Event Check-in',
      _ => type,
    };
  }

  @override
  Widget build(BuildContext context) {
    final selectedEventData = _selectedEvent != null
        ? DummyData.events.firstWhere((e) => e.id == _selectedEvent)
        : null;

    return Scaffold(
      appBar: TopAppBar(title: 'Event Ticket'),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextField(
            controller: _searchController,
            onChanged: (_) => setState(() {}),
            decoration: InputDecoration(
              hintText: 'Cari event...',
              prefixIcon: const Icon(Icons.search_rounded),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          const SizedBox(height: 16),
          ..._filteredEvents.map((event) {
            final isSelected = _selectedEvent == event.id;
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: InkWell(
                onTap: () => setState(() {
                  _selectedEvent = event.id;
                  _selectedService = null;
                }),
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: isSelected ? AppColors.primary : AppColors.border,
                      width: isSelected ? 2 : 1,
                    ),
                    boxShadow: AppColors.cardShadow,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 100,
                        decoration: BoxDecoration(
                          color: const Color(0xFF9C4DCC)
                              .withValues(alpha: 0.15),
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(18),
                          ),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.event_rounded,
                            size: 48,
                            color: Color(0xFF9C4DCC),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              event.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              event.venue,
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
          if (selectedEventData != null) ...[
            const SizedBox(height: 8),
            Text(
              'Services',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
            ),
            const SizedBox(height: 12),
            ...selectedEventData.services.map((service) {
              final isSelected = _selectedService == service.id;
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: InkWell(
                  onTap: () =>
                      setState(() => _selectedService = service.id),
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppColors.primary.withValues(alpha: 0.08)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color:
                            isSelected ? AppColors.primary : AppColors.border,
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            _serviceLabel(service.type),
                            style:
                                const TextStyle(fontWeight: FontWeight.w800),
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
          ],
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: SafeArea(
          child: PrimaryButton(
            text: 'Order Partner',
            icon: Icons.person_search_rounded,
            onPressed: _selectedEvent != null && _selectedService != null
                ? () => SnackbarHelper.orderCreated(context)
                : null,
          ),
        ),
      ),
    );
  }
}
