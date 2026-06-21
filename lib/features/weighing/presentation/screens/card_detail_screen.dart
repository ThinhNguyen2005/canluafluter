import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../database/app_database.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/formatters.dart';
import 'package:can_lua/features/weighing/providers/weighing_providers.dart';
import '../widgets/create_card_bottom_sheet.dart';

class CardDetailScreen extends ConsumerStatefulWidget {
  final int cardId;

  const CardDetailScreen({super.key, required this.cardId});

  @override
  ConsumerState<CardDetailScreen> createState() => _CardDetailScreenState();
}


class _CardDetailScreenState extends ConsumerState<CardDetailScreen> {
  // Method to open transaction sheet
  void _openTransactionSheet(int cardId) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _TransactionBottomSheet(cardId: cardId),
    );
  }

  void _showDeleteConfirmation(RiceCard card) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Xác nhận xóa'),
        content: Text('Bạn có chắc chắn muốn xóa phiếu cân của ruộng "${card.name}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Hủy'),
          ),
          TextButton(
            onPressed: () async {
              final repo = ref.read(weighingRepositoryProvider);
              await repo.deleteCard(card.id);
              if (context.mounted) {
                Navigator.of(context).pop(); // Close dialog
                context.go('/weighing'); // Go back to list
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Đã chuyển phiếu cân "${card.name}" vào Thùng rác'),
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
            style: TextButton.styleFrom(foregroundColor: AppColors.error),
            child: const Text('Xóa'),
          ),
        ],
      ),
    );
  }

  void _openEditCardBottomSheet(RiceCard card) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => CreateCardBottomSheet(cardToEdit: card),
    );
  }

  Widget _buildSummaryCards(RiceCard card, bool isDark) {
    return Row(
      children: [
        // Net Weight Card
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: isDark ? 0.2 : 0.08),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.primary.withValues(alpha: 0.3)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Icon(Icons.scale, size: 14, color: AppColors.primary),
                    SizedBox(width: 4),
                    Text('Kg Thực', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.primary)),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  AppFormatters.formatWeight(card.netWeight).replaceAll(' kg', ''),
                  style: AppTypography.numberStyle(isDark: isDark, fontSize: 16, fontWeight: FontWeight.bold, customColor: AppColors.primary),
                ),
                Text('kg', style: AppTypography.captionStyle(isDark: isDark)),
              ],
            ),
          ),
        ),
        const SizedBox(width: 8),
        
        // Total Amount Card
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            decoration: BoxDecoration(
              color: AppColors.accent.withValues(alpha: isDark ? 0.2 : 0.08),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.accent.withValues(alpha: 0.3)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Icon(Icons.monetization_on, size: 14, color: AppColors.accent),
                    SizedBox(width: 4),
                    Text('Tổng Tiền', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.accent)),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  AppFormatters.formatMoney(card.totalAmount),
                  style: AppTypography.numberStyle(isDark: isDark, fontSize: 16, fontWeight: FontWeight.bold, customColor: AppColors.accent),
                ),
                Text('đồng', style: AppTypography.captionStyle(isDark: isDark)),
              ],
            ),
          ),
        ),
        const SizedBox(width: 8),

        // Remaining Debt Card
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            decoration: BoxDecoration(
              color: (card.remainingAmount <= 0 ? AppColors.paidColor : AppColors.debtColor).withValues(alpha: isDark ? 0.2 : 0.08),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: (card.remainingAmount <= 0 ? AppColors.paidColor : AppColors.debtColor).withValues(alpha: 0.3)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      card.remainingAmount <= 0 ? Icons.check_circle : Icons.warning_amber,
                      size: 14,
                      color: card.remainingAmount <= 0 ? AppColors.paidColor : AppColors.debtColor,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      card.remainingAmount <= 0 ? 'Đã Đủ' : 'Còn Nợ',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: card.remainingAmount <= 0 ? AppColors.paidColor : AppColors.debtColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  AppFormatters.formatMoney(card.remainingAmount.abs()),
                  style: AppTypography.numberStyle(
                    isDark: isDark,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    customColor: card.remainingAmount <= 0 ? AppColors.paidColor : AppColors.debtColor,
                  ),
                ),
                Text('đồng', style: AppTypography.captionStyle(isDark: isDark)),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value, bool isDark) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 18, color: AppColors.primary),
          const SizedBox(width: 10),
          SizedBox(
            width: 110,
            child: Text(
              label,
              style: AppTypography.captionStyle(isDark: isDark).copyWith(fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: AppTypography.bodyStyle(isDark: isDark).copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMetricRow(IconData icon, String label, String value, bool isDark, {bool isBold = false, Color? color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, size: 18, color: color ?? (isDark ? Colors.grey[400] : Colors.grey[650])),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              label,
              style: isBold
                  ? AppTypography.bodyStyle(isDark: isDark).copyWith(fontWeight: FontWeight.bold)
                  : AppTypography.bodyStyle(isDark: isDark, isMuted: true),
            ),
          ),
          Text(
            value,
            style: isBold
                ? AppTypography.numberStyle(isDark: isDark, fontSize: 16, customColor: color)
                : AppTypography.numberStyle(isDark: isDark, fontSize: 14, customColor: color),
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

    return cardAsync.when(
      data: (card) {
        // Calculate moisture deduction in kg
        final moistureDeduction = card.totalWeight * (card.moisturePercent / 100.0);

        return Scaffold(
          appBar: AppBar(
            title: Text('Phiếu Cân #${card.id.toString().padLeft(3, '0')}'),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => context.go('/weighing'),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.edit_outlined),
                tooltip: 'Chỉnh sửa thông tin phiếu',
                onPressed: () => _openEditCardBottomSheet(card),
              ),
              IconButton(
                icon: const Icon(Icons.delete_outline),
                onPressed: () => _showDeleteConfirmation(card),
              ),
            ],
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // 3 Core Metrics Summary Cards
                _buildSummaryCards(card, isDark),
                const SizedBox(height: 16),

                // Seller details Card
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Thông tin phiếu', style: AppTypography.titleStyle(isDark: isDark)),
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
                          ],
                        ),
                        const SizedBox(height: 12),
                        _buildInfoRow(Icons.person, 'Người bán:', card.name, isDark),
                        if (card.phone != null) _buildInfoRow(Icons.phone, 'Số điện thoại:', card.phone!, isDark),
                        if (card.cccd != null) _buildInfoRow(Icons.badge, 'Số CCCD:', card.cccd!, isDark),
                        if (card.fieldAddress != null) _buildInfoRow(Icons.location_on, 'Địa chỉ ruộng:', card.fieldAddress!, isDark),
                        if (card.traderName.isNotEmpty) _buildInfoRow(Icons.business_center, 'Thương lái:', card.traderName, isDark),
                        _buildInfoRow(Icons.grass, 'Vụ mùa:', card.seasonLabel, isDark),
                        _buildInfoRow(Icons.calendar_today, 'Ngày lập:', AppFormatters.formatDate(card.date, includeTime: true), isDark),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Weight summary Card
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Tổng hợp khối lượng', style: AppTypography.titleStyle(isDark: isDark)),
                        const SizedBox(height: 12),
                        _buildMetricRow(Icons.scale_outlined, 'Tổng cân lúa (${card.bagCount} bao):', AppFormatters.formatWeight(card.totalWeight), isDark),
                        _buildMetricRow(
                          Icons.shopping_bag_outlined,
                          'Tổng bao bì (${card.bagMethodIsSampling ? "Cân mẫu" : "Cố định ${card.bagWeightPerUnit}kg"}):',
                          '- ${AppFormatters.formatWeight(card.bagWeight)}',
                          isDark,
                          color: AppColors.debtColor,
                        ),
                        _buildMetricRow(
                          Icons.waves_outlined,
                          'Khấu hao tạp chất (${card.impurityIsPercent ? "${card.impurityPercent}%" : "Cố định"}):',
                          '- ${AppFormatters.formatWeight(card.impurityWeight)}',
                          isDark,
                          color: AppColors.debtColor,
                        ),
                        _buildMetricRow(
                          Icons.water_drop_outlined,
                          'Khấu hao độ ẩm (${card.moisturePercent}%):',
                          '- ${AppFormatters.formatWeight(moistureDeduction)}',
                          isDark,
                          color: AppColors.debtColor,
                        ),
                        const Divider(height: 20),
                        _buildMetricRow(
                          Icons.done_all,
                          'KHỐI LƯỢNG THỰC TẾ (KG THỰC):',
                          AppFormatters.formatWeight(card.netWeight),
                          isDark,
                          isBold: true,
                          color: AppColors.primary,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Financial Summary Card
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Thanh toán', style: AppTypography.titleStyle(isDark: isDark)),
                        const SizedBox(height: 12),
                        _buildMetricRow(Icons.monetization_on_outlined, 'Đơn giá thu mua:', AppFormatters.formatPrice(card.pricePerKg), isDark),
                        _buildMetricRow(
                          Icons.currency_exchange,
                          'Tổng tiền lúa:',
                          AppFormatters.formatFullMoney(card.totalAmount),
                          isDark,
                          isBold: true,
                        ),
                        _buildMetricRow(Icons.account_balance_wallet_outlined, 'Đã nhận cọc:', '- ${AppFormatters.formatFullMoney(card.depositAmount)}', isDark, color: AppColors.depositColor),
                        _buildMetricRow(Icons.payments_outlined, 'Đã trả thêm:', '- ${AppFormatters.formatFullMoney(card.paidAmount)}', isDark, color: AppColors.paidColor),
                        const Divider(height: 20),
                        _buildMetricRow(
                          card.remainingAmount <= 0 ? Icons.check_circle_outline : Icons.pending_actions,
                          card.remainingAmount <= 0 ? 'DƯ NỢ (ĐỦ TIỀN):' : 'CÒN LẠI (CÒN NỢ):',
                          AppFormatters.formatFullMoney(card.remainingAmount.abs()),
                          isDark,
                          isBold: true,
                          color: card.remainingAmount <= 0 ? AppColors.paidColor : AppColors.debtColor,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Bags details list Card
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Danh sách bao', style: AppTypography.titleStyle(isDark: isDark)),
                        const SizedBox(height: 12),
                        entriesAsync.when(
                          data: (entries) {
                            if (entries.isEmpty) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 24),
                                child: Center(
                                  child: Text(
                                    'Chưa có bao nào được cân',
                                    style: AppTypography.bodyStyle(isDark: isDark, isMuted: true),
                                  ),
                                ),
                              );
                            }

                            return Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: List.generate(entries.length, (index) {
                                final entry = entries[index];
                                return Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                                  decoration: BoxDecoration(
                                    color: isDark ? Colors.grey[850] : Colors.grey[100],
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: isDark ? Colors.grey[800]! : Colors.grey[300]!,
                                    ),
                                  ),
                                  child: Text(
                                    '#${index + 1}: ${entry.weight} kg',
                                    style: AppTypography.numberStyle(
                                      isDark: isDark,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                );
                              }),
                            );
                          },
                          error: (err, stack) => Text('Lỗi: $err'),
                          loading: () => const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 80), // bottom space for actions
              ],
            ),
          ),
          // Floating Bottom Navigation Bar for Actions
          bottomSheet: Container(
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
                // Weigh action (Primary)
                Expanded(
                  flex: 2,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      context.go('/weighing/detail/${card.id}/weigh');
                    },
                    icon: const Icon(Icons.scale),
                    label: const Text('Nhập Cân', style: TextStyle(fontWeight: FontWeight.bold)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                ),
                const SizedBox(width: 8),

                // Pay action
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => _openTransactionSheet(card.id),
                    icon: const Icon(Icons.payment),
                    label: const Text('Trả Tiền'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.primary,
                      side: const BorderSide(color: AppColors.primary),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                ),
                const SizedBox(width: 8),

                // PDF action (TODO: PDF - implement in Sprint 5)
                IconButton(
                  onPressed: () {
                    // TODO: PDF - implement detail template in Sprint 5
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Tính năng Xuất PDF sẽ được phát triển sau ở Sprint 5'),
                      ),
                    );
                  },
                  icon: const Icon(Icons.picture_as_pdf),
                  color: AppColors.accent,
                  style: IconButton.styleFrom(
                    padding: const EdgeInsets.all(14),
                    side: const BorderSide(color: AppColors.accent),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      error: (err, stack) => Scaffold(
        appBar: AppBar(title: const Text('Chi tiết phiếu')),
        body: Center(child: Text('Lỗi: Không tìm thấy phiếu cân ($err)')),
      ),
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator(color: AppColors.primary)),
      ),
    );
  }
}

