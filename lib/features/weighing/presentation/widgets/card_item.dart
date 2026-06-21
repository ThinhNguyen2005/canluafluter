import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../database/app_database.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/formatters.dart';

class CardItem extends ConsumerWidget {
  final RiceCard card;

  const CardItem({super.key, required this.card});

  Widget _buildStatusChip(BuildContext context, bool isDark) {
    if (card.isPaid) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          color: AppColors.paidColor.withValues(alpha: isDark ? 0.2 : 0.1),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.paidColor.withValues(alpha: 0.5)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.check_circle, size: 14, color: AppColors.paidColor),
            const SizedBox(width: 4),
            Text(
              'Đã thanh toán',
              style: AppTypography.captionStyle(isDark: isDark, isMuted: false).copyWith(
                color: AppColors.paidColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );
    } else if (card.remainingAmount > 0) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          color: AppColors.debtColor.withValues(alpha: isDark ? 0.2 : 0.1),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.debtColor.withValues(alpha: 0.5)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline, size: 14, color: AppColors.debtColor),
            const SizedBox(width: 4),
            Text(
              'Còn nợ ${AppFormatters.formatMoney(card.remainingAmount)}',
              style: AppTypography.captionStyle(isDark: isDark, isMuted: false).copyWith(
                color: AppColors.debtColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );
    } else {
      // remainingAmount <= 0 but not marked isPaid (e.g. remainingAmount == 0 exactly)
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          color: AppColors.primary.withValues(alpha: isDark ? 0.2 : 0.1),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.primary.withValues(alpha: 0.5)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.done_all, size: 14, color: AppColors.primary),
            const SizedBox(width: 4),
            Text(
              'Đủ tiền',
              style: AppTypography.captionStyle(isDark: isDark, isMuted: false).copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          // Open details full screen (parent route handles navigator key)
          context.go('/weighing/detail/${card.id}');
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Row: Seller Name & Date
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      card.name,
                      style: AppTypography.titleStyle(isDark: isDark, isSemiBold: true),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    AppFormatters.formatDate(card.date),
                    style: AppTypography.captionStyle(isDark: isDark),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // Middle Row: Variety Chip & Season Tag
              Row(
                children: [
                  // Rice Variety tag (Banned: purple/violet)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      card.riceVariety,
                      style: AppTypography.captionStyle(isDark: isDark, isMuted: false).copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  // Season tag
                  Text(
                    card.seasonLabel,
                    style: AppTypography.captionStyle(isDark: isDark),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Bottom section: Weights & Amount & Status
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Weights: Total net weight / total bags
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tổng thực tế',
                        style: AppTypography.captionStyle(isDark: isDark),
                      ),
                      const SizedBox(height: 2),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: AppFormatters.formatWeight(card.netWeight).replaceAll(' kg', '').replaceAll(' tấn', ''),
                              style: AppTypography.numberStyle(
                                isDark: isDark,
                                fontSize: 16,
                              ),
                            ),
                            TextSpan(
                              text: card.netWeight >= 10000 ? ' tấn' : ' kg',
                              style: AppTypography.captionStyle(isDark: isDark),
                            ),
                            TextSpan(
                              text: '  ·  ',
                              style: TextStyle(color: isDark ? Colors.white24 : Colors.black12),
                            ),
                            TextSpan(
                              text: '${card.bagCount}',
                              style: AppTypography.numberStyle(
                                isDark: isDark,
                                fontSize: 16,
                                customColor: isDark ? Colors.grey[400] : Colors.grey[700],
                              ),
                            ),
                            TextSpan(
                              text: ' bao',
                              style: AppTypography.captionStyle(isDark: isDark),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  // Financials: total amount & debt status
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Tổng tiền lúa',
                        style: AppTypography.captionStyle(isDark: isDark),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        AppFormatters.formatMoney(card.totalAmount),
                        style: AppTypography.numberStyle(
                          isDark: isDark,
                          fontSize: 16,
                          customColor: AppColors.accent,
                        ),
                      ),
                      const SizedBox(height: 4),
                      _buildStatusChip(context, isDark),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
