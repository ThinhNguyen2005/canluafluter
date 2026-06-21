import 'package:flutter_test/flutter_test.dart';
import 'package:can_lua/core/utils/formatters.dart';

void main() {
  group('AppFormatters Tests', () {
    test('formatMoney tests', () {
      // < 10 million
      expect(AppFormatters.formatMoney(360400), '360.400 đ');
      expect(AppFormatters.formatMoney(5360400), '5.360.400 đ');

      // >= 10 million and < 100 million
      // 12_360_400 -> "12,3 tr đ" (using truncate/round logic)
      expect(AppFormatters.formatMoney(12360400), '12,3 tr đ');
      expect(AppFormatters.formatMoney(99900000), '99,9 tr đ');

      // >= 100 million
      expect(AppFormatters.formatMoney(512360400), '512 tr đ');
      expect(AppFormatters.formatMoney(100000000), '100 tr đ');
    });

    test('formatWeight tests', () {
      // < 10,000 kg
      expect(AppFormatters.formatWeight(2450.5), '2.450,5 kg');
      expect(AppFormatters.formatWeight(9999.0), '9.999 kg');

      // >= 10,000 kg
      expect(AppFormatters.formatWeight(98500.0), '98,5 tấn');
      expect(AppFormatters.formatWeight(10000.0), '10 tấn');
    });

    test('formatPrice tests', () {
      expect(AppFormatters.formatPrice(8500), '8.500 đ/kg');
      expect(AppFormatters.formatPrice(7200.5), '7.201 đ/kg');
    });
  });
}
