class Event {
  const Event({
    required this.id,
    required this.name,
    required this.date,
    required this.venue,
    required this.posterUrl,
    required this.services,
  });

  final String id;
  final String name;
  final DateTime date;
  final String venue;
  final String posterUrl;
  final List<EventService> services;
}

class EventService {
  const EventService({
    required this.id,
    required this.type, // 'wristband_exchange', 'ticket_queue', 'merchandise_queue'
    required this.description,
    required this.fee,
    required this.estimatedWaitTime,
  });

  final String id;
  final String type;
  final String description;
  final int fee;
  final int estimatedWaitTime;
}
