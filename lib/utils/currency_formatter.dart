class CurrencyFormatter {
  static String format(int amount) {
    return amount.toString().replaceAllMapped(
          RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
          (match) => '${match[1]}.',
        );
  }

  static String rupiah(int amount) => 'Rp ${format(amount)}';
}
