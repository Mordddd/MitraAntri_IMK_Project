class Hospital {
  const Hospital({
    required this.id,
    required this.name,
    required this.address,
    required this.district,
    required this.phone,
    required this.rating,
    required this.photoUrl,
    required this.departments,
  });

  final String id;
  final String name;
  final String address;
  final String district;
  final String phone;
  final double rating;
  final String photoUrl;
  final List<String> departments;
}

class HospitalService {
  const HospitalService({
    required this.id,
    required this.department,
    required this.estimatedWaitTime,
    required this.fee,
    required this.description,
  });

  final String id;
  final String department;
  final int estimatedWaitTime;
  final int fee;
  final String description;
}
