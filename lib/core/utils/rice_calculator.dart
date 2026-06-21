class RiceCalculator {
  /// Calculate total bag weight depending on the selected method.
  /// Method A: fixed bag weight per unit.
  /// Method B: sample average bag weight multiplied by the total bag count.
  static double calculateTotalBagWeight({
    required int bagCount,
    required bool bagMethodIsSampling,
    required double bagWeightPerUnit,
    required int bagSampleCount,
    required double bagSampleTotalWeight,
  }) {
    if (bagCount <= 0) return 0.0;
    if (bagMethodIsSampling) {
      if (bagSampleCount <= 0 || bagSampleTotalWeight <= 0) return 0.0;
      return (bagSampleTotalWeight / bagSampleCount) * bagCount;
    } else {
      return bagCount * bagWeightPerUnit;
    }
  }

  /// Calculate total impurity weight.
  /// If [impurityIsPercent] is true, calculates as % of [totalWeight].
  /// Otherwise, returns the fixed [impurityFixed].
  static double calculateImpurityWeight({
    required double totalWeight,
    required bool impurityIsPercent,
    required double impurityFixed,
    required double impurityPercent,
  }) {
    if (impurityIsPercent) {
      if (impurityPercent <= 0 || totalWeight <= 0) return 0.0;
      return totalWeight * (impurityPercent / 100.0);
    } else {
      return impurityFixed;
    }
  }

  /// Calculate moisture deduction.
  /// Standard deduction formula: totalWeight * (moisturePercent / 100)
  static double calculateMoistureDeduction({
    required double totalWeight,
    required double moisturePercent,
  }) {
    if (totalWeight <= 0 || moisturePercent <= 0) return 0.0;
    return totalWeight * (moisturePercent / 100.0);
  }

  /// Calculate Net Weight (Khối lượng thực tế sau trừ bì, tạp chất, độ ẩm).
  /// netWeight = totalWeight - totalBag - impurityKg - moistureDeduction
  static double calculateNetWeight({
    required double totalWeight,
    required double totalBagWeight,
    required double impurityWeight,
    required double moistureDeduction,
  }) {
    final net = totalWeight - totalBagWeight - impurityWeight - moistureDeduction;
    return net < 0 ? 0.0 : net;
  }

  /// Calculate Total Amount (Tổng tiền thu mua).
  /// totalAmount = netWeight * pricePerKg
  static double calculateTotalAmount({
    required double netWeight,
    required double pricePerKg,
  }) {
    if (netWeight <= 0 || pricePerKg <= 0) return 0.0;
    return netWeight * pricePerKg;
  }

  /// Calculate Remaining Amount (Số tiền còn nợ / dư nợ).
  /// remainingAmount = totalAmount - depositAmount - paidAmount
  static double calculateRemainingAmount({
    required double totalAmount,
    required double depositAmount,
    required double paidAmount,
  }) {
    final remaining = totalAmount - depositAmount - paidAmount;
    // We allow negative values to represent refunds or overpayments if they happen,
    // but typically it represents unpaid amount.
    return remaining;
  }

  /// Conveniece function to calculate everything at once.
  static RiceCalculationResult calculateAll({
    required double totalWeight,
    required int bagCount,
    required double pricePerKg,
    required double depositAmount,
    required double paidAmount,
    required bool bagMethodIsSampling,
    required double bagWeightPerUnit,
    required int bagSampleCount,
    required double bagSampleTotalWeight,
    required bool impurityIsPercent,
    required double impurityFixed,
    required double impurityPercent,
    required double moisturePercent,
  }) {
    final totalBagWeight = calculateTotalBagWeight(
      bagCount: bagCount,
      bagMethodIsSampling: bagMethodIsSampling,
      bagWeightPerUnit: bagWeightPerUnit,
      bagSampleCount: bagSampleCount,
      bagSampleTotalWeight: bagSampleTotalWeight,
    );

    final impurityWeight = calculateImpurityWeight(
      totalWeight: totalWeight,
      impurityIsPercent: impurityIsPercent,
      impurityFixed: impurityFixed,
      impurityPercent: impurityPercent,
    );

    final moistureDeduction = calculateMoistureDeduction(
      totalWeight: totalWeight,
      moisturePercent: moisturePercent,
    );

    final netWeight = calculateNetWeight(
      totalWeight: totalWeight,
      totalBagWeight: totalBagWeight,
      impurityWeight: impurityWeight,
      moistureDeduction: moistureDeduction,
    );

    final totalAmount = calculateTotalAmount(
      netWeight: netWeight,
      pricePerKg: pricePerKg,
    );

    final remainingAmount = calculateRemainingAmount(
      totalAmount: totalAmount,
      depositAmount: depositAmount,
      paidAmount: paidAmount,
    );

    return RiceCalculationResult(
      totalWeight: totalWeight,
      bagCount: bagCount,
      totalBagWeight: totalBagWeight,
      impurityWeight: impurityWeight,
      moistureDeduction: moistureDeduction,
      netWeight: netWeight,
      totalAmount: totalAmount,
      remainingAmount: remainingAmount,
    );
  }
}

class RiceCalculationResult {
  final double totalWeight;
  final int bagCount;
  final double totalBagWeight;
  final double impurityWeight;
  final double moistureDeduction;
  final double netWeight;
  final double totalAmount;
  final double remainingAmount;

  RiceCalculationResult({
    required this.totalWeight,
    required this.bagCount,
    required this.totalBagWeight,
    required this.impurityWeight,
    required this.moistureDeduction,
    required this.netWeight,
    required this.totalAmount,
    required this.remainingAmount,
  });
}
