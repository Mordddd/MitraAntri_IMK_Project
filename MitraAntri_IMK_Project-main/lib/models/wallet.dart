class Wallet {
  const Wallet({
    required this.balance,
    required this.totalEarned,
    this.transactions = const [],
  });

  final int balance;
  final int totalEarned;
  final List<Transaction> transactions;

  Wallet copyWith({
    int? balance,
    int? totalEarned,
    List<Transaction>? transactions,
  }) {
    return Wallet(
      balance: balance ?? this.balance,
      totalEarned: totalEarned ?? this.totalEarned,
      transactions: transactions ?? this.transactions,
    );
  }
}

class Transaction {
  const Transaction({
    required this.id,
    required this.type, // 'credit' or 'debit'
    required this.amount,
    required this.description,
    required this.timestamp,
  });

  final String id;
  final String type;
  final int amount;
  final String description;
  final DateTime timestamp;
}
