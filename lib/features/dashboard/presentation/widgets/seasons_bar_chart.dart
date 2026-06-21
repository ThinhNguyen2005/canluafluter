import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/formatters.dart';
import '../../providers/dashboard_providers.dart';

class SeasonsBarChart extends StatelessWidget {
  final List<MultiSeasonSummary> summaries;

  const SeasonsBarChart({super.key, required this.summaries});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    // Take only the 5 most recent seasons for comparison
    final recentSummaries = summaries.take(5).toList();
    // Sort chronological: oldest first for chart flow (reverse order of database query)
    final chartData = recentSummaries.reversed.toList();

    if (chartData.isEmpty) {
      return const SizedBox.shrink();
    }

    // Find max value for Y scaling
    double maxTons = 0.0;
    for (final s in chartData) {
      final tons = s.totalNetWeight / 1000.0;
      if (tons > maxTons) {
        maxTons = tons;
      }
    }
    // Set a minimum upper bound to prevent division by zero or flat charts
    final maxY = maxTons > 0 ? (maxTons * 1.25).ceilToDouble() : 10.0;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? AppColors.cardDark : AppColors.cardLight,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: isDark ? AppColors.borderDark : AppColors.borderLight),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 4,
            offset: const Offset(0, 2),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'SO SÁNH SẢN LƯỢNG LIÊN VỤ',
            style: AppTypography.captionStyle(isDark: isDark, isMuted: true).copyWith(
              fontWeight: FontWeight.bold,
              letterSpacing: 1.1,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Chạm cột biểu đồ để xem chi tiết tạp chất & doanh thu',
            style: AppTypography.captionStyle(isDark: isDark, isMuted: true).copyWith(fontSize: 11),
          ),
          const SizedBox(height: 32),
          
          // Bar Chart container
          SizedBox(
            height: 200,
            child: BarChart(
              BarChartData(
                maxY: maxY,
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  horizontalInterval: maxY / 4,
                  getDrawingHorizontalLine: (value) => FlLine(
                    color: isDark ? Colors.grey[800]! : Colors.grey[200]!,
                    strokeWidth: 1,
                  ),
                ),
                borderData: FlBorderData(show: false),
                titlesData: FlTitlesData(
                  show: true,
                  rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 45,
                      interval: maxY / 4,
                      getTitlesWidget: (value, meta) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Text(
                            '${value.toStringAsFixed(1)} t',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontFamily: 'NotoSans',
                              color: isDark ? Colors.grey[400] : Colors.grey[600],
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 30,
                      getTitlesWidget: (value, meta) {
                        final index = value.toInt();
                        if (index < 0 || index >= chartData.length) {
                          return const SizedBox.shrink();
                        }
                        final label = chartData[index].seasonLabel;
                        // Format season abbreviation to make it compact: e.g. "Đông Xuân 2026" -> "ĐX 26"
                        String displayLabel = label;
                        if (label.contains('Đông Xuân')) {
                          displayLabel = 'ĐX ${label.split(' ').last.substring(2)}';
                        } else if (label.contains('Hè Thu')) {
                          displayLabel = 'HT ${label.split(' ').last.substring(2)}';
                        } else if (label.contains('Thu Đông')) {
                          displayLabel = 'TĐ ${label.split(' ').last.substring(2)}';
                        }
                        
                        return Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            displayLabel,
                            style: TextStyle(
                              fontFamily: 'BeVietnamPro',
                              color: isDark ? Colors.grey[300] : Colors.grey[700],
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                barTouchData: BarTouchData(
                  touchTooltipData: BarTouchTooltipData(
                    getTooltipColor: (_) => isDark ? Colors.grey[900]! : Colors.white,
                    tooltipBorder: BorderSide(color: isDark ? Colors.grey[800]! : Colors.grey[300]!, width: 1.5),
                    tooltipPadding: const EdgeInsets.all(12),
                    tooltipMargin: 8,
                    getTooltipItem: (group, groupIndex, rod, rodIndex) {
                      final summary = chartData[group.x.toInt()];
                      final tons = summary.totalNetWeight / 1000.0;
                      return BarTooltipItem(
                        '${summary.seasonLabel}\n',
                        TextStyle(
                          color: isDark ? Colors.white : AppColors.textPrimaryLight,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                        children: [
                          TextSpan(
                            text: 'Sản lượng: ',
                            style: TextStyle(fontWeight: FontWeight.normal, color: isDark ? Colors.grey[400] : Colors.grey[600]),
                          ),
                          TextSpan(
                            text: '${tons.toStringAsFixed(1)} tấn (${summary.totalBags} bao)\n',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: 'Tạp chất TB: ',
                            style: TextStyle(fontWeight: FontWeight.normal, color: isDark ? Colors.grey[400] : Colors.grey[600]),
                          ),
                          TextSpan(
                            text: '${summary.averageImpurity.toStringAsFixed(2)}%\n',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: 'Doanh thu: ',
                            style: TextStyle(fontWeight: FontWeight.normal, color: isDark ? Colors.grey[400] : Colors.grey[600]),
                          ),
                          TextSpan(
                            text: AppFormatters.formatMoney(summary.totalAmount),
                            style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.primary),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                barGroups: List.generate(chartData.length, (index) {
                  final summary = chartData[index];
                  final tons = summary.totalNetWeight / 1000.0;

                  return BarChartGroupData(
                    x: index,
                    barRods: [
                      BarChartRodData(
                        toY: tons,
                        color: AppColors.primary,
                        width: 24, // Wide bar for touch-friendly targets
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(6)),
                        backDrawRodData: BackgroundBarChartRodData(
                          show: true,
                          toY: maxY,
                          color: isDark ? Colors.grey[900] : Colors.grey[100],
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
