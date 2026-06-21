import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' as drift;
import '../../../../database/app_database.dart';
import '../../providers/weighing_providers.dart';
import '../../../../core/constants/rice_varieties.dart';
import '../../../../core/utils/season_helper.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';

class CreateCardBottomSheet extends ConsumerStatefulWidget {
  final RiceCard? cardToEdit;
  const CreateCardBottomSheet({super.key, this.cardToEdit});

  @override
  ConsumerState<CreateCardBottomSheet> createState() => _CreateCardBottomSheetState();
}

class _CreateCardBottomSheetState extends ConsumerState<CreateCardBottomSheet> {
  final _formKey = GlobalKey<FormState>();

  // Form Fields Controllers
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _cccdController = TextEditingController();
  final _addressController = TextEditingController();
  final _traderNameController = TextEditingController();
  final _priceController = TextEditingController();
  final _depositController = TextEditingController();

  // Dropdown states
  String _selectedVariety = kRiceVarieties.first;
  late String _selectedSeason;
  late List<String> _seasonOptions;

  // Weighing options
  bool _bagMethodIsSampling = false; // false = Way A (Fixed), true = Way B (Sample)
  final _bagWeightPerUnitController = TextEditingController(text: '0.3');

  // Sample inputs for Way B
  final _bagSampleCountController = TextEditingController(text: '10');
  final _bagSampleTotalWeightController = TextEditingController(text: '5.0');

  // Impurity options
  bool _impurityIsPercent = false; // false = kg, true = %
  final _impurityFixedController = TextEditingController(text: '0.0');
  final _impurityPercentController = TextEditingController(text: '0.0');

  // Moisture
  final _moistureController = TextEditingController(text: '0.0');

  // Input mode
  String _weightInputMode = 'SMALL'; // SMALL (3 numbers) or LARGE (4 numbers)

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _selectedSeason = suggestSeason(now);
    _seasonOptions = getSeasonOptions(now);

    if (widget.cardToEdit != null) {
      final card = widget.cardToEdit!;
      _nameController.text = card.name;
      _phoneController.text = card.phone ?? '';
      _cccdController.text = card.cccd ?? '';
      _addressController.text = card.fieldAddress ?? '';
      _traderNameController.text = card.traderName;
      _priceController.text = card.pricePerKg.toStringAsFixed(0);
      _depositController.text = card.depositAmount.toStringAsFixed(0);
      _selectedVariety = card.riceVariety;
      _selectedSeason = card.seasonLabel;
      _bagMethodIsSampling = card.bagMethodIsSampling;
      _bagWeightPerUnitController.text = card.bagWeightPerUnit.toString();
      _bagSampleCountController.text = card.bagSampleCount.toString();
      _bagSampleTotalWeightController.text = card.bagSampleTotalWeight.toString();
      _impurityIsPercent = card.impurityIsPercent;
      _impurityFixedController.text = card.impurityFixed.toString();
      _impurityPercentController.text = card.impurityPercent.toString();
      _moistureController.text = card.moisturePercent.toString();
      _weightInputMode = card.weightInputMode;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _cccdController.dispose();
    _addressController.dispose();
    _traderNameController.dispose();
    _priceController.dispose();
    _depositController.dispose();
    _bagWeightPerUnitController.dispose();
    _bagSampleCountController.dispose();
    _bagSampleTotalWeightController.dispose();
    _impurityFixedController.dispose();
    _impurityPercentController.dispose();
    _moistureController.dispose();
    super.dispose();
  }

