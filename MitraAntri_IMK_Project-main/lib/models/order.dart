class QueueOrder {
  const QueueOrder({
    required this.location,
    required this.address,
    required this.service,
    required this.date,
    required this.time,
    required this.queueNumber,
    required this.estimateMinutes,
    required this.mitraName,
    required this.totalPayment,
    this.notes = '',
  });

  final String location;
  final String address;
  final String service;
  final String date;
  final String time;
  final String queueNumber;
  final int estimateMinutes;
  final String mitraName;
  final int totalPayment;
  final String notes;

  QueueOrder copyWith({
    String? location,
    String? address,
    String? service,
    String? date,
    String? time,
    String? queueNumber,
    int? estimateMinutes,
    String? mitraName,
    int? totalPayment,
    String? notes,
  }) {
    return QueueOrder(
      location: location ?? this.location,
      address: address ?? this.address,
      service: service ?? this.service,
      date: date ?? this.date,
      time: time ?? this.time,
      queueNumber: queueNumber ?? this.queueNumber,
      estimateMinutes: estimateMinutes ?? this.estimateMinutes,
      mitraName: mitraName ?? this.mitraName,
      totalPayment: totalPayment ?? this.totalPayment,
      notes: notes ?? this.notes,
    );
  }
}
