class PublicServiceLocation {
  const PublicServiceLocation({
    required this.id,
    required this.name,
    required this.address,
    required this.city,
    required this.phone,
    required this.services,
  });

  final String id;
  final String name;
  final String address;
  final String city;
  final String phone;
  final List<PublicServiceType> services;
}

class PublicServiceType {
  const PublicServiceType({
    required this.id,
    required this.name, // 'KTP', 'SIM', 'Samsat', etc.
    required this.fee,
    required this.estimatedWaitTime,
    required this.description,
  });

  final String id;
  final String name;
  final int fee;
  final int estimatedWaitTime;
  final String description;
}
