import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/formatters.dart';
import '../../providers/dashboard_providers.dart';

class SeasonStatsHero extends StatelessWidget {
  final SeasonStats stats;

  const SeasonStatsHero({super.key, required this.stats});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 1.45,
      children: [
        _buildStatCard(
          context: context,
          isDark: isDark,
          title: 'Số Phiếu Cân',
          value: '${stats.totalTickets}',
          suffix: 'phiếu',
          icon: Icons.receipt_long,
          iconColor: AppColors.primary,
          valueColor: isDark ? Colors.green[300]! : AppColors.primary,
        ),
        _buildStatCard(
          context: context,
          isDark: isDark,
          title: 'Tấn Thực Thu',
          value: AppFormatters.formatWeight(stats.totalNetWeight).replaceAll(' kg', '').replaceAll(' tấn', ''),
          suffix: stats.totalNetWeight >= 10000 ? 'tấn' : 'kg',
          icon: Icons.scale,
          iconColor: AppColors.primary,
          valueColor: isDark ? Colors.green[300]! : AppColors.primary,
        ),
        _buildStatCard(
          context: context,
          isDark: isDark,
          title: 'Tổng Thu Nhập',
          value: AppFormatters.formatMoney(stats.totalAmount).replaceAll(' đ', '').replaceAll(' tr', ''),
          suffix: stats.totalAmount >= 10000000 ? 'tr đ' : 'đ',
          icon: Icons.monetization_on,
          iconColor: AppColors.primary,
          valueColor: AppColors.primary,
        ),
        _buildStatCard(
          context: context,
          isDark: isDark,
          title: 'Còn Nợ Thương Lái',
          value: AppFormatters.formatMoney(stats.totalDebt).replaceAll(' đ', '').replaceAll(' tr', ''),
          suffix: stats.totalDebt >= 10000000 ? 'tr đ' : 'đ',
          icon: Icons.assignment_late,
          iconColor: stats.totalDebt > 0 ? AppColors.error : Colors.grey,
          valueColor: stats.totalDebt > 0 ? AppColors.error : (isDark ? Colors.white70 : AppColors.textPrimaryLight),
        ),
      ],
    );
  }

  Widget _buildStatCard({
    required BuildContext context,
    required bool isDark,
    required String title,
    required String value,
    required String suffix,
    required IconData icon,
    required Color iconColor,
    required Color valueColor,
  }) {
    final cardBgColor = isDark ? AppColors.cardDark : AppColors.cardLight;
    final borderColor = isDark ? AppColors.borderDark : AppColors.borderLight;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: cardBgColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor),
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: AppTypography.captionStyle(isDark: isDark, isMuted: true).copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              Icon(icon, size: 20, color: iconColor),
            ],
          ),
          const SizedBox(height: 6),
          // Animated Number Text
          TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0.0, end: double.tryParse(value.replaceAll('.', '').replaceAll(',', '.')) ?? 0.0),
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeOut,
            builder: (context, val, child) {
              // Re-format according to formatters
              String displayVal;
              final isInteger = val == val.roundToDouble();
              if (isInteger) {
                displayVal = NumberFormat('#,###', 'vi_VN').format(val.round());
              } else {
                displayVal = NumberFormat('#,###.##', 'vi_VN').format(val);
              }
              // Handle zero cases or fallback
              if (value == '0') {
                displayVal = '0';
              }

              return Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Flexible(
                    child: Text(
                      displayVal,
                      style: TextStyle(
                        fontFamily: 'NotoSans',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: valueColor,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    suffix,
                    style: AppTypography.captionStyle(isDark: isDark, isMuted: true).copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