  void _submitForm() async {
    if (!_formKey.currentState!.validate()) return;

    final price = double.tryParse(_priceController.text) ?? 0.0;
    final deposit = double.tryParse(_depositController.text) ?? 0.0;
    
    final bagWeightPerUnit = double.tryParse(_bagWeightPerUnitController.text) ?? 0.3;
    final bagSampleCount = int.tryParse(_bagSampleCountController.text) ?? 0;
    final bagSampleTotalWeight = double.tryParse(_bagSampleTotalWeightController.text) ?? 0.0;

    final impurityFixed = double.tryParse(_impurityFixedController.text) ?? 0.0;
    final impurityPercent = double.tryParse(_impurityPercentController.text) ?? 0.0;
    final moisturePercent = double.tryParse(_moistureController.text) ?? 0.0;

    final repo = ref.read(weighingRepositoryProvider);

    if (widget.cardToEdit != null) {
      final companion = CardsCompanion(
        name: drift.Value(_nameController.text.trim()),
        phone: drift.Value(_phoneController.text.isNotEmpty ? _phoneController.text.trim() : null),
        cccd: drift.Value(_cccdController.text.isNotEmpty ? _cccdController.text.trim() : null),
        fieldAddress: drift.Value(_addressController.text.isNotEmpty ? _addressController.text.trim() : null),
        traderName: drift.Value(_traderNameController.text.trim()),
        riceVariety: drift.Value(_selectedVariety),
        seasonLabel: drift.Value(_selectedSeason),
        bagMethodIsSampling: drift.Value(_bagMethodIsSampling),
        bagWeightPerUnit: drift.Value(bagWeightPerUnit),
        bagSampleCount: drift.Value(bagSampleCount),
        bagSampleTotalWeight: drift.Value(bagSampleTotalWeight),
        impurityIsPercent: drift.Value(_impurityIsPercent),
        impurityFixed: drift.Value(impurityFixed),
        impurityPercent: drift.Value(impurityPercent),
        moisturePercent: drift.Value(moisturePercent),
        weightInputMode: drift.Value(_weightInputMode),
        pricePerKg: drift.Value(price),
        lastModified: drift.Value(DateTime.now()),
      );
      await repo.updateCard(widget.cardToEdit!.id, companion);
    } else {
      final companion = CardsCompanion.insert(
        date: DateTime.now(),
        lastModified: DateTime.now(),
        name: _nameController.text.trim(),
        phone: drift.Value(_phoneController.text.isNotEmpty ? _phoneController.text.trim() : null),
        cccd: drift.Value(_cccdController.text.isNotEmpty ? _cccdController.text.trim() : null),
        fieldAddress: drift.Value(_addressController.text.isNotEmpty ? _addressController.text.trim() : null),
        traderName: drift.Value(_traderNameController.text.trim()),
        riceVariety: _selectedVariety,
        seasonLabel: _selectedSeason,
        bagMethodIsSampling: drift.Value(_bagMethodIsSampling),
        bagWeightPerUnit: drift.Value(bagWeightPerUnit),
        bagSampleCount: drift.Value(bagSampleCount),
        bagSampleTotalWeight: drift.Value(bagSampleTotalWeight),
        impurityIsPercent: drift.Value(_impurityIsPercent),
        impurityFixed: drift.Value(impurityFixed),
        impurityPercent: drift.Value(impurityPercent),
        moisturePercent: drift.Value(moisturePercent),
        weightInputMode: drift.Value(_weightInputMode),
        pricePerKg: drift.Value(price),
        depositAmount: drift.Value(deposit),
      );
      await repo.createCard(companion);
    }
    
    if (mounted) {
      Navigator.of(context).pop();
    }
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title.toUpperCase(),
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 4),
          const Divider(thickness: 1.5, color: AppColors.dividerLight),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom, // Keyboard spacing
      ),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.85,
        decoration: BoxDecoration(
          color: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: Column(
          children: [
            // Handle bar
            Center(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                width: 40,
                height: 5,
                decoration: BoxDecoration(
                  color: isDark ? Colors.grey[700] : Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            // Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.cardToEdit != null ? 'Chỉnh Sửa Phiếu Cân' : 'Tạo Phiếu Cân Mới',
                    style: AppTypography.headingStyle(isDark: isDark),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.of(context).pop(),
                  )
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _buildSectionHeader('Thông Tin Người Bán & Ruộng'),
                      
                      // Name
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          labelText: 'Tên người bán / ruộng *',
                          hintText: 'Ví dụ: Nguyễn Văn A',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                          prefixIcon: const Icon(Icons.person),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Vui lòng nhập tên người bán';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 12),

                      // Phone & CCCD
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: _phoneController,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                labelText: 'Số điện thoại',
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                                prefixIcon: const Icon(Icons.phone),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: TextFormField(
                              controller: _cccdController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: 'Số CCCD',
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                                prefixIcon: const Icon(Icons.badge),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),

                      // Address
                      TextFormField(
                        controller: _addressController,
                        decoration: InputDecoration(
                          labelText: 'Địa chỉ ruộng',
                          hintText: 'Ví dụ: Ấp 3, Xã Mỹ Thành Bắc',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                          prefixIcon: const Icon(Icons.location_on),
                        ),
                      ),
                      const SizedBox(height: 12),

                      // Trader Name
                      TextFormField(
                        controller: _traderNameController,
                        decoration: InputDecoration(
                          labelText: 'Tên thương lái',
                          hintText: 'Tên người đi thu mua lúa',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                          prefixIcon: const Icon(Icons.business_center),
                        ),
                      ),

                      _buildSectionHeader('Chi Tiết Lúa & Giá Thu Mua'),

                      // Variety & Season
                      Row(
                        children: [
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              initialValue: _selectedVariety,
                              decoration: InputDecoration(
                                labelText: 'Giống lúa *',
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                              ),
                              items: kRiceVarieties.map((variety) {
                                return DropdownMenuItem(
                                  value: variety,
                                  child: Text(variety),
                                );
                              }).toList(),
                              onChanged: (val) {
                                if (val != null) {
                                  setState(() => _selectedVariety = val);
                                }
                              },
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              initialValue: _selectedSeason,
                              decoration: InputDecoration(
                                labelText: 'Vụ mùa *',
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                              ),
                              items: _seasonOptions.map((season) {
                                return DropdownMenuItem(
                                  value: season,
                                  child: Text(season),
                                );
                              }).toList(),
                              onChanged: (val) {
                                if (val != null) {
                                  setState(() => _selectedSeason = val);
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),

                      // Price & Deposit
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: _priceController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: 'Giá thu mua (đ/kg) *',
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                                prefixIcon: const Icon(Icons.monetization_on),
                                suffixText: 'đ/kg',
                              ),
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Nhập giá bán';
                                }
                                final p = double.tryParse(value);
                                if (p == null || p <= 0) {
                                  return 'Giá > 0';
                                }
                                return null;
                              },
                            ),
                          ),
                          if (widget.cardToEdit == null) ...[
                            const SizedBox(width: 12),
                            Expanded(
                              child: TextFormField(
                                controller: _depositController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  labelText: 'Tiền đặt cọc',
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                                  prefixIcon: const Icon(Icons.payment),
                                  suffixText: 'đ',
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),

                      _buildSectionHeader('Tùy Chọn Khấu Trừ & Bì'),

                      // Bag Weight Method selection
                      Text(
                        'Cách tính trọng lượng bì (bao)',
                        style: AppTypography.bodyStyle(isDark: isDark).copyWith(fontWeight: FontWeight.bold),
                      ),
                      RadioGroup<bool>(
                        groupValue: _bagMethodIsSampling,
                        onChanged: (val) {
                          if (val != null) {
                            setState(() => _bagMethodIsSampling = val);
                          }
                        },
                        child: Row(
                          children: [
                            Expanded(
                              child: RadioListTile<bool>(
                                title: const Text('Cách A: Cố định'),
                                subtitle: const Text('Kg bì/bao cố định'),
                                value: false,
                                activeColor: AppColors.primary,
                                contentPadding: EdgeInsets.zero,
                              ),
                            ),
                            Expanded(
                              child: RadioListTile<bool>(
                                title: const Text('Cách B: Cân mẫu'),
                                subtitle: const Text('Lấy trung bình mẫu'),
                                value: true,
                                activeColor: AppColors.primary,
                                contentPadding: EdgeInsets.zero,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),

                      // Conditional inputs based on Bag Weight Method
                      if (!_bagMethodIsSampling)
                        TextFormField(
                          controller: _bagWeightPerUnitController,
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                          decoration: InputDecoration(
                            labelText: 'Trọng lượng bì mỗi bao (kg)',
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                            suffixText: 'kg',
                          ),
                        )
                      else
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: _bagSampleCountController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  labelText: 'Số bao mẫu',
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                                  suffixText: 'bao',
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: TextFormField(
                                controller: _bagSampleTotalWeightController,
                                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                decoration: InputDecoration(
                                  labelText: 'Tổng kg bao mẫu',
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                                  suffixText: 'kg',
                                ),
                              ),
                            ),
                          ],
                        ),

                      const SizedBox(height: 16),

                      // Impurity type selection
                      Text(
                        'Khấu trừ tạp chất',
                        style: AppTypography.bodyStyle(isDark: isDark).copyWith(fontWeight: FontWeight.bold),
                      ),
                      RadioGroup<bool>(
                        groupValue: _impurityIsPercent,
                        onChanged: (val) {
                          if (val != null) {
                            setState(() => _impurityIsPercent = val);
                          }
                        },
                        child: Row(
                          children: [
                            Expanded(
                              child: RadioListTile<bool>(
                                title: const Text('Tính theo Kg'),
                                value: false,
                                activeColor: AppColors.primary,
                                contentPadding: EdgeInsets.zero,
                              ),
                            ),
                            Expanded(
                              child: RadioListTile<bool>(
                                title: const Text('Tính theo %'),
                                value: true,
                                activeColor: AppColors.primary,
                                contentPadding: EdgeInsets.zero,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),

                      if (!_impurityIsPercent)
                        TextFormField(
                          controller: _impurityFixedController,
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                          decoration: InputDecoration(
                            labelText: 'Tạp chất trừ cố định (kg)',
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                            suffixText: 'kg',
                          ),
                        )
                      else
                        TextFormField(
                          controller: _impurityPercentController,
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                          decoration: InputDecoration(
                            labelText: 'Tỷ lệ tạp chất khấu trừ (%)',
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                            suffixText: '%',
                          ),
                        ),

                      const SizedBox(height: 16),

                      // Moisture
                      TextFormField(
                        controller: _moistureController,
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        decoration: InputDecoration(
                          labelText: 'Độ ẩm khấu hao (%)',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                          suffixText: '%',
                        ),
                      ),

                      _buildSectionHeader('Tùy Chọn Chế Độ Nhập Cân'),

                      // Weight Input Mode (SMALL/LARGE)
                      RadioGroup<String>(
                        groupValue: _weightInputMode,
                        onChanged: (val) {
                          if (val != null) {
                            setState(() => _weightInputMode = val);
                          }
                        },
                        child: Row(
                          children: [
                            Expanded(
                              child: RadioListTile<String>(
                                title: const Text('SMALL (3 số)'),
                                subtitle: const Text('Ví dụ: 503 -> 50.3 kg'),
                                value: 'SMALL',
                                activeColor: AppColors.primary,
                                contentPadding: EdgeInsets.zero,
                              ),
                            ),
                            Expanded(
                              child: RadioListTile<String>(
                                title: const Text('LARGE (4 số)'),
                                subtitle: const Text('Ví dụ: 1503 -> 150.3 kg'),
                                value: 'LARGE',
                                activeColor: AppColors.primary,
                                contentPadding: EdgeInsets.zero,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 24),

                      // Submit button
                      ElevatedButton(
                        onPressed: _submitForm,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                        child: Text(
                          widget.cardToEdit != null ? 'Lưu Thay Đổi' : 'Tạo Phiếu Cân',
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
