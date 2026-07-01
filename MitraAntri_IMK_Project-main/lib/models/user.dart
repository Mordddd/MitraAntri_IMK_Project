class User {
  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.photoUrl,
    required this.role, // 'customer' or 'mitra'
    this.address = '',
    this.verified = false,
    this.onlineStatus = false,
  });

  final String id;
  final String name;
  final String email;
  final String phone;
  final String photoUrl;
  final String role;
  final String address;
  final bool verified;
  final bool onlineStatus;

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? phone,
    String? photoUrl,
    String? role,
    String? address,
    bool? verified,
    bool? onlineStatus,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      photoUrl: photoUrl ?? this.photoUrl,
      role: role ?? this.role,
      address: address ?? this.address,
      verified: verified ?? this.verified,
      onlineStatus: onlineStatus ?? this.onlineStatus,
    );
  }
}
