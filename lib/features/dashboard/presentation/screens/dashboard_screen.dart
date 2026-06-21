import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../providers/dashboard_providers.dart';
import 'package:can_lua/features/weighing/providers/weighing_providers.dart';
import '../widgets/season_stats_hero.dart';
import '../widgets/payment_progress.dart';
import '../widgets/variety_pie_chart.dart';
import '../widgets/seasons_bar_chart.dart';
import '../widgets/comparison_list.dart';
import '../widgets/dashboard_insights.dart';
import '../widgets/dashboard_filter_bottom_sheet.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  void _openFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => const DashboardFilterBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    // Watch active cards to check if database is empty
    final cardsAsync = ref.watch(activeCardsProvider);
    final selectedSeason = ref.watch(dashboardSeasonFilterProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tổng Quan Vụ Mùa'),
        actions: [
          // Filter button (large touch target: 48dp+)
          IconButton(
            icon: const Icon(Icons.filter_list, size: 26),
            tooltip: 'Chọn Vụ Mùa',
            padding: const EdgeInsets.all(12),
            constraints: const BoxConstraints(minWidth: 48, minHeight: 48),
            onPressed: () => _openFilterBottomSheet(context),
          ),
        ],
      ),
      body: cardsAsync.when(
        data: (cards) {
          if (cards.isEmpty) {
            return _buildEmptyState(context, isDark);
          }

          // Fetch computed statistics
          final stats = ref.watch(dashboardStatsProvider);
          final multiSeasonSummaries = ref.watch(multiSeasonStatsProvider);
          final insights = ref.watch(dashboardInsightsProvider);

          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Active filter status card
                _buildActiveFilterCard(context, selectedSeason, isDark),
                const SizedBox(height: 16),

                // 1. SeasonStatsHero (Lưới 2x2 hiển thị: Số phiếu, Tấn lúa, Tổng tiền, Còn nợ)
                SeasonStatsHero(stats: stats),
                const SizedBox(height: 16),

                // 2. PaymentProgress (Tiến độ thu tiền nợ)
                if (stats.totalAmount > 0) ...[
                  PaymentProgress(stats: stats),
                  const SizedBox(height: 16),
                ],

                // 3. VarietyPieChart (Biểu đồ tròn giống lúa)
                if (stats.varietyPercentages.isNotEmpty) ...[
                  VarietyPieChart(stats: stats),
                  const SizedBox(height: 16),
                ],

                // 4. DashboardInsights (Nhận xét nhanh)
                if (insights.isNotEmpty) ...[
                  DashboardInsights(insights: insights),
                  const SizedBox(height: 16),
                ],

                // 5. SeasonsBarChart (Biểu đồ so sánh liên vụ)
                if (multiSeasonSummaries.length > 1) ...[
                  SeasonsBarChart(summaries: multiSeasonSummaries),
                  const SizedBox(height: 16),
                  
                  // 6. ComparisonList (Danh sách thống kê chi tiết liên vụ)
                  ComparisonList(summaries: multiSeasonSummaries),
                  const SizedBox(height: 16),
                ],
              ],
            ),
          );
        },
        error: (err, stack) => Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              'Có lỗi xảy ra: $err',
              style: AppTypography.bodyStyle(isDark: isDark, isMuted: false).copyWith(color: AppColors.error),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  Widget _buildActiveFilterCard(BuildContext context, String selectedSeason, bool isDark) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: selectedSeason == 'Tất cả' 
            ? (isDark ? Colors.grey[900] : Colors.grey[100])
            : AppColors.primary.withValues(alpha: isDark ? 0.2 : 0.08),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: selectedSeason == 'Tất cả'
              ? (isDark ? Colors.grey[800]! : Colors.grey[300]!)
              : AppColors.primary.withValues(alpha: 0.3),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.event_note,
                color: selectedSeason == 'Tất cả' ? Colors.grey : AppColors.primary,
                size: 20,
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Đang xem số liệu:',
                    style: AppTypography.captionStyle(isDark: isDark, isMuted: true).copyWith(fontSize: 11),
                  ),
                  Text(
                    selectedSeason == 'Tất cả' ? 'Tất cả vụ mùa lúa' : 'Vụ $selectedSeason',
                    style: AppTypography.bodyStyle(isDark: isDark).copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ],
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              elevation: 0,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            icon: const Icon(Icons.touch_app, size: 16),
            label: const Text(
              'Đổi vụ',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
            onPressed: () => _openFilterBottomSheet(context),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context, bool isDark) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.08),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.grass_outlined,
                size: 80,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Chào mừng bạn đến với Cân Lúa!',
              style: AppTypography.headingStyle(isDark: isDark),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              'Hãy tạo phiếu cân đầu tiên để bắt đầu theo dõi sản lượng, doanh thu và nợ thương lái một cách trực quan.',
              textAlign: TextAlign.center,
              style: AppTypography.bodyStyle(isDark: isDark, isMuted: true),
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
                elevation: 2,
              ),
              icon: const Icon(Icons.play_arrow, size: 24),
              label: const Text(
                'Bắt đầu vụ mùa đầu tiên',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              onPressed: () {
                context.go('/weighing');
              },
            ),
          ],
        ),
      ),
    );
  }
}
