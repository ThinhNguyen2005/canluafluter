import 'package:flutter_test/flutter_test.dart';
import 'package:can_lua/core/utils/rice_calculator.dart';

void main() {
  group('RiceCalculator Tests', () {
    test('Method A (Fixed Bag Weight) calculation', () {
      // 100 bags, each 0.3 kg -> 30 kg bag weight
      final result = RiceCalculator.calculateAll(
        totalWeight: 5000.0,
        bagCount: 100,
        pricePerKg: 6000.0,
        depositAmount: 1000000.0,
        paidAmount: 2000000.0,
        bagMethodIsSampling: false,
        bagWeightPerUnit: 0.3,
        bagSampleCount: 0,
        bagSampleTotalWeight: 0.0,
        impurityIsPercent: false,
        impurityFixed: 10.0, // 10 kg
        impurityPercent: 0.0,
        moisturePercent: 1.0, // 1% of 5000 = 50 kg
      );

      expect(result.totalBagWeight, 30.0);
      expect(result.impurityWeight, 10.0);
      expect(result.moistureDeduction, 50.0);
      expect(result.netWeight, 5000.0 - 30.0 - 10.0 - 50.0); // 4910 kg
      expect(result.totalAmount, 4910.0 * 6000.0); // 29,460,000 đ
      expect(result.remainingAmount, 29460000.0 - 1000000.0 - 2000000.0); // 26,460,000 đ
    });

    test('Method B (Sampling Bag Weight) calculation', () {
      // 10 sample bags weigh 5.0 kg total (0.5 kg average)
      // 200 bags total -> 100 kg total bag weight
      final result = RiceCalculator.calculateAll(
        totalWeight: 10000.0,
        bagCount: 200,
        pricePerKg: 7000.0,
        depositAmount: 5000000.0,
        paidAmount: 0.0,
        bagMethodIsSampling: true,
        bagWeightPerUnit: 0.3,
        bagSampleCount: 10,
        bagSampleTotalWeight: 5.0,
        impurityIsPercent: true,
        impurityFixed: 0.0,
        impurityPercent: 0.5, // 0.5% of 10000 = 50 kg
        moisturePercent: 2.0, // 2% of 10000 = 200 kg
      );

      expect(result.totalBagWeight, 100.0);
      expect(result.impurityWeight, 50.0);
      expect(result.moistureDeduction, 200.0);
      expect(result.netWeight, 10000.0 - 100.0 - 50.0 - 200.0); // 9650 kg
      expect(result.totalAmount, 9650.0 * 7000.0); // 67,550,000 đ
      expect(result.remainingAmount, 67550000.0 - 5000000.0); // 62,550,000 đ
    });

    test('Edge case: zero values', () {
      final result = RiceCalculator.calculateAll(
        totalWeight: 0.0,
        bagCount: 0,
        pricePerKg: 0.0,
        depositAmount: 0.0,
        paidAmount: 0.0,
        bagMethodIsSampling: false,
        bagWeightPerUnit: 0.0,
        bagSampleCount: 0,
        bagSampleTotalWeight: 0.0,
        impurityIsPercent: false,
        impurityFixed: 0.0,
        impurityPercent: 0.0,
        moisturePercent: 0.0,
      );

      expect(result.totalBagWeight, 0.0);
      expect(result.impurityWeight, 0.0);
      expect(result.moistureDeduction, 0.0);
      expect(result.netWeight, 0.0);
      expect(result.totalAmount, 0.0);
      expect(result.remainingAmount, 0.0);
    });

    test('Edge case: negative remaining amount (overpayment)', () {
      final result = RiceCalculator.calculateAll(
        totalWeight: 100.0,
        bagCount: 2,
        pricePerKg: 5000.0,
        depositAmount: 600000.0, // exceeds total amount
        paidAmount: 0.0,
        bagMethodIsSampling: false,
        bagWeightPerUnit: 0.0,
        bagSampleCount: 0,
        bagSampleTotalWeight: 0.0,
        impurityIsPercent: false,
        impurityFixed: 0.0,
        impurityPercent: 0.0,
        moisturePercent: 0.0,
      );

      expect(result.totalAmount, 500000.0);
      expect(result.remainingAmount, -100000.0); // -100,000 đ
    });
  });
}
