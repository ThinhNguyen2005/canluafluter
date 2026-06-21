import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/formatters.dart';
import '../../providers/dashboard_providers.dart';

class PaymentProgress extends StatelessWidget {
  final SeasonStats stats;

  const PaymentProgress({super.key, required this.stats});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    final total = stats.totalAmount;
    final paid = stats.totalPaid;
    final debt = stats.totalDebt;
    final progress = stats.paymentProgress;

    // Use higher contrast color for debt warning
    final debtColor = debt > 0 ? AppColors.error : Colors.grey;

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
            'TIẾN ĐỘ THU TIỀN',
            style: AppTypography.captionStyle(isDark: isDark, isMuted: true).copyWith(
              fontWeight: FontWeight.bold,
              letterSpacing: 1.1,
            ),
          ),
          const SizedBox(height: 14),
          
          // Progress bar with animations
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: SizedBox(
              height: 14,
              child: TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0.0, end: progress / 100.0),
                duration: const Duration(milliseconds: 800),
                curve: Curves.easeOut,
                builder: (context, val, child) {
                  return LinearProgressIndicator(
                    value: val,
                    backgroundColor: isDark ? Colors.grey[800] : Colors.grey[200],
                    valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Details grid
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 12,
                        height: 12,
                        decoration: const BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        'Đã thu cọc & trả',
                        style: AppTypography.captionStyle(isDark: isDark, isMuted: true),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    AppFormatters.formatFullMoney(paid),
                    style: TextStyle(
                      fontFamily: 'NotoSans',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.green[300]! : AppColors.primary,
                    ),
                  ),
                  Text(
                    '${progress.toStringAsFixed(1)}% trên tổng số',
                    style: AppTypography.captionStyle(isDark: isDark, isMuted: true).copyWith(fontSize: 11),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Text(
                        'Còn nợ',
                        style: AppTypography.captionStyle(isDark: isDark, isMuted: true),
                      ),
                      const SizedBox(width: 6),
                      Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: debtColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    AppFormatters.formatFullMoney(debt),
                    style: TextStyle(
                      fontFamily: 'NotoSans',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: debt > 0 ? AppColors.error : (isDark ? Colors.white70 : AppColors.textPrimaryLight),
                    ),
                  ),
                  Text(
                    '${(100.0 - progress).toStringAsFixed(1)}% còn lại',
                    style: AppTypography.captionStyle(isDark: isDark, isMuted: true).copyWith(fontSize: 11),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(thickness: 1),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Tổng doanh số:',
                style: AppTypography.bodyStyle(isDark: isDark, isMuted: true),
              ),
              Text(
                AppFormatters.formatFullMoney(total),
                style: TextStyle(
                  fontFamily: 'NotoSans',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : AppColors.textPrimaryLight,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
