class PartnerTransaction {
  const PartnerTransaction({
    required this.id,
    required this.title,
    required this.amount,
    required this.isCredit,
    required this.timestamp,
  });

  final String id;
  final String title;
  final int amount;
  final bool isCredit;
  final DateTime timestamp;
}
