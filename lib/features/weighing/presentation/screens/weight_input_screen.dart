import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:drift/drift.dart' as drift;
import '../../../../database/app_database.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/formatters.dart';
import '../../providers/weighing_providers.dart';
import '../../../../services/services_providers.dart';

class WeightInputScreen extends ConsumerStatefulWidget {
  final int cardId;

  const WeightInputScreen({super.key, required this.cardId});

  @override
  ConsumerState<WeightInputScreen> createState() => _WeightInputScreenState();
}

class _WeightInputScreenState extends ConsumerState<WeightInputScreen> {
  final _inputController = TextEditingController();
  final _focusNode = FocusNode();
  final _pageController = PageController();

  // Screen-level state (defaults loaded from card configuration)
  bool _initialized = false;
  late String _inputMode; // 'SMALL' or 'LARGE'
  bool _autoConfirm = true;
  bool _ttsEnabled = true;

  // New selected cell index (absolute index in entries list)
  int? _selectedCellIndex;

  // Quick config controllers
  final _quickBagsPerKgController = TextEditingController();
  final _quickImpurityController = TextEditingController();
  final _quickMoistureController = TextEditingController();
  bool _quickConfigExpanded = false;

  @override
  void initState() {
    super.initState();
    // Keep focus on input field
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        // Request focus back to ensure keyboard remains visible
        Future.delayed(const Duration(milliseconds: 50), () {
          if (mounted) _focusNode.requestFocus();
        });
      }
    });
  }

  @override
  void dispose() {
    _inputController.dispose();
    _focusNode.dispose();
    _pageController.dispose();
    _quickBagsPerKgController.dispose();
    _quickImpurityController.dispose();
    _quickMoistureController.dispose();
    super.dispose();
  }

  void _initializeSettings(RiceCard card) {
    if (_initialized) return;
    _inputMode = card.weightInputMode;
    _ttsEnabled = ref.read(ttsServiceProvider).isEnabled;

    // Initialize quick config inputs
    if (card.bagWeightPerUnit > 0) {
      final bagsPerKg = 1.0 / card.bagWeightPerUnit;
      if (bagsPerKg % 1 == 0) {
        _quickBagsPerKgController.text = bagsPerKg.toStringAsFixed(0);
      } else {
        _quickBagsPerKgController.text = bagsPerKg.toStringAsFixed(2);
      }
    } else {
      _quickBagsPerKgController.text = '8';
    }

    final impurityVal = card.impurityIsPercent ? card.impurityPercent : card.impurityFixed;
    _quickImpurityController.text = impurityVal.toString();
    _quickMoistureController.text = card.moisturePercent.toString();

    _initialized = true;
  }

  Future<void> _saveWeight(double weight, List<WeightEntry> entries) async {
    final repo = ref.read(weighingRepositoryProvider);
    final tts = ref.read(ttsServiceProvider);

    // Vibrate to provide physical confirmation
    HapticFeedback.mediumImpact();

    // Clear field first to prevent double submit
    _inputController.clear();

    // Speak the weight in Vietnamese
    if (_ttsEnabled) {
      await tts.speakWeight(weight);
    }

    final activeIndex = _selectedCellIndex ?? entries.length;

    if (activeIndex < entries.length) {
      // Update existing entry
      final entry = entries[activeIndex];
      await repo.updateWeightEntry(entry.id, widget.cardId, weight);
      
      // Auto-advance to the next cell
      setState(() {
        if (activeIndex + 1 <= entries.length) {
          _selectedCellIndex = activeIndex + 1;
        } else {
          _selectedCellIndex = null;
        }
      });
    } else {
      // Save new to DB
      await repo.addWeightEntry(widget.cardId, weight);
      
      // Reset selected index to auto-default to the new empty cell
      setState(() {
        _selectedCellIndex = null;
      });
    }
  }

  void _onInputChanged(String val, List<WeightEntry> entries) {
    if (!_autoConfirm) return;

    final targetLength = _inputMode == 'SMALL' ? 3 : 4;
    if (val.length == targetLength) {
      final number = double.tryParse(val);
      if (number != null && number > 0) {
        final parsedWeight = number / 10.0;
        _saveWeight(parsedWeight, entries);
      }
    }
  }

  void _submitManual(List<WeightEntry> entries) {
    final val = _inputController.text.trim();
    if (val.isEmpty) return;

    final number = double.tryParse(val);
    if (number != null && number > 0) {
      // If user typed dot manually, use it. Otherwise, divide by 10.
      final weight = val.contains('.') ? number : number / 10.0;
      _saveWeight(weight, entries);
    }
  }

  void _deleteLast(List<WeightEntry> entries) async {
    if (entries.isEmpty) return;
    
    final activeIndex = _selectedCellIndex ?? entries.length;
    HapticFeedback.heavyImpact();
    final repo = ref.read(weighingRepositoryProvider);

    if (activeIndex < entries.length) {
      final entry = entries[activeIndex];
      await repo.deleteWeightEntry(entry.id, widget.cardId);
      if (_ttsEnabled) {
        ref.read(ttsServiceProvider).speak('Đã xóa bao số ${activeIndex + 1}');
      }
      setState(() {
        _selectedCellIndex = null;
      });
    } else {
      final last = entries.first; // sorted by timestamp desc in provider
      await repo.deleteWeightEntry(last.id, widget.cardId);
      if (_ttsEnabled) {
        ref.read(ttsServiceProvider).speak('Đã xóa bao cuối');
      }
      setState(() {
        _selectedCellIndex = null;
      });
    }
  }


  void _openOptionsBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => StatefulBuilder(
        builder: (context, setSheetState) {
          final isDark = Theme.of(context).brightness == Brightness.dark;
          return Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isDark ? AppColors.surfaceDark : Colors.white,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Cài đặt chế độ cân',
                  style: AppTypography.titleStyle(isDark: isDark),
                ),
                const SizedBox(height: 16),
                
                // Input mode SMALL vs LARGE
                ListTile(
                  title: const Text('Chế độ nhập số'),
                  subtitle: Text(_inputMode == 'SMALL' ? 'SMALL: 3 ký tự (Ví dụ: 503 -> 50.3 kg)' : 'LARGE: 4 ký tự (Ví dụ: 1503 -> 150.3 kg)'),
                  trailing: ToggleButtons(
                    isSelected: [_inputMode == 'SMALL', _inputMode == 'LARGE'],
                    onPressed: (index) {
                      setState(() {
                        _inputMode = index == 0 ? 'SMALL' : 'LARGE';
                      });
                      setSheetState(() {});
                    },
                    borderRadius: BorderRadius.circular(8),
                    children: const [
                      Padding(padding: EdgeInsets.symmetric(horizontal: 12), child: Text('SMALL')),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 12), child: Text('LARGE')),
                    ],
                  ),
                ),

                // Auto confirm
                SwitchListTile(
                  title: const Text('Tự động lưu (Auto-Confirm)'),
                  subtitle: const Text('Lưu ngay khi gõ đủ số ký tự'),
                  value: _autoConfirm,
                  activeThumbColor: AppColors.primary,
                  onChanged: (val) {
                    setState(() {
                      _autoConfirm = val;
                    });
                    setSheetState(() {});
                  },
                ),

                // TTS audio feedback
                SwitchListTile(
                  title: const Text('Đọc giọng nói (TTS)'),
                  subtitle: const Text('Đọc số kg tiếng Việt khi lưu bao lúa'),
                  value: _ttsEnabled,
                  activeThumbColor: AppColors.primary,
                  onChanged: (val) {
                    setState(() {
                      _ttsEnabled = val;
                    });
                    setSheetState(() {});
                  },
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Đóng'),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  void _showExplanationDialog(String type) {
    String title = '';
    String content = '';

    if (type == 'bag') {
      title = 'Cấu hình Bì (Bao bì)';
      content = '• Ý nghĩa: Trọng lượng vỏ bao lúa cần trừ đi khỏi tổng cân thực tế.\n\n'
          '• Quy tắc ĐBSCL: Thường tính theo số lượng bao tương đương 1 kg (Ví dụ: 8 bao = 1kg, hoặc 10 bao = 1kg).\n\n'
          '• Công thức:\n'
          '  Trọng lượng 1 bao = 1 / Số bao mỗi kg\n'
          '  Tổng ký bì = Số bao * Trọng lượng 1 bao\n\n'
          '• Ví dụ:\n'
          '  Cấu hình 8 bao = 1kg -> Trọng lượng mỗi bao là 1/8 = 0.125 kg (125g).\n'
          '  Nếu cân được 80 bao lúa, tổng ký bì trừ đi sẽ là: 80 * 0.125 = 10 kg.';
    } else if (type == 'impurity') {
      title = 'Khấu trừ Tạp chất';
      content = '• Ý nghĩa: Giảm trừ khối lượng do lúa lẫn tạp chất (rơm rác, lúa lép, bùn đất, hạt cỏ...).\n\n'
          '• Cách tính:\n'
          '  - Trừ theo %: Tự động nhân tỷ lệ % với tổng cân lúa để ra số kg khấu trừ.\n'
          '  - Trừ cố định (kg): Trừ trực tiếp một số ký cố định cho cả ruộng cân.\n\n'
          '• Công thức (%):\n'
          '  Ký tạp chất = Tổng cân lúa * (Tỷ lệ % / 100)';
    } else if (type == 'moisture') {
      title = 'Khấu hao Độ ẩm (Lúa tươi/ướt)';
      content = '• Ý nghĩa: Khấu trừ hao hụt trọng lượng do độ ẩm lúa cao hơn tiêu chuẩn (phổ biến khi bán lúa tươi tại ruộng).\n\n'
          '• Quy tắc trừ: Trừ trên khối lượng lúa sau khi đã trừ bì và tạp chất.\n\n'
          '• Công thức:\n'
          '  Ký độ ẩm = (Tổng cân lúa - Ký bì - Ký tạp chất) * (Tỷ lệ độ ẩm % / 100)\n\n'
          '• Ví dụ:\n'
          '  Tổng cân 1.000 kg, bì trừ 10 kg, tạp chất trừ 0 kg, độ ẩm 5%.\n'
          '  Ký độ ẩm = (1.000 - 10 - 0) * 5% = 49.5 kg.\n'
          '  Ký thực thu còn lại: 1.000 - 10 - 49.5 = 940.5 kg.';
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            const Icon(Icons.info_outline, color: AppColors.primary),
            const SizedBox(width: 8),
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          ],
        ),
        content: SingleChildScrollView(
          child: Text(content, style: const TextStyle(height: 1.4, fontSize: 14)),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Đã hiểu', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.primary)),
          ),
        ],
      ),
    );
  }

  Future<void> _saveQuickConfig(RiceCard card) async {
    final repo = ref.read(weighingRepositoryProvider);

    final bagsPerKg = double.tryParse(_quickBagsPerKgController.text) ?? 8.0;
    final bagWeightPerUnit = bagsPerKg > 0 ? (1.0 / bagsPerKg) : 0.125;

    final impurityVal = double.tryParse(_quickImpurityController.text) ?? 0.0;
    final moisturePercent = double.tryParse(_quickMoistureController.text) ?? 0.0;

    final companion = CardsCompanion(
      bagWeightPerUnit: drift.Value(bagWeightPerUnit),
      impurityPercent: drift.Value(card.impurityIsPercent ? impurityVal : card.impurityPercent),
      impurityFixed: drift.Value(card.impurityIsPercent ? card.impurityFixed : impurityVal),
      moisturePercent: drift.Value(moisturePercent),
      lastModified: drift.Value(DateTime.now()),
    );

    await repo.updateCard(card.id, companion);
    
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Đã cập nhật cấu hình trừ bì/độ ẩm/tạp chất'),
          duration: Duration(seconds: 1),
        ),
      );
    }
  }

  String _formatLiveInput(String text) {
    if (text.isEmpty) return '...';
    if (text.contains('.')) return text;
    final num = double.tryParse(text);
    if (num == null) return text;
    return (num / 10.0).toStringAsFixed(1);
  }

  Widget _buildQuickConfigPanel(RiceCard card, bool isDark) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ExpansionTile(
        title: Row(
          children: [
            const Icon(Icons.tune, size: 20, color: AppColors.primary),
            const SizedBox(width: 8),
            Text(
              'Cấu hình trừ bì & khấu hao',
              style: AppTypography.bodyStyle(isDark: isDark).copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        initiallyExpanded: _quickConfigExpanded,
        onExpansionChanged: (val) {
          setState(() {
            _quickConfigExpanded = val;
          });
        },
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    // Bags per 1kg
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text('Số bao = 1kg (Bì)', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
                              const SizedBox(width: 4),
                              GestureDetector(
                                onTap: () => _showExplanationDialog('bag'),
                                child: const Icon(Icons.info_outline, size: 14, color: Colors.grey),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          TextField(
                            controller: _quickBagsPerKgController,
                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                              suffixText: 'bao',
                              helperText: card.bagMethodIsSampling ? 'Đang dùng bì mẫu' : '${(1.0 / (double.tryParse(_quickBagsPerKgController.text) ?? 8.0)).toStringAsFixed(3)} kg/bao',
                              helperStyle: const TextStyle(fontSize: 9),
                            ),
                            enabled: !card.bagMethodIsSampling,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),

                    // Impurity
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                card.impurityIsPercent ? 'Tạp chất (%)' : 'Tạp chất (kg)',
                                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(width: 4),
                              GestureDetector(
                                onTap: () => _showExplanationDialog('impurity'),
                                child: const Icon(Icons.info_outline, size: 14, color: Colors.grey),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          TextField(
                            controller: _quickImpurityController,
                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                              suffixText: card.impurityIsPercent ? '%' : 'kg',
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),

                    // Moisture
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text('Độ ẩm (%)', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
                              const SizedBox(width: 4),
                              GestureDetector(
                                onTap: () => _showExplanationDialog('moisture'),
                                child: const Icon(Icons.info_outline, size: 14, color: Colors.grey),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          TextField(
                            controller: _quickMoistureController,
                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                              suffixText: '%',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                ElevatedButton.icon(
                  onPressed: () => _saveQuickConfig(card),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  icon: const Icon(Icons.save, size: 16),
                  label: const Text('Lưu cấu hình', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cardAsync = ref.watch(cardProvider(widget.cardId));
    final entriesAsync = ref.watch(weightEntriesProvider(widget.cardId));

    // Request focus to ensure keyboard stays open
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_focusNode.hasFocus) {
        _focusNode.requestFocus();
      }
    });

    return cardAsync.when(
      data: (card) {
        _initializeSettings(card);

        return Scaffold(
          appBar: AppBar(
            title: Text('Nhập Cân · ${card.riceVariety} · Phiếu #${card.id}'),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => context.go('/weighing/detail/${card.id}'),
            ),
          ),
          body: Column(
            children: [
              // 1. Live Metrics Card
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: isDark ? AppColors.surfaceDark : AppColors.cardLight,
                  border: Border(bottom: BorderSide(color: isDark ? AppColors.borderDark : AppColors.borderLight)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildMetricItem('Bao', '${card.bagCount}', isDark, AppColors.primary),
                    _buildMetricItem('Tổng Kg', AppFormatters.formatWeight(card.totalWeight).replaceAll(' kg', ''), isDark, Colors.black),
                    _buildMetricItem('Kg Thực', AppFormatters.formatWeight(card.netWeight).replaceAll(' kg', ''), isDark, AppColors.primary),
                    _buildMetricItem('Tạm Tính', AppFormatters.formatMoney(card.totalAmount), isDark, AppColors.accent),
                  ],
                ),
              ),

              // 2. Collapsible Quick Config Panel
              _buildQuickConfigPanel(card, isDark),

              // 3. Transposed 5x6 Column-Major Grid with horizontal paging
              Expanded(
                child: entriesAsync.when(
                  data: (rawEntries) {
                    // Chronological order (database stream is descending)
                    final entries = rawEntries.reversed.toList();

                    // Paging variables (30 items per page: 6 rows x 5 columns)
                    const itemsPerPage = 30;
                    final totalPages = (entries.length / itemsPerPage).ceil() == 0 ? 1 : (entries.length / itemsPerPage).ceil();
                    final activeIndex = _selectedCellIndex ?? entries.length;

                    // If totalPages is calculated, make sure we go to the latest page
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      if (_pageController.hasClients) {
                        final currentPage = _pageController.page?.round() ?? 0;
                        final latestPage = totalPages - 1;
                        if (currentPage < latestPage) {
                          _pageController.animateToPage(
                            latestPage,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeOut,
                          );
                        }
                      }
                    });

                    return Column(
                      children: [
                        Expanded(
                          child: PageView.builder(
                            controller: _pageController,
                            itemCount: totalPages,
                            itemBuilder: (context, pageIndex) {
                              final pageStart = pageIndex * itemsPerPage;
                              final pageEnd = (pageStart + itemsPerPage < entries.length)
                                  ? pageStart + itemsPerPage
                                  : entries.length;
                              final pageEntries = entries.sublist(pageStart, pageEnd);

                              return GridView.builder(
                                padding: const EdgeInsets.all(12),
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 5, // 5 columns
                                  crossAxisSpacing: 6,
                                  mainAxisSpacing: 6,
                                  childAspectRatio: 1.3, // Wider cells for numbers
                                ),
                                itemCount: 30, // 30 cells per page
                                itemBuilder: (context, gridIndex) {
                                  // Map row-major gridIndex to column-major flatIndex
                                  // row = gridIndex ~/ 5 (ranges 0..5)
                                  // col = gridIndex % 5 (ranges 0..4)
                                  final row = gridIndex ~/ 5;
                                  final col = gridIndex % 5;
                                  final flatIndex = col * 6 + row;

                                  final absoluteIndex = pageIndex * itemsPerPage + flatIndex;
                                  final isSelected = absoluteIndex == activeIndex;

                                  // 1. Existing entries
                                  if (flatIndex < pageEntries.length) {
                                    final entry = pageEntries[flatIndex];

                                    return InkWell(
                                      onTap: () {
                                        setState(() {
                                          _selectedCellIndex = absoluteIndex;
                                          _inputController.text = entry.weight.toString();
                                        });
                                      },
                                      borderRadius: BorderRadius.circular(8),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: isSelected 
                                              ? AppColors.primary.withValues(alpha: isDark ? 0.2 : 0.08)
                                              : (isDark ? AppColors.cardDark : Colors.white),
                                          borderRadius: BorderRadius.circular(8),
                                          border: Border.all(
                                            color: isSelected ? AppColors.primary : (isDark ? Colors.grey[800]! : Colors.grey[300]!),
                                            width: isSelected ? 2 : 1,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black.withValues(alpha: 0.04),
                                              blurRadius: 2,
                                              offset: const Offset(0, 1),
                                            )
                                          ],
                                        ),
                                        child: Stack(
                                          children: [
                                            // Index label in top-left
                                            Positioned(
                                              top: 2,
                                              left: 4,
                                              child: Text(
                                                '#${absoluteIndex + 1}',
                                                style: TextStyle(
                                                  fontSize: 9,
                                                  color: isSelected 
                                                      ? AppColors.primary 
                                                      : (isDark ? Colors.white38 : Colors.black38),
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            // Weight value center
                                            Center(
                                              child: Text(
                                                '${entry.weight}',
                                                style: AppTypography.numberStyle(
                                                  isDark: isDark,
                                                  fontSize: 14,
                                                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                                  customColor: isSelected ? AppColors.primary : null,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }

                                  // 2. Active next empty cell (for new input)
                                  if (absoluteIndex == entries.length) {
                                    final showLiveVal = _inputController.text.isNotEmpty;
                                    return InkWell(
                                      onTap: () {
                                        setState(() {
                                          _selectedCellIndex = absoluteIndex;
                                          _inputController.clear();
                                        });
                                      },
                                      borderRadius: BorderRadius.circular(8),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: isSelected 
                                              ? AppColors.accent.withValues(alpha: isDark ? 0.2 : 0.08)
                                              : (isDark ? Colors.transparent : Colors.grey[50]),
                                          borderRadius: BorderRadius.circular(8),
                                          border: Border.all(
                                            color: isSelected ? AppColors.accent : (isDark ? Colors.grey[800]! : Colors.grey[200]!),
                                            width: isSelected ? 2 : 1,
                                            style: isSelected ? BorderStyle.solid : BorderStyle.solid,
                                          ),
                                        ),
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              top: 2,
                                              left: 4,
                                              child: Text(
                                                '#${absoluteIndex + 1}',
                                                style: TextStyle(
                                                  fontSize: 9,
                                                  color: isSelected ? AppColors.accent : (isDark ? Colors.white24 : Colors.black26),
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Center(
                                              child: showLiveVal
                                                  ? Text(
                                                      _formatLiveInput(_inputController.text),
                                                      style: AppTypography.numberStyle(
                                                        isDark: isDark,
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.bold,
                                                        customColor: AppColors.accent,
                                                      ),
                                                    )
                                                  : Icon(
                                                      Icons.add,
                                                      size: 16,
                                                      color: isSelected ? AppColors.accent : (isDark ? Colors.grey[750] : Colors.grey[400]),
                                                    ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }

                                  // 3. Future empty cells
                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        _selectedCellIndex = entries.length;
                                        _inputController.clear();
                                      });
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                          content: Text('Hãy gõ bao lúa tuần tự!'),
                                          duration: Duration(milliseconds: 600),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: isDark ? Colors.transparent : Colors.grey[50]!.withValues(alpha: 0.3),
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          color: isDark ? Colors.grey[850]! : Colors.grey[150]!,
                                          width: 1,
                                        ),
                                      ),
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            top: 2,
                                            left: 4,
                                            child: Text(
                                              '#${absoluteIndex + 1}',
                                              style: TextStyle(
                                                fontSize: 9,
                                                color: isDark ? Colors.white10 : Colors.black12,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        // Page Indicators
                        if (totalPages > 1)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(totalPages, (index) {
                                return AnimatedBuilder(
                                  animation: _pageController,
                                  builder: (context, child) {
                                    double selectedness = 0.0;
                                    if (_pageController.hasClients && _pageController.page != null) {
                                      selectedness = (1.0 - (index - _pageController.page!).abs()).clamp(0.0, 1.0);
                                    } else {
                                      selectedness = index == 0 ? 1.0 : 0.0;
                                    }
                                    return Container(
                                      margin: const EdgeInsets.symmetric(horizontal: 4),
                                      height: 6,
                                      width: 6 + (selectedness * 8),
                                      decoration: BoxDecoration(
                                        color: selectedness > 0.5 
                                            ? AppColors.primary 
                                            : (isDark ? Colors.grey[700] : Colors.grey[300]),
                                        borderRadius: BorderRadius.circular(3),
                                      ),
                                    );
                                  },
                                );
                              }),
                            ),
                          ),
                      ],
                    );
                  },
                  error: (err, stack) => Center(child: Text('Lỗi: $err')),
                  loading: () => const Center(child: CircularProgressIndicator()),
                ),
              ),

              // 4. Input panel: always above the keyboard
              entriesAsync.when(
                data: (rawEntries) {
                  final entries = rawEntries.reversed.toList();
                  final activeIndex = _selectedCellIndex ?? entries.length;

                  return Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isDark ? AppColors.surfaceDark : Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.08),
                          blurRadius: 4,
                          offset: const Offset(0, -2),
                        )
                      ],
                    ),
                    child: Row(
                      children: [
                        // Text input field
                        Expanded(
                          child: TextField(
                            controller: _inputController,
                            focusNode: _focusNode,
                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                            ],
                            style: AppTypography.numberStyle(isDark: isDark, fontSize: 20),
                            decoration: InputDecoration(
                              hintText: _inputMode == 'SMALL' ? '00.0 (SMALL)' : '000.0 (LARGE)',
                              prefixIcon: const Icon(Icons.scale_outlined),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(color: AppColors.primary, width: 2),
                              ),
                              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                              helperText: activeIndex < entries.length 
                                  ? 'Đang sửa bao #${activeIndex + 1}' 
                                  : 'Đang nhập bao #${entries.length + 1}',
                              helperStyle: TextStyle(
                                fontWeight: FontWeight.bold, 
                                color: activeIndex < entries.length ? AppColors.accent : AppColors.primary,
                              ),
                            ),
                            onChanged: (val) => _onInputChanged(val, entries),
                            onSubmitted: (_) => _submitManual(entries),
                          ),
                        ),
                        const SizedBox(width: 8),

                        // Manual Save button
                        IconButton(
                          onPressed: () => _submitManual(entries),
                          icon: Icon(activeIndex < entries.length ? Icons.save : Icons.check),
                          color: Colors.white,
                          style: IconButton.styleFrom(
                            backgroundColor: activeIndex < entries.length ? AppColors.accent : AppColors.primary,
                            padding: const EdgeInsets.all(14),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                        ),
                        const SizedBox(width: 8),

                        // Backspace/Delete last button
                        IconButton(
                          onPressed: () => _deleteLast(rawEntries), // rawEntries is descending, first is the newest. _deleteLast expects descending rawEntries!
                          icon: const Icon(Icons.backspace_outlined),
                          color: Colors.white,
                          style: IconButton.styleFrom(
                            backgroundColor: AppColors.error,
                            padding: const EdgeInsets.all(14),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                        ),
                        const SizedBox(width: 8),

                        // Settings/Options gear button
                        IconButton(
                          onPressed: _openOptionsBottomSheet,
                          icon: const Icon(Icons.settings),
                          color: AppColors.primary,
                          style: IconButton.styleFrom(
                            padding: const EdgeInsets.all(14),
                            side: const BorderSide(color: AppColors.primary),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                error: (err, stack) => const SizedBox(),
                loading: () => const SizedBox(),
              ),
            ],
          ),
        );
      },
      error: (err, stack) => Scaffold(
        appBar: AppBar(title: const Text('Nhập Cân')),
        body: Center(child: Text('Lỗi: Không load được thông tin phiếu ($err)')),
      ),
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
    );
  }

  Widget _buildMetricItem(String label, String value, bool isDark, Color color) {
    return Column(
      children: [
        Text(
          label,
          style: AppTypography.captionStyle(isDark: isDark),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: AppTypography.numberStyle(
            isDark: isDark,
            fontSize: 16,
            customColor: color == Colors.black ? (isDark ? Colors.white : Colors.black) : color,
          ),
        ),
      ],
    );
  }
}
