import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../database/app_database.dart';
import '../../providers/weighing_providers.dart';
import '../widgets/card_item.dart';
import '../widgets/create_card_bottom_sheet.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';

enum CardFilter { all, week, month, debt }
enum CardSort { dateDesc, dateAsc, name }

class CardListScreen extends ConsumerStatefulWidget {
  const CardListScreen({super.key});

  @override
  ConsumerState<CardListScreen> createState() => _CardListScreenState();
}

class _CardListScreenState extends ConsumerState<CardListScreen> {
  final _searchController = TextEditingController();
  String _searchQuery = '';
  CardFilter _selectedFilter = CardFilter.all;
  CardSort _selectedSort = CardSort.dateDesc;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _openCreateCardBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const CreateCardBottomSheet(),
    );
  }

  List<RiceCard> _applyFiltersAndSort(List<RiceCard> cards) {
    final now = DateTime.now();

    // 1. Search Query Filter
    var filtered = cards.where((card) {
      final nameMatches = card.name.toLowerCase().contains(_searchQuery.toLowerCase());
      final varietyMatches = card.riceVariety.toLowerCase().contains(_searchQuery.toLowerCase());
      final traderMatches = card.traderName.toLowerCase().contains(_searchQuery.toLowerCase());
      return nameMatches || varietyMatches || traderMatches;
    }).toList();

    // 2. Tab Filter
    switch (_selectedFilter) {
      case CardFilter.all:
        break;
      case CardFilter.week:
        final oneWeekAgo = now.subtract(const Duration(days: 7));
        filtered = filtered.where((c) => c.date.isAfter(oneWeekAgo)).toList();
        break;
      case CardFilter.month:
        filtered = filtered.where((c) => c.date.year == now.year && c.date.month == now.month).toList();
        break;
      case CardFilter.debt:
        filtered = filtered.where((c) => c.remainingAmount > 0 && !c.isPaid).toList();
        break;
    }

    // 3. Sorting
    switch (_selectedSort) {
      case CardSort.dateDesc:
        filtered.sort((a, b) => b.date.compareTo(a.date));
        break;
      case CardSort.dateAsc:
        filtered.sort((a, b) => a.date.compareTo(b.date));
        break;
      case CardSort.name:
        filtered.sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
        break;
    }

    return filtered;
  }

  Widget _buildEmptyState(bool isDark) {
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
                Icons.grass,
                size: 80,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Chưa Có Phiếu Cân Nào',
              style: AppTypography.headingStyle(isDark: isDark),
            ),
            const SizedBox(height: 12),
            Text(
              'Bắt đầu vụ mùa bằng cách bấm nút "+" bên dưới để tạo phiếu cân lúa đầu tiên tại ruộng.',
              textAlign: TextAlign.center,
              style: AppTypography.bodyStyle(isDark: isDark, isMuted: true),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: _openCreateCardBottomSheet,
              icon: const Icon(Icons.add),
              label: const Text('Tạo phiếu cân đầu tiên'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cardsStream = ref.watch(activeCardsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('🌾 Danh Sách Phiếu Cân'),
        actions: [
          PopupMenuButton<CardSort>(
            icon: const Icon(Icons.sort),
            onSelected: (sort) {
              setState(() => _selectedSort = sort);
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: CardSort.dateDesc,
                child: Text('Mới nhất trước'),
              ),
              const PopupMenuItem(
                value: CardSort.dateAsc,
                child: Text('Cũ nhất trước'),
              ),
              const PopupMenuItem(
                value: CardSort.name,
                child: Text('Tên người bán (A-Z)'),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          // Sticky search & filter bar
          Container(
            padding: const EdgeInsets.all(12),
            color: isDark ? AppColors.surfaceDark : AppColors.cardLight,
            child: Column(
              children: [
                // Search field
                TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Tìm người bán, giống lúa, thương lái...',
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: _searchQuery.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () {
                              setState(() {
                                _searchController.clear();
                                _searchQuery = '';
                              });
                            },
                          )
                        : null,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: isDark ? AppColors.backgroundDark : AppColors.backgroundLight.withValues(alpha: 0.5),
                    contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  ),
                  onChanged: (val) {
                    setState(() => _searchQuery = val);
                  },
                ),
                const SizedBox(height: 10),
                // Filter chips
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _FilterChip(
                        label: 'Tất cả',
                        isSelected: _selectedFilter == CardFilter.all,
                        onSelected: () => setState(() => _selectedFilter = CardFilter.all),
                      ),
                      const SizedBox(width: 8),
                      _FilterChip(
                        label: 'Tuần này',
                        isSelected: _selectedFilter == CardFilter.week,
                        onSelected: () => setState(() => _selectedFilter = CardFilter.week),
                      ),
                      const SizedBox(width: 8),
                      _FilterChip(
                        label: 'Tháng này',
                        isSelected: _selectedFilter == CardFilter.month,
                        onSelected: () => setState(() => _selectedFilter = CardFilter.month),
                      ),
                      const SizedBox(width: 8),
                      _FilterChip(
                        label: 'Còn nợ',
                        isSelected: _selectedFilter == CardFilter.debt,
                        onSelected: () => setState(() => _selectedFilter = CardFilter.debt),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          // Cards list
          Expanded(
            child: cardsStream.when(
              data: (cards) {
                final filteredCards = _applyFiltersAndSort(cards);
                
                if (filteredCards.isEmpty) {
                  return _buildEmptyState(isDark);
                }

                return ListView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: filteredCards.length,
                  itemBuilder: (context, index) {
                    final card = filteredCards[index];
                    return Dismissible(
                      key: Key('card_${card.id}'),
                      direction: DismissDirection.endToStart, // Swipe left to delete
                      background: Container(
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(right: 20),
                        margin: const EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                          color: AppColors.error,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(Icons.delete, color: Colors.white, size: 28),
                      ),
                      confirmDismiss: (direction) async {
                        // Confirm Dialog
                        return await showDialog<bool>(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Xác nhận xóa'),
                            content: Text('Bạn có chắc chắn muốn xóa phiếu cân của ruộng "${card.name}"? Dữ liệu sẽ được đưa vào thùng rác.'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(false),
                                child: const Text('Hủy'),
                              ),
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(true),
                                style: TextButton.styleFrom(foregroundColor: AppColors.error),
                                child: const Text('Xóa'),
                              ),
                            ],
                          ),
                        );
                      },
                      onDismissed: (direction) async {
                        final repo = ref.read(weighingRepositoryProvider);
                        await repo.deleteCard(card.id); // Soft delete
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Đã xóa phiếu cân của "${card.name}"'),
                              action: SnackBarAction(
                                label: 'Hoàn tác',
                                onPressed: () async {
                                  await repo.restoreCard(card.id);
                                },
                              ),
                            ),
                          );
                        }
                      },
                      child: CardItem(card: card),
                    );
                  },
                );
              },
              error: (err, stack) => Center(
                child: Text('Đã xảy ra lỗi: $err'),
              ),
              loading: () => const Center(
                child: CircularProgressIndicator(color: AppColors.primary),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openCreateCardBottomSheet,
        tooltip: 'Tạo phiếu cân mới',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onSelected;

  const _FilterChip({
    required this.label,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return ChoiceChip(
      label: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : (isDark ? Colors.white70 : Colors.black87),
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      selected: isSelected,
      onSelected: (_) => onSelected(),
      selectedColor: AppColors.primary,
      backgroundColor: isDark ? Colors.grey[850] : Colors.grey[200],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      side: BorderSide.none,
      showCheckmark: false,
    );
  }
}
