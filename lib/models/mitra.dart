class Mitra {
  const Mitra({
<<<<<<< HEAD
    required this.id,
=======
>>>>>>> e779af82024cf7b88993b7a681383685aaa57ba5
    required this.name,
    required this.rating,
    required this.finishedOrders,
    required this.distanceKm,
    required this.verified,
<<<<<<< HEAD
    required this.photoUrl,
    this.isOnline = false,
    this.phone = '',
    this.vehicleNumber = '',
  });

  final String id;
=======
  });

>>>>>>> e779af82024cf7b88993b7a681383685aaa57ba5
  final String name;
  final double rating;
  final int finishedOrders;
  final double distanceKm;
  final bool verified;
<<<<<<< HEAD
  final String photoUrl;
  final bool isOnline;
  final String phone;
  final String vehicleNumber;

  Mitra copyWith({
    String? id,
    String? name,
    double? rating,
    int? finishedOrders,
    double? distanceKm,
    bool? verified,
    String? photoUrl,
    bool? isOnline,
    String? phone,
    String? vehicleNumber,
  }) {
    return Mitra(
      id: id ?? this.id,
      name: name ?? this.name,
      rating: rating ?? this.rating,
      finishedOrders: finishedOrders ?? this.finishedOrders,
      distanceKm: distanceKm ?? this.distanceKm,
      verified: verified ?? this.verified,
      photoUrl: photoUrl ?? this.photoUrl,
      isOnline: isOnline ?? this.isOnline,
      phone: phone ?? this.phone,
      vehicleNumber: vehicleNumber ?? this.vehicleNumber,
    );
  }
=======
>>>>>>> e779af82024cf7b88993b7a681383685aaa57ba5
}
