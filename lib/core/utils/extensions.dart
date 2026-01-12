

extension StringExtensions on String {
  bool get isNumeric => double.tryParse(this) != null;
}

extension NumExtensions on num {
  String get currencyFormat => '\$${toStringAsFixed(2)}';
}
