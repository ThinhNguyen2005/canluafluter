import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/formatters.dart';
import '../../providers/dashboard_providers.dart';

class ComparisonList extends StatelessWidget {
  final List<MultiSeasonSummary> summaries;

  const ComparisonList({super.key, required this.summaries});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    if (summaries.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'BẢNG THỐNG KÊ CHI TIẾT',
          style: AppTypography.captionStyle(isDark: isDark, isMuted: true).copyWith(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.1,
          ),
        ),
        const SizedBox(height: 12),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: summaries.length,
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final item = summaries[index];
            final tons = item.totalNetWeight / 1000.0;
            final hasDebt = item.totalDebt > 0;

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        item.seasonLabel,
                        style: AppTypography.titleStyle(isDark: isDark).copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      if (hasDebt)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: AppColors.error.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: AppColors.error.withValues(alpha: 0.3)),
                          ),
                          child: const Text(
                            'Chưa thu đủ nợ',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: AppColors.error,
                            ),
                          ),
                        )
                      else
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: AppColors.primary.withValues(alpha: 0.3)),
                          ),
                          child: const Text(
                            'Thu đủ',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  
                  // Product metrics
                  Row(
                    children: [
                      _buildMetric(
                        isDark: isDark,
                        label: 'SẢN LƯỢNG',
                        value: '${tons.toStringAsFixed(1)} tấn',
                        subValue: '${item.totalBags} bao lúa',
                      ),
                      _buildMetric(
                        isDark: isDark,
                        label: 'TẠP CHẤT TB',
                        value: '${item.averageImpurity.toStringAsFixed(2)}%',
                        subValue: 'Khấu trừ tạp chất',
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Divider(thickness: 1, height: 1),
                  const SizedBox(height: 12),

                  // Financial metrics
                  Row(
                    children: [
                      _buildMetric(
                        isDark: isDark,
                        label: 'TỔNG DOANH THU',
                        value: AppFormatters.formatFullMoney(item.totalAmount),
                        valueColor: isDark ? Colors.green[300]! : AppColors.primary,
                      ),
                      _buildMetric(
                        isDark: isDark,
                        label: 'CÒN NỢ LẠI',
                        value: AppFormatters.formatFullMoney(item.totalDebt),
                        valueColor: hasDebt ? AppColors.error : (isDark ? Colors.white70 : AppColors.textPrimaryLight),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildMetric({
    required bool isDark,
    required String label,
    required String value,
    String? subValue,
    Color? valueColor,
  }) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: AppTypography.captionStyle(isDark: isDark, isMuted: true).copyWith(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontFamily: 'NotoSans',
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: valueColor ?? (isDark ? Colors.white : AppColors.textPrimaryLight),
            ),
          ),
          if (subValue != null) ...[
            const SizedBox(height: 2),
            Text(
              subValue,
              style: AppTypography.captionStyle(isDark: isDark, isMuted: true).copyWith(fontSize: 11),
            ),
          ],
        ],
      ),
    );
  }
}
