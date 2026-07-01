import 'package:flutter/material.dart';

import '../core/app_colors.dart';
import '../dummy/dummy_data.dart';
import '../models/event.dart';
import '../utils/snackbar_helper.dart';
import '../widgets/app_card.dart';
import '../widgets/app_motion.dart';
import '../widgets/gradient_background.dart';
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

  static const _months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'Mei',
    'Jun',
    'Jul',
    'Agu',
    'Sep',
    'Okt',
    'Nov',
    'Des',
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<Event> get _filteredEvents {
    final query = _searchController.text.toLowerCase().trim();
    if (query.isEmpty) return DummyData.events;
    return DummyData.events
        .where(
          (event) =>
              event.name.toLowerCase().contains(query) ||
              event.venue.toLowerCase().contains(query),
        )
        .toList();
  }

  String _serviceLabel(String type) => switch (type) {
        'ticket_war' => 'War tiket',
        'bracelet_exchange' => 'Tukar gelang',
        'merchandise_queue' => 'Antre merchandise',
        'event_checkin' => 'Check-in event',
        _ => type,
      };

  IconData _serviceIcon(String type) => switch (type) {
        'ticket_war' => Icons.confirmation_number_outlined,
        'bracelet_exchange' => Icons.watch_outlined,
        'merchandise_queue' => Icons.shopping_bag_outlined,
        'event_checkin' => Icons.how_to_reg_outlined,
        _ => Icons.event_available_outlined,
      };

  @override
  Widget build(BuildContext context) {
    final events = _filteredEvents;
    final selected = _selectedEvent == null
        ? null
        : DummyData.events.firstWhere((event) => event.id == _selectedEvent);

    return Scaffold(
      appBar: TopAppBar(title: 'Event & tiket'),
      body: GradientBackground(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
          children: [
            const FadeSlideIn(
              child: Text(
                'Datang untuk musiknya.\nBukan antreannya.',
                maxLines: 2,
                style: TextStyle(
                  color: AppColors.navy,
                  fontSize: 31,
                  height: 1.06,
                  letterSpacing: -1,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Pilih event, lalu tentukan antrean yang ingin ditangani mitra.',
              style: TextStyle(color: AppColors.subtext, height: 1.45),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: _searchController,
              onChanged: (_) => setState(() {}),
              textInputAction: TextInputAction.search,
              decoration: const InputDecoration(
                hintText: 'Cari event atau venue',
                prefixIcon: Icon(Icons.search_rounded),
              ),
            ),
            const SizedBox(height: 24),
            if (events.isEmpty)
              const _EmptySearch()
            else
              ...List.generate(events.length, (index) {
                final event = events[index];
                return FadeSlideIn(
                  delay: Duration(milliseconds: 60 + (index * 35)),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: _EventCard(
                      event: event,
                      month: _months[event.date.month - 1],
                      selected: _selectedEvent == event.id,
                      onTap: () => setState(() {
                        _selectedEvent = event.id;
                        _selectedService = null;
                      }),
                    ),
                  ),
                );
              }),
            if (selected != null) ...[
              const SizedBox(height: 18),
              Text(
                'Pilih bantuan',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 6),
              const Text(
                'Biaya dan estimasi sudah termasuk di setiap opsi.',
                style: TextStyle(color: AppColors.subtext),
              ),
              const SizedBox(height: 16),
              ...selected.services.map((service) {
                final isSelected = _selectedService == service.id;
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: AppCard(
                    onTap: () => setState(() => _selectedService = service.id),
                    radius: 22,
                    color: isSelected ? AppColors.primaryDark : AppColors.card,
                    borderColor:
                        isSelected ? AppColors.primaryDark : Colors.white70,
                    child: Row(
                      children: [
                        Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                            color: isSelected
                                ? Colors.white.withValues(alpha: .12)
                                : AppColors.mint,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Icon(
                            _serviceIcon(service.type),
                            color: isSelected
                                ? Colors.white
                                : AppColors.primaryDark,
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _serviceLabel(service.type),
                                style: TextStyle(
                                  color: isSelected
                                      ? Colors.white
                                      : AppColors.navy,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(height: 3),
                              Text(
                                '${service.estimatedWaitTime} menit estimasi',
                                style: TextStyle(
                                  color: isSelected
                                      ? Colors.white60
                                      : AppColors.subtext,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          isSelected
                              ? Icons.check_rounded
                              : Icons.arrow_outward_rounded,
                          color: isSelected ? Colors.white : AppColors.subtext,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ],
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: AppColors.bg,
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 14),
        child: SafeArea(
          top: false,
          child: PrimaryButton(
            text: 'Pesan mitra event',
            icon: Icons.arrow_outward_rounded,
            onPressed: _selectedEvent != null && _selectedService != null
                ? () => SnackbarHelper.orderCreated(context)
                : null,
          ),
        ),
      ),
    );
  }
}

class _EventCard extends StatelessWidget {
  const _EventCard({
    required this.event,
    required this.month,
    required this.selected,
    required this.onTap,
  });

  final Event event;
  final String month;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      selected: selected,
      label: '${event.name}, ${event.venue}',
      child: AppCard(
        onTap: onTap,
        padding: const EdgeInsets.all(5),
        radius: 30,
        color: selected ? AppColors.primary : AppColors.shell,
        borderColor: selected ? AppColors.primary : Colors.white70,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Stack(
            children: [
              AspectRatio(
                aspectRatio: 1.62,
                child: Image.asset(
                  event.posterUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => const ColoredBox(
                    color: AppColors.navy2,
                    child: Icon(Icons.event_outlined, color: Colors.white54),
                  ),
                ),
              ),
              Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        AppColors.navy.withValues(alpha: .12),
                        AppColors.navy.withValues(alpha: .92),
                      ],
                      stops: const [0, .46, 1],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 18,
                right: 18,
                bottom: 16,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: 48,
                      padding: const EdgeInsets.symmetric(vertical: 7),
                      decoration: BoxDecoration(
                        color: AppColors.card,
                        borderRadius: BorderRadius.circular(13),
                      ),
                      child: Column(
                        children: [
                          Text(
                            event.date.day.toString().padLeft(2, '0'),
                            style: const TextStyle(
                              color: AppColors.navy,
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              height: 1,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            month,
                            style: const TextStyle(
                              color: AppColors.primaryDark,
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            event.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              letterSpacing: -.35,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            event.venue,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (selected)
                      const Padding(
                        padding: EdgeInsets.only(left: 10, bottom: 6),
                        child: Icon(
                          Icons.check_circle_rounded,
                          color: Colors.white,
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
  }
}

class _EmptySearch extends StatelessWidget {
  const _EmptySearch();

  @override
  Widget build(BuildContext context) {
    return const AppCard(
      padding: EdgeInsets.all(28),
      child: Column(
        children: [
          Icon(Icons.search_off_rounded, color: AppColors.subtext, size: 30),
          SizedBox(height: 12),
          Text(
            'Event tidak ditemukan',
            style: TextStyle(
              color: AppColors.navy,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 4),
          Text(
            'Coba nama event atau lokasi lain.',
            style: TextStyle(color: AppColors.subtext),
          ),
        ],
      ),
    );
  }
}
