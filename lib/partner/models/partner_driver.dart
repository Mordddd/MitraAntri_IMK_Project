class PartnerDriver {
  const PartnerDriver({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.rating,
    required this.vehicleType,
    required this.vehiclePlate,
    required this.balance,
    required this.todayIncome,
    required this.weeklyIncome,
    required this.monthlyIncome,
    required this.completedOrders,
    required this.todayOrders,
    required this.cancelledOrders,
    required this.acceptanceRate,
  });

  final String id;
  final String name;
  final String email;
  final String phone;
  final double rating;
  final String vehicleType;
  final String vehiclePlate;
  final int balance;
  final int todayIncome;
  final int weeklyIncome;
  final int monthlyIncome;
  final int completedOrders;
  final int todayOrders;
  final int cancelledOrders;
  final double acceptanceRate;

  PartnerDriver copyWith({
    int? balance,
    int? todayIncome,
    int? weeklyIncome,
    int? monthlyIncome,
    int? completedOrders,
    int? todayOrders,
    int? cancelledOrders,
    double? acceptanceRate,
  }) {
    return PartnerDriver(
      id: id,
      name: name,
      email: email,
      phone: phone,
      rating: rating,
      vehicleType: vehicleType,
      vehiclePlate: vehiclePlate,
      balance: balance ?? this.balance,
      todayIncome: todayIncome ?? this.todayIncome,
      weeklyIncome: weeklyIncome ?? this.weeklyIncome,
      monthlyIncome: monthlyIncome ?? this.monthlyIncome,
      completedOrders: completedOrders ?? this.completedOrders,
      todayOrders: todayOrders ?? this.todayOrders,
      cancelledOrders: cancelledOrders ?? this.cancelledOrders,
      acceptanceRate: acceptanceRate ?? this.acceptanceRate,
    );
  }
}
