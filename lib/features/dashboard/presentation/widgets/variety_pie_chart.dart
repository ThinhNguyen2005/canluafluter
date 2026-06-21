import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/formatters.dart';
import '../../providers/dashboard_providers.dart';

class VarietyPieChart extends StatelessWidget {
  final SeasonStats stats;

  const VarietyPieChart({super.key, required this.stats});

  static const List<Color> _chartColors = [
    AppColors.primary,       // Deep Green
    Color(0xFFF9A825),       // Yellow Gold
    Color(0xFF0288D1),       // Sky Blue
    Color(0xFF00796B),       // Deep Teal
    Color(0xFFE57373),       // Light Red
    Color(0xFF4CAF50),       // Medium Green
    Color(0xFFFF8A65),       // Coral Orange
    Color(0xFF00B0FF),       // Vibrant Blue
    Color(0xFF8D6E63),       // Brown
    Color(0xFF26A69A),       // Turquoise
    Color(0xFF90A4AE),       // Blue Grey
    Color(0xFFFFD54F),       // Bright Amber
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    final varieties = stats.varietyPercentages.entries.toList();
    varieties.sort((a, b) => b.value.compareTo(a.value)); // Sort by largest first

    if (varieties.isEmpty) {
      return const SizedBox.shrink();
    }

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
            'PHÂN BỔ GIỐNG LÚA',
            style: AppTypography.captionStyle(isDark: isDark, isMuted: true).copyWith(
              fontWeight: FontWeight.bold,
              letterSpacing: 1.1,
            ),
          ),
          const SizedBox(height: 16),
          
          Row(
            children: [
              // 1. Pie Chart
              SizedBox(
                width: 140,
                height: 140,
                child: PieChart(
                  PieChartData(
                    sectionsSpace: 2,
                    centerSpaceRadius: 35,
                    sections: List.generate(varieties.length, (index) {
                      final entry = varieties[index];
                      final color = _chartColors[index % _chartColors.length];
                      
                      // Show percentage text on section if it's large enough (>8%)
                      final showTitle = entry.value >= 8.0;
                      return PieChartSectionData(
                        color: color,
                        value: entry.value,
                        title: showTitle ? '${entry.value.round()}%' : '',
                        radius: 35,
                        titleStyle: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      );
                    }),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              
              // 2. Legend
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(varieties.length, (index) {
                    final entry = varieties[index];
                    final color = _chartColors[index % _chartColors.length];
                    final weight = stats.varietyWeights[entry.key] ?? 0.0;

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Row(
                        children: [
                          Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              color: color,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  entry.key,
                                  style: AppTypography.bodyStyle(isDark: isDark).copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  '${AppFormatters.formatWeight(weight)} (${entry.value.toStringAsFixed(1)}%)',
                                  style: AppTypography.captionStyle(isDark: isDark, isMuted: true).copyWith(
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
