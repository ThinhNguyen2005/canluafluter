import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../weighing/providers/weighing_providers.dart';
import '../../../database/app_database.dart';

class SeasonStats {
  final String seasonLabel;
  final int totalTickets;
  final double totalNetWeight; // in kg
  final double totalAmount;
  final double totalPaid;
  final double totalDebt;
  final double paymentProgress; // 0.0 to 100.0
  final double averagePrice;
  final double averageBagWeight;
  final double averageMoisture;
  final double averageImpurity; // % of total weight
  final Map<String, double> varietyWeights; // variety name -> total net weight in kg
  final Map<String, double> varietyPercentages; // variety name -> percentage of total net weight

  SeasonStats({
    required this.seasonLabel,
    required this.totalTickets,
    required this.totalNetWeight,
    required this.totalAmount,
    required this.totalPaid,
    required this.totalDebt,
    required this.paymentProgress,
    required this.averagePrice,
    required this.averageBagWeight,
    required this.averageMoisture,
    required this.averageImpurity,
    required this.varietyWeights,
    required this.varietyPercentages,
  });

  factory SeasonStats.empty(String seasonLabel) {
    return SeasonStats(
      seasonLabel: seasonLabel,
      totalTickets: 0,
      totalNetWeight: 0.0,
      totalAmount: 0.0,
      totalPaid: 0.0,
      totalDebt: 0.0,
      paymentProgress: 0.0,
      averagePrice: 0.0,
      averageBagWeight: 0.0,
      averageMoisture: 0.0,
      averageImpurity: 0.0,
      varietyWeights: {},
      varietyPercentages: {},
    );
  }
}

class MultiSeasonSummary {
  final String seasonLabel;
  final double totalNetWeight; // in kg
  final int totalBags;
  final double averageImpurity; // %
  final double totalAmount;
  final double totalDebt;

  MultiSeasonSummary({
    required this.seasonLabel,
    required this.totalNetWeight,
    required this.totalBags,
    required this.averageImpurity,
    required this.totalAmount,
    required this.totalDebt,
  });
}

/// Filter state for selected season
final dashboardSeasonFilterProvider = StateProvider<String>((ref) => 'Tất cả');

/// Stream of all active unique seasons in database for the filter dropdown
final activeSeasonsProvider = Provider<List<String>>((ref) {
  final cardsAsync = ref.watch(activeCardsProvider);
  return cardsAsync.maybeWhen(
    data: (cards) {
      final seasons = cards.map((c) => c.seasonLabel).toSet().toList();
      seasons.sort((a, b) => b.compareTo(a)); // Sort desc (recent seasons first)
      return ['Tất cả', ...seasons];
    },
    orElse: () => ['Tất cả'],
  );
});

/// Reactive Stats calculator based on selected season
final dashboardStatsProvider = Provider<SeasonStats>((ref) {
  final cards = ref.watch(activeCardsProvider).value ?? [];
  final selectedSeason = ref.watch(dashboardSeasonFilterProvider);

  final filteredCards = selectedSeason == 'Tất cả'
      ? cards
      : cards.where((c) => c.seasonLabel == selectedSeason).toList();

  if (filteredCards.isEmpty) {
    return SeasonStats.empty(selectedSeason);
  }

  int totalTickets = filteredCards.length;
  double totalNetWeight = 0.0;
  double totalAmount = 0.0;
  double totalPaid = 0.0;
  double totalDebt = 0.0;

  double sumPrice = 0.0;
  int sumBags = 0;
  double sumTotalWeight = 0.0;
  double sumMoisture = 0.0;
  double sumImpurityWeight = 0.0;

  Map<String, double> varietyWeights = {};

  for (final card in filteredCards) {
    totalNetWeight += card.netWeight;
    totalAmount += card.totalAmount;
    totalPaid += card.paidAmount + card.depositAmount;
    totalDebt += card.remainingAmount;

    sumPrice += card.pricePerKg;
    sumBags += card.bagCount;
    sumTotalWeight += card.totalWeight;
    sumMoisture += card.moisturePercent;
    sumImpurityWeight += card.impurityWeight;

    varietyWeights[card.riceVariety] = (varietyWeights[card.riceVariety] ?? 0.0) + card.netWeight;
  }

  // Calculate percentages
  Map<String, double> varietyPercentages = {};
  if (totalNetWeight > 0) {
    varietyWeights.forEach((variety, weight) {
      varietyPercentages[variety] = (weight / totalNetWeight) * 100;
    });
  }

  double averagePrice = sumPrice / totalTickets;
  double averageBagWeight = sumBags > 0 ? sumTotalWeight / sumBags : 0.0;
  double averageMoisture = sumMoisture / totalTickets;
  double averageImpurity = sumTotalWeight > 0 ? (sumImpurityWeight / sumTotalWeight) * 100 : 0.0;
  double paymentProgress = totalAmount > 0 ? (totalPaid / totalAmount) * 100 : 0.0;

  return SeasonStats(
    seasonLabel: selectedSeason,
    totalTickets: totalTickets,
    totalNetWeight: totalNetWeight,
    totalAmount: totalAmount,
    totalPaid: totalPaid,
    totalDebt: totalDebt,
    paymentProgress: paymentProgress,
    averagePrice: averagePrice,
    averageBagWeight: averageBagWeight,
    averageMoisture: averageMoisture,
    averageImpurity: averageImpurity,
    varietyWeights: varietyWeights,
    varietyPercentages: varietyPercentages,
  );
});