class _TransactionBottomSheet extends ConsumerStatefulWidget {
  final int cardId;

  const _TransactionBottomSheet({required this.cardId});

  @override
  ConsumerState<_TransactionBottomSheet> createState() => _TransactionBottomSheetState();
}

class _TransactionBottomSheetState extends ConsumerState<_TransactionBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _descriptionController = TextEditingController();
  String _selectedType = 'PAYMENT'; // 'PAYMENT', 'DEPOSIT', 'REFUND'

  @override
  void dispose() {
    _amountController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _submit() async {
    if (!_formKey.currentState!.validate()) return;
    
    final amount = double.tryParse(_amountController.text) ?? 0.0;
    final repo = ref.read(weighingRepositoryProvider);

    await repo.addTransaction(
      cardId: widget.cardId,
      amount: amount,
      type: _selectedType,
      description: _descriptionController.text.trim().isNotEmpty 
          ? _descriptionController.text.trim() 
          : (_selectedType == 'PAYMENT' ? 'Thanh toán thêm tiền lúa' : (_selectedType == 'DEPOSIT' ? 'Thêm tiền cọc' : 'Hoàn trả lại tiền')),
    );

    if (mounted) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isDark ? AppColors.surfaceDark : Colors.white,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Ghi nhận giao dịch tài chính',
                style: AppTypography.titleStyle(isDark: isDark),
              ),
              const SizedBox(height: 16),
              
              // Select transaction type
              DropdownButtonFormField<String>(
                initialValue: _selectedType,
                decoration: InputDecoration(
                  labelText: 'Loại giao dịch',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                ),
                items: const [
                  DropdownMenuItem(value: 'PAYMENT', child: Text('Thanh toán thêm')),
                  DropdownMenuItem(value: 'DEPOSIT', child: Text('Nhận cọc thêm')),
                  DropdownMenuItem(value: 'REFUND', child: Text('Trả lại tiền (Hoàn tiền)')),
                ],
                onChanged: (val) {
                  if (val != null) {
                    setState(() => _selectedType = val);
                  }
                },
              ),
              const SizedBox(height: 12),

              // Amount
              TextFormField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Số tiền giao dịch (đ) *',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  suffixText: 'đ',
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Nhập số tiền';
                  }
                  final v = double.tryParse(value);
                  if (v == null || v <= 0) {
                    return 'Số tiền phải > 0';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),

              // Description
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  labelText: 'Ghi chú / Mô tả',
                  hintText: 'Ví dụ: Thanh toán đợt 2',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),
              const SizedBox(height: 20),

              // Submit button
              ElevatedButton(
                onPressed: _submit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text('Ghi Nhận Giao Dịch', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
