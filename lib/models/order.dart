<<<<<<< HEAD
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
=======
class QueueOrder {
  const QueueOrder({
>>>>>>> e779af82024cf7b88993b7a681383685aaa57ba5
    required this.location,
    required this.address,
    required this.service,
    required this.date,
    required this.time,
    required this.queueNumber,
    required this.estimateMinutes,
    required this.mitraName,
    required this.totalPayment,
<<<<<<< HEAD
    required this.status,
    this.notes = '',
    this.category = 'General',
  });

  final String id;
=======
    this.notes = '',
  });

>>>>>>> e779af82024cf7b88993b7a681383685aaa57ba5
  final String location;
  final String address;
  final String service;
  final String date;
  final String time;
  final String queueNumber;
  final int estimateMinutes;
  final String mitraName;
  final int totalPayment;
<<<<<<< HEAD
  final OrderDisplayStatus status;
  final String notes;
  final String category;

  QueueOrder copyWith({
    String? id,
=======
  final String notes;

  QueueOrder copyWith({
>>>>>>> e779af82024cf7b88993b7a681383685aaa57ba5
    String? location,
    String? address,
    String? service,
    String? date,
    String? time,
    String? queueNumber,
    int? estimateMinutes,
    String? mitraName,
    int? totalPayment,
<<<<<<< HEAD
    OrderDisplayStatus? status,
    String? notes,
    String? category,
  }) {
    return QueueOrder(
      id: id ?? this.id,
=======
    String? notes,
  }) {
    return QueueOrder(
>>>>>>> e779af82024cf7b88993b7a681383685aaa57ba5
      location: location ?? this.location,
      address: address ?? this.address,
      service: service ?? this.service,
      date: date ?? this.date,
      time: time ?? this.time,
      queueNumber: queueNumber ?? this.queueNumber,
      estimateMinutes: estimateMinutes ?? this.estimateMinutes,
      mitraName: mitraName ?? this.mitraName,
      totalPayment: totalPayment ?? this.totalPayment,
<<<<<<< HEAD
      status: status ?? this.status,
      notes: notes ?? this.notes,
      category: category ?? this.category,
=======
      notes: notes ?? this.notes,
>>>>>>> e779af82024cf7b88993b7a681383685aaa57ba5
    );
  }
}