/// Multi-season statistics comparison
final multiSeasonStatsProvider = Provider<List<MultiSeasonSummary>>((ref) {
  final cards = ref.watch(activeCardsProvider).value ?? [];

  // Group cards by season
  Map<String, List<RiceCard>> grouped = {};
  for (final card in cards) {
    grouped.putIfAbsent(card.seasonLabel, () => []).add(card);
  }

  List<MultiSeasonSummary> summaries = [];
  grouped.forEach((season, seasonCards) {
    double totalNetWeight = 0.0;
    int totalBags = 0;
    double sumTotalWeight = 0.0;
    double sumImpurityWeight = 0.0;
    double totalAmount = 0.0;
    double totalDebt = 0.0;

    for (final card in seasonCards) {
      totalNetWeight += card.netWeight;
      totalBags += card.bagCount;
      sumTotalWeight += card.totalWeight;
      sumImpurityWeight += card.impurityWeight;
      totalAmount += card.totalAmount;
      totalDebt += card.remainingAmount;
    }

    double averageImpurity = sumTotalWeight > 0 ? (sumImpurityWeight / sumTotalWeight) * 100 : 0.0;

    summaries.add(MultiSeasonSummary(
      seasonLabel: season,
      totalNetWeight: totalNetWeight,
      totalBags: totalBags,
      averageImpurity: averageImpurity,
      totalAmount: totalAmount,
      totalDebt: totalDebt,
    ));
  });

  // Sort by season name descending (most recent first)
  summaries.sort((a, b) => b.seasonLabel.compareTo(a.seasonLabel));
  return summaries;
});

/// Offline rule-based insights for the selected season
final dashboardInsightsProvider = Provider<List<String>>((ref) {
  final stats = ref.watch(dashboardStatsProvider);
  if (stats.totalTickets == 0) {
    return ['Chưa có dữ liệu vụ mùa này để phân tích. Hãy tạo phiếu cân lúa đầu tiên tại tab Cân Lúa để bắt đầu!'];
  }

  List<String> insights = [];

  // Insight 1: Debt alert
  if (stats.totalDebt > 0) {
    final debtPercent = (stats.totalDebt / stats.totalAmount) * 100;
    if (debtPercent > 30.0) {
      insights.add(
        '⚠️ **Cảnh báo nợ đọng cao:** Thương lái vẫn còn nợ **${debtPercent.toStringAsFixed(1)}%** tổng tiền lúa vụ này. Cần chú ý thu nợ kịp thời.',
      );
    } else {
      insights.add(
        'ℹ️ Thương lái còn nợ **${debtPercent.toStringAsFixed(1)}%** vụ này. Tiến trình thu nợ đang ở mức tốt.',
      );
    }
  } else {
    insights.add(
      '✅ **Thanh toán hoàn tất:** Toàn bộ tiền lúa vụ này đã được thu đủ, không còn nợ đọng.',
    );
  }

  // Insight 2: Rice variety concentration
  if (stats.varietyPercentages.isNotEmpty) {
    final dominant = stats.varietyPercentages.entries.reduce((a, b) => a.value > b.value ? a : b);
    if (dominant.value > 70.0) {
      insights.add(
        '🌾 **Độc canh giống lúa:** Giống lúa **${dominant.key}** chiếm đến **${dominant.value.toStringAsFixed(1)}%** sản lượng vụ này. Độc canh giúp dễ chăm sóc nhưng tiềm ẩn rủi ro nếu thị trường giống này rớt giá.',
      );
    } else {
      insights.add(
        '🌾 Cơ cấu giống lúa đa dạng giúp bạn giảm thiểu rủi ro biến động giá. Giống **${dominant.key}** đang được thu hoạch nhiều nhất với **${dominant.value.toStringAsFixed(1)}%**.',
      );
    }
  }

  // Insight 3: Impurities average
  if (stats.averageImpurity > 1.5) {
    insights.add(
      '🍂 **Tạp chất trung bình cao:** Tỷ lệ tạp chất trung bình của ruộng là **${stats.averageImpurity.toStringAsFixed(2)}%** (vượt ngưỡng an toàn 1.5%). Bạn nên chú ý khâu sàng lọc hoặc kiểm tra lại lưới gặt máy cắt.',
    );
  } else if (stats.averageImpurity > 0) {
    insights.add(
      '✨ **Chất lượng lúa sạch:** Tỷ lệ tạp chất trung bình ở mức thấp **${stats.averageImpurity.toStringAsFixed(2)}%**, lúa rất sạch giúp bạn giữ được đơn giá thu mua tốt nhất.',
    );
  }

  // Insight 4: Average bag weight check
  if (stats.averageBagWeight > 0) {
    if (stats.averageBagWeight < 45.0) {
      insights.add(
        '⚖️ Ký trung bình mỗi bao lúa là **${stats.averageBagWeight.toStringAsFixed(1)} kg** (hơi nhẹ). Đóng bao chặt hơn sẽ giúp tiết kiệm vỏ bao lúa.',
      );
    } else if (stats.averageBagWeight > 55.0) {
      insights.add(
        '⚖️ Ký trung bình mỗi bao lúa đạt **${stats.averageBagWeight.toStringAsFixed(1)} kg** (rất nặng). Bao lúa chặt giúp tiết kiệm vỏ bao nhưng cần lưu ý sức khênh của nhân công.',
      );
    } else {
      insights.add(
        '⚖️ Ký trung bình mỗi bao lúa đạt **${stats.averageBagWeight.toStringAsFixed(1)} kg** (ở mức lý tưởng từ 48 đến 52 kg).',
      );
    }
  }

  return insights;
});
