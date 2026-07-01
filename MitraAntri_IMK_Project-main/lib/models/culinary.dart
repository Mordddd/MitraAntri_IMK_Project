class CulinaryService {
  const CulinaryService({
    required this.id,
    required this.restaurantName,
    required this.address,
    required this.locationLink,
    required this.photoUrl,
    required this.fee,
    required this.estimatedTime,
  });

  final String id;
  final String restaurantName;
  final String address;
  final String locationLink;
  final String photoUrl;
  final int fee;
  final int estimatedTime;
}
