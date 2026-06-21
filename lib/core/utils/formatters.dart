import 'package:intl/intl.dart';

class AppFormatters {
  static final _vietnamCurrencyFormat = NumberFormat.currency(
    locale: 'vi_VN',
    symbol: 'đ',
    decimalDigits: 0,
  );

  static final _numberFormat = NumberFormat('#,###.##', 'vi_VN');

  /// Format money in a smart way:
  /// - >= 100 million: "512 tr đ"
  /// - >= 10 million: "12,3 tr đ"
  /// - < 10 million: "5.360.400 đ"
  static String formatMoney(double amount) {
    if (amount.abs() >= 100000000) {
      final millions = (amount / 1000000.0).round();
      return '$millions tr đ';
    } else if (amount.abs() >= 10000000) {
      // 1 decimal place, truncated/rounded
      final millions = amount / 1000000.0;
      final truncatedMillions = (millions * 10).truncateToDouble() / 10.0;
      final formatted = truncatedMillions.toStringAsFixed(1).replaceAll('.', ',');
      // If it ends with ,0, remove it.
      return '${formatted.endsWith(',0') ? formatted.substring(0, formatted.length - 2) : formatted} tr đ';
    } else {
      // Standard currency formatting
      return _vietnamCurrencyFormat.format(amount.round()).trim().replaceAll('\u00A0', ' ');
    }
  }

  /// Full currency formatting without smart abbreviations (e.g. for input fields or detail sheets)
  static String formatFullMoney(double amount) {
    return _vietnamCurrencyFormat.format(amount.round()).trim().replaceAll('\u00A0', ' ');
  }

  /// Format weight:
  /// - >= 10,000 kg: format in tons: "98,5 tấn" (1 ton = 1000 kg)
  /// - < 10,000 kg: format in kg: "2.450,5 kg"
  static String formatWeight(double weightInKg) {
    if (weightInKg.abs() >= 10000) {
      final tons = weightInKg / 1000.0;
      final formatted = _numberFormat.format(tons).replaceAll('\u00A0', ' ');
      return '$formatted tấn';
    } else {
      final formatted = _numberFormat.format(weightInKg).replaceAll('\u00A0', ' ');
      return '$formatted kg';
    }
  }

  /// Format price: "8.500 đ/kg"
  static String formatPrice(double price) {
    final raw = _vietnamCurrencyFormat.format(price.round()).replaceAll('đ', '').trim().replaceAll('\u00A0', ' ');
    return '$raw đ/kg';
  }

  /// Format date: "dd/MM/yyyy" or "dd/MM/yyyy HH:mm"
  static String formatDate(DateTime dateTime, {bool includeTime = false}) {
    final pattern = includeTime ? 'dd/MM/yyyy HH:mm' : 'dd/MM/yyyy';
    return DateFormat(pattern).format(dateTime);
  }
}
