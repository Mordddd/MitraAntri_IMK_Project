enum OrderDisplayStatus {
  waiting('Waiting', 'Menunggu'),
  accepted('Accepted', 'Diterima'),
  onTheWay('Partner On The Way', 'Mitra dalam perjalanan'),
  completed('Completed', 'Selesai'),
  cancelled('Cancelled', 'Dibatalkan');

  const OrderDisplayStatus(this.label, this.labelId);

  final String label;
  final String labelId;
}

class QueueOrder {
  const QueueOrder({
    required this.id,
    required this.location,
    required this.address,
    required this.service,
    required this.date,
    required this.time,
    required this.queueNumber,
    required this.estimateMinutes,
    required this.mitraName,
    required this.totalPayment,
    required this.status,
    this.notes = '',
    this.category = 'General',
  });

  final String id;
  final String location;
  final String address;
  final String service;
  final String date;
  final String time;
  final String queueNumber;
  final int estimateMinutes;
  final String mitraName;
  final int totalPayment;
  final OrderDisplayStatus status;
  final String notes;
  final String category;

  QueueOrder copyWith({
    String? id,
    String? location,
    String? address,
    String? service,
    String? date,
    String? time,
    String? queueNumber,
    int? estimateMinutes,
    String? mitraName,
    int? totalPayment,
    OrderDisplayStatus? status,
    String? notes,
    String? category,
  }) {
    return QueueOrder(
      id: id ?? this.id,
      location: location ?? this.location,
      address: address ?? this.address,
      service: service ?? this.service,
      date: date ?? this.date,
      time: time ?? this.time,
      queueNumber: queueNumber ?? this.queueNumber,
      estimateMinutes: estimateMinutes ?? this.estimateMinutes,
      mitraName: mitraName ?? this.mitraName,
      totalPayment: totalPayment ?? this.totalPayment,
      status: status ?? this.status,
      notes: notes ?? this.notes,
      category: category ?? this.category,
    );
  }
}
