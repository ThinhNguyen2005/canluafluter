// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $CardsTable extends Cards with TableInfo<$CardsTable, RiceCard> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CardsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _lastModifiedMeta =
      const VerificationMeta('lastModified');
  @override
  late final GeneratedColumn<DateTime> lastModified = GeneratedColumn<DateTime>(
      'last_modified', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
      'phone', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _cccdMeta = const VerificationMeta('cccd');
  @override
  late final GeneratedColumn<String> cccd = GeneratedColumn<String>(
      'cccd', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _fieldAddressMeta =
      const VerificationMeta('fieldAddress');
  @override
  late final GeneratedColumn<String> fieldAddress = GeneratedColumn<String>(
      'field_address', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _traderNameMeta =
      const VerificationMeta('traderName');
  @override
  late final GeneratedColumn<String> traderName = GeneratedColumn<String>(
      'trader_name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _riceVarietyMeta =
      const VerificationMeta('riceVariety');
  @override
  late final GeneratedColumn<String> riceVariety = GeneratedColumn<String>(
      'rice_variety', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _seasonLabelMeta =
      const VerificationMeta('seasonLabel');
  @override
  late final GeneratedColumn<String> seasonLabel = GeneratedColumn<String>(
      'season_label', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _totalWeightMeta =
      const VerificationMeta('totalWeight');
  @override
  late final GeneratedColumn<double> totalWeight = GeneratedColumn<double>(
      'total_weight', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _bagWeightMeta =
      const VerificationMeta('bagWeight');
  @override
  late final GeneratedColumn<double> bagWeight = GeneratedColumn<double>(
      'bag_weight', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _impurityWeightMeta =
      const VerificationMeta('impurityWeight');
  @override
  late final GeneratedColumn<double> impurityWeight = GeneratedColumn<double>(
      'impurity_weight', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _netWeightMeta =
      const VerificationMeta('netWeight');
  @override
  late final GeneratedColumn<double> netWeight = GeneratedColumn<double>(
      'net_weight', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _moisturePercentMeta =
      const VerificationMeta('moisturePercent');
  @override
  late final GeneratedColumn<double> moisturePercent = GeneratedColumn<double>(
      'moisture_percent', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _bagCountMeta =
      const VerificationMeta('bagCount');
  @override
  late final GeneratedColumn<int> bagCount = GeneratedColumn<int>(
      'bag_count', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _bagMethodIsSamplingMeta =
      const VerificationMeta('bagMethodIsSampling');
  @override
  late final GeneratedColumn<bool> bagMethodIsSampling = GeneratedColumn<bool>(
      'bag_method_is_sampling', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("bag_method_is_sampling" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _bagSampleCountMeta =
      const VerificationMeta('bagSampleCount');
  @override
  late final GeneratedColumn<int> bagSampleCount = GeneratedColumn<int>(
      'bag_sample_count', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _bagSampleTotalWeightMeta =
      const VerificationMeta('bagSampleTotalWeight');
  @override
  late final GeneratedColumn<double> bagSampleTotalWeight =
      GeneratedColumn<double>('bag_sample_total_weight', aliasedName, false,
          type: DriftSqlType.double,
          requiredDuringInsert: false,
          defaultValue: const Constant(0.0));
  static const VerificationMeta _bagWeightPerUnitMeta =
      const VerificationMeta('bagWeightPerUnit');
  @override
  late final GeneratedColumn<double> bagWeightPerUnit = GeneratedColumn<double>(
      'bag_weight_per_unit', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.3));
  static const VerificationMeta _impurityIsPercentMeta =
      const VerificationMeta('impurityIsPercent');
  @override
  late final GeneratedColumn<bool> impurityIsPercent = GeneratedColumn<bool>(
      'impurity_is_percent', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("impurity_is_percent" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _impurityFixedMeta =
      const VerificationMeta('impurityFixed');
  @override
  late final GeneratedColumn<double> impurityFixed = GeneratedColumn<double>(
      'impurity_fixed', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _impurityPercentMeta =
      const VerificationMeta('impurityPercent');
  @override
  late final GeneratedColumn<double> impurityPercent = GeneratedColumn<double>(
      'impurity_percent', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _weightInputModeMeta =
      const VerificationMeta('weightInputMode');
  @override
  late final GeneratedColumn<String> weightInputMode = GeneratedColumn<String>(
      'weight_input_mode', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('SMALL'));
  static const VerificationMeta _pricePerKgMeta =
      const VerificationMeta('pricePerKg');
  @override
  late final GeneratedColumn<double> pricePerKg = GeneratedColumn<double>(
      'price_per_kg', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _totalAmountMeta =
      const VerificationMeta('totalAmount');
  @override
  late final GeneratedColumn<double> totalAmount = GeneratedColumn<double>(
      'total_amount', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _depositAmountMeta =
      const VerificationMeta('depositAmount');
  @override
  late final GeneratedColumn<double> depositAmount = GeneratedColumn<double>(
      'deposit_amount', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _paidAmountMeta =
      const VerificationMeta('paidAmount');
  @override
  late final GeneratedColumn<double> paidAmount = GeneratedColumn<double>(
      'paid_amount', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _remainingAmountMeta =
      const VerificationMeta('remainingAmount');
  @override
  late final GeneratedColumn<double> remainingAmount = GeneratedColumn<double>(
      'remaining_amount', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _isPaidMeta = const VerificationMeta('isPaid');
  @override
  late final GeneratedColumn<bool> isPaid = GeneratedColumn<bool>(
      'is_paid', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_paid" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _latitudeMeta =
      const VerificationMeta('latitude');
  @override
  late final GeneratedColumn<double> latitude = GeneratedColumn<double>(
      'latitude', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _longitudeMeta =
      const VerificationMeta('longitude');
  @override
  late final GeneratedColumn<double> longitude = GeneratedColumn<double>(
      'longitude', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _isDeletedMeta =
      const VerificationMeta('isDeleted');
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
      'is_deleted', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_deleted" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        date,
        lastModified,
        name,
        phone,
        cccd,
        fieldAddress,
        traderName,
        riceVariety,
        seasonLabel,
        totalWeight,
        bagWeight,
        impurityWeight,
        netWeight,
        moisturePercent,
        bagCount,
        bagMethodIsSampling,
        bagSampleCount,
        bagSampleTotalWeight,
        bagWeightPerUnit,
        impurityIsPercent,
        impurityFixed,
        impurityPercent,
        weightInputMode,
        pricePerKg,
        totalAmount,
        depositAmount,
        paidAmount,
        remainingAmount,
        isPaid,
        latitude,
        longitude,
        isDeleted
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cards';
  @override
  VerificationContext validateIntegrity(Insertable<RiceCard> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('last_modified')) {
      context.handle(
          _lastModifiedMeta,
          lastModified.isAcceptableOrUnknown(
              data['last_modified']!, _lastModifiedMeta));
    } else if (isInserting) {
      context.missing(_lastModifiedMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
          _phoneMeta, phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta));
    }
    if (data.containsKey('cccd')) {
      context.handle(
          _cccdMeta, cccd.isAcceptableOrUnknown(data['cccd']!, _cccdMeta));
    }
    if (data.containsKey('field_address')) {
      context.handle(
          _fieldAddressMeta,
          fieldAddress.isAcceptableOrUnknown(
              data['field_address']!, _fieldAddressMeta));
    }
    if (data.containsKey('trader_name')) {
      context.handle(
          _traderNameMeta,
          traderName.isAcceptableOrUnknown(
              data['trader_name']!, _traderNameMeta));
    }
    if (data.containsKey('rice_variety')) {
      context.handle(
          _riceVarietyMeta,
          riceVariety.isAcceptableOrUnknown(
              data['rice_variety']!, _riceVarietyMeta));
    } else if (isInserting) {
      context.missing(_riceVarietyMeta);
    }
    if (data.containsKey('season_label')) {
      context.handle(
          _seasonLabelMeta,
          seasonLabel.isAcceptableOrUnknown(
              data['season_label']!, _seasonLabelMeta));
    } else if (isInserting) {
      context.missing(_seasonLabelMeta);
    }
    if (data.containsKey('total_weight')) {
      context.handle(
          _totalWeightMeta,
          totalWeight.isAcceptableOrUnknown(
              data['total_weight']!, _totalWeightMeta));
    }
    if (data.containsKey('bag_weight')) {
      context.handle(_bagWeightMeta,
          bagWeight.isAcceptableOrUnknown(data['bag_weight']!, _bagWeightMeta));
    }
    if (data.containsKey('impurity_weight')) {
      context.handle(
          _impurityWeightMeta,
          impurityWeight.isAcceptableOrUnknown(
              data['impurity_weight']!, _impurityWeightMeta));
    }
    if (data.containsKey('net_weight')) {
      context.handle(_netWeightMeta,
          netWeight.isAcceptableOrUnknown(data['net_weight']!, _netWeightMeta));
    }
    if (data.containsKey('moisture_percent')) {
      context.handle(
          _moisturePercentMeta,
          moisturePercent.isAcceptableOrUnknown(
              data['moisture_percent']!, _moisturePercentMeta));
    }
    if (data.containsKey('bag_count')) {
      context.handle(_bagCountMeta,
          bagCount.isAcceptableOrUnknown(data['bag_count']!, _bagCountMeta));
    }
    if (data.containsKey('bag_method_is_sampling')) {
      context.handle(
          _bagMethodIsSamplingMeta,
          bagMethodIsSampling.isAcceptableOrUnknown(
              data['bag_method_is_sampling']!, _bagMethodIsSamplingMeta));
    }
    if (data.containsKey('bag_sample_count')) {
      context.handle(
          _bagSampleCountMeta,
          bagSampleCount.isAcceptableOrUnknown(
              data['bag_sample_count']!, _bagSampleCountMeta));
    }
    if (data.containsKey('bag_sample_total_weight')) {
      context.handle(
          _bagSampleTotalWeightMeta,
          bagSampleTotalWeight.isAcceptableOrUnknown(
              data['bag_sample_total_weight']!, _bagSampleTotalWeightMeta));
    }
    if (data.containsKey('bag_weight_per_unit')) {
      context.handle(
          _bagWeightPerUnitMeta,
          bagWeightPerUnit.isAcceptableOrUnknown(
              data['bag_weight_per_unit']!, _bagWeightPerUnitMeta));
    }
    if (data.containsKey('impurity_is_percent')) {
      context.handle(
          _impurityIsPercentMeta,
          impurityIsPercent.isAcceptableOrUnknown(
              data['impurity_is_percent']!, _impurityIsPercentMeta));
    }
    if (data.containsKey('impurity_fixed')) {
      context.handle(
          _impurityFixedMeta,
          impurityFixed.isAcceptableOrUnknown(
              data['impurity_fixed']!, _impurityFixedMeta));
    }
    if (data.containsKey('impurity_percent')) {
      context.handle(
          _impurityPercentMeta,
          impurityPercent.isAcceptableOrUnknown(
              data['impurity_percent']!, _impurityPercentMeta));
    }
    if (data.containsKey('weight_input_mode')) {
      context.handle(
          _weightInputModeMeta,
          weightInputMode.isAcceptableOrUnknown(
              data['weight_input_mode']!, _weightInputModeMeta));
    }
    if (data.containsKey('price_per_kg')) {
      context.handle(
          _pricePerKgMeta,
          pricePerKg.isAcceptableOrUnknown(
              data['price_per_kg']!, _pricePerKgMeta));
    }
    if (data.containsKey('total_amount')) {
      context.handle(
          _totalAmountMeta,
          totalAmount.isAcceptableOrUnknown(
              data['total_amount']!, _totalAmountMeta));
    }
    if (data.containsKey('deposit_amount')) {
      context.handle(
          _depositAmountMeta,
          depositAmount.isAcceptableOrUnknown(
              data['deposit_amount']!, _depositAmountMeta));
    }
    if (data.containsKey('paid_amount')) {
      context.handle(
          _paidAmountMeta,
          paidAmount.isAcceptableOrUnknown(
              data['paid_amount']!, _paidAmountMeta));
    }
    if (data.containsKey('remaining_amount')) {
      context.handle(
          _remainingAmountMeta,
          remainingAmount.isAcceptableOrUnknown(
              data['remaining_amount']!, _remainingAmountMeta));
    }
    if (data.containsKey('is_paid')) {
      context.handle(_isPaidMeta,
          isPaid.isAcceptableOrUnknown(data['is_paid']!, _isPaidMeta));
    }
    if (data.containsKey('latitude')) {
      context.handle(_latitudeMeta,
          latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta));
    }
    if (data.containsKey('longitude')) {
      context.handle(_longitudeMeta,
          longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta));
    }
    if (data.containsKey('is_deleted')) {
      context.handle(_isDeletedMeta,
          isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RiceCard map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RiceCard(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      lastModified: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_modified'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      phone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone']),
      cccd: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cccd']),
      fieldAddress: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}field_address']),
      traderName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}trader_name'])!,
      riceVariety: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}rice_variety'])!,
      seasonLabel: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}season_label'])!,
      totalWeight: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}total_weight'])!,
      bagWeight: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}bag_weight'])!,
      impurityWeight: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}impurity_weight'])!,
      netWeight: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}net_weight'])!,
      moisturePercent: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}moisture_percent'])!,
      bagCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}bag_count'])!,
      bagMethodIsSampling: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}bag_method_is_sampling'])!,
      bagSampleCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}bag_sample_count'])!,
      bagSampleTotalWeight: attachedDatabase.typeMapping.read(
          DriftSqlType.double,
          data['${effectivePrefix}bag_sample_total_weight'])!,
      bagWeightPerUnit: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}bag_weight_per_unit'])!,
      impurityIsPercent: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}impurity_is_percent'])!,
      impurityFixed: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}impurity_fixed'])!,
      impurityPercent: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}impurity_percent'])!,
      weightInputMode: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}weight_input_mode'])!,
      pricePerKg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}price_per_kg'])!,
      totalAmount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}total_amount'])!,
      depositAmount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}deposit_amount'])!,
      paidAmount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}paid_amount'])!,
      remainingAmount: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}remaining_amount'])!,
      isPaid: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_paid'])!,
      latitude: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}latitude']),
      longitude: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}longitude']),
      isDeleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_deleted'])!,
    );
  }

  @override
  $CardsTable createAlias(String alias) {
    return $CardsTable(attachedDatabase, alias);
  }
}

class RiceCard extends DataClass implements Insertable<RiceCard> {
  final int id;
  final DateTime date;
  final DateTime lastModified;
  final String name;
  final String? phone;
  final String? cccd;
  final String? fieldAddress;
  final String traderName;
  final String riceVariety;
  final String seasonLabel;
  final double totalWeight;
  final double bagWeight;
  final double impurityWeight;
  final double netWeight;
  final double moisturePercent;
  final int bagCount;
  final bool bagMethodIsSampling;
  final int bagSampleCount;
  final double bagSampleTotalWeight;
  final double bagWeightPerUnit;
  final bool impurityIsPercent;
  final double impurityFixed;
  final double impurityPercent;
  final String weightInputMode;
  final double pricePerKg;
  final double totalAmount;
  final double depositAmount;
  final double paidAmount;
  final double remainingAmount;
  final bool isPaid;
  final double? latitude;
  final double? longitude;
  final bool isDeleted;
  const RiceCard(
      {required this.id,
      required this.date,
      required this.lastModified,
      required this.name,
      this.phone,
      this.cccd,
      this.fieldAddress,
      required this.traderName,
      required this.riceVariety,
      required this.seasonLabel,
      required this.totalWeight,
      required this.bagWeight,
      required this.impurityWeight,
      required this.netWeight,
      required this.moisturePercent,
      required this.bagCount,
      required this.bagMethodIsSampling,
      required this.bagSampleCount,
      required this.bagSampleTotalWeight,
      required this.bagWeightPerUnit,
      required this.impurityIsPercent,
      required this.impurityFixed,
      required this.impurityPercent,
      required this.weightInputMode,
      required this.pricePerKg,
      required this.totalAmount,
      required this.depositAmount,
      required this.paidAmount,
      required this.remainingAmount,
      required this.isPaid,
      this.latitude,
      this.longitude,
      required this.isDeleted});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['date'] = Variable<DateTime>(date);
    map['last_modified'] = Variable<DateTime>(lastModified);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    if (!nullToAbsent || cccd != null) {
      map['cccd'] = Variable<String>(cccd);
    }
    if (!nullToAbsent || fieldAddress != null) {
      map['field_address'] = Variable<String>(fieldAddress);
    }
    map['trader_name'] = Variable<String>(traderName);
    map['rice_variety'] = Variable<String>(riceVariety);
    map['season_label'] = Variable<String>(seasonLabel);
    map['total_weight'] = Variable<double>(totalWeight);
    map['bag_weight'] = Variable<double>(bagWeight);
    map['impurity_weight'] = Variable<double>(impurityWeight);
    map['net_weight'] = Variable<double>(netWeight);
    map['moisture_percent'] = Variable<double>(moisturePercent);
    map['bag_count'] = Variable<int>(bagCount);
    map['bag_method_is_sampling'] = Variable<bool>(bagMethodIsSampling);
    map['bag_sample_count'] = Variable<int>(bagSampleCount);
    map['bag_sample_total_weight'] = Variable<double>(bagSampleTotalWeight);
    map['bag_weight_per_unit'] = Variable<double>(bagWeightPerUnit);
    map['impurity_is_percent'] = Variable<bool>(impurityIsPercent);
    map['impurity_fixed'] = Variable<double>(impurityFixed);
    map['impurity_percent'] = Variable<double>(impurityPercent);
    map['weight_input_mode'] = Variable<String>(weightInputMode);
    map['price_per_kg'] = Variable<double>(pricePerKg);
    map['total_amount'] = Variable<double>(totalAmount);
    map['deposit_amount'] = Variable<double>(depositAmount);
    map['paid_amount'] = Variable<double>(paidAmount);
    map['remaining_amount'] = Variable<double>(remainingAmount);
    map['is_paid'] = Variable<bool>(isPaid);
    if (!nullToAbsent || latitude != null) {
      map['latitude'] = Variable<double>(latitude);
    }
    if (!nullToAbsent || longitude != null) {
      map['longitude'] = Variable<double>(longitude);
    }
    map['is_deleted'] = Variable<bool>(isDeleted);
    return map;
  }

  CardsCompanion toCompanion(bool nullToAbsent) {
    return CardsCompanion(
      id: Value(id),
      date: Value(date),
      lastModified: Value(lastModified),
      name: Value(name),
      phone:
          phone == null && nullToAbsent ? const Value.absent() : Value(phone),
      cccd: cccd == null && nullToAbsent ? const Value.absent() : Value(cccd),
      fieldAddress: fieldAddress == null && nullToAbsent
          ? const Value.absent()
          : Value(fieldAddress),
      traderName: Value(traderName),
      riceVariety: Value(riceVariety),
      seasonLabel: Value(seasonLabel),
      totalWeight: Value(totalWeight),
      bagWeight: Value(bagWeight),
      impurityWeight: Value(impurityWeight),
      netWeight: Value(netWeight),
      moisturePercent: Value(moisturePercent),
      bagCount: Value(bagCount),
      bagMethodIsSampling: Value(bagMethodIsSampling),
      bagSampleCount: Value(bagSampleCount),
      bagSampleTotalWeight: Value(bagSampleTotalWeight),
      bagWeightPerUnit: Value(bagWeightPerUnit),
      impurityIsPercent: Value(impurityIsPercent),
      impurityFixed: Value(impurityFixed),
      impurityPercent: Value(impurityPercent),
      weightInputMode: Value(weightInputMode),
      pricePerKg: Value(pricePerKg),
      totalAmount: Value(totalAmount),
      depositAmount: Value(depositAmount),
      paidAmount: Value(paidAmount),
      remainingAmount: Value(remainingAmount),
      isPaid: Value(isPaid),
      latitude: latitude == null && nullToAbsent
          ? const Value.absent()
          : Value(latitude),
      longitude: longitude == null && nullToAbsent
          ? const Value.absent()
          : Value(longitude),
      isDeleted: Value(isDeleted),
    );
  }

  factory RiceCard.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RiceCard(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      lastModified: serializer.fromJson<DateTime>(json['lastModified']),
      name: serializer.fromJson<String>(json['name']),
      phone: serializer.fromJson<String?>(json['phone']),
      cccd: serializer.fromJson<String?>(json['cccd']),
      fieldAddress: serializer.fromJson<String?>(json['fieldAddress']),
      traderName: serializer.fromJson<String>(json['traderName']),
      riceVariety: serializer.fromJson<String>(json['riceVariety']),
      seasonLabel: serializer.fromJson<String>(json['seasonLabel']),
      totalWeight: serializer.fromJson<double>(json['totalWeight']),
      bagWeight: serializer.fromJson<double>(json['bagWeight']),
      impurityWeight: serializer.fromJson<double>(json['impurityWeight']),
      netWeight: serializer.fromJson<double>(json['netWeight']),
      moisturePercent: serializer.fromJson<double>(json['moisturePercent']),
      bagCount: serializer.fromJson<int>(json['bagCount']),
      bagMethodIsSampling:
          serializer.fromJson<bool>(json['bagMethodIsSampling']),
      bagSampleCount: serializer.fromJson<int>(json['bagSampleCount']),
      bagSampleTotalWeight:
          serializer.fromJson<double>(json['bagSampleTotalWeight']),
      bagWeightPerUnit: serializer.fromJson<double>(json['bagWeightPerUnit']),
      impurityIsPercent: serializer.fromJson<bool>(json['impurityIsPercent']),
      impurityFixed: serializer.fromJson<double>(json['impurityFixed']),
      impurityPercent: serializer.fromJson<double>(json['impurityPercent']),
      weightInputMode: serializer.fromJson<String>(json['weightInputMode']),
      pricePerKg: serializer.fromJson<double>(json['pricePerKg']),
      totalAmount: serializer.fromJson<double>(json['totalAmount']),
      depositAmount: serializer.fromJson<double>(json['depositAmount']),
      paidAmount: serializer.fromJson<double>(json['paidAmount']),
      remainingAmount: serializer.fromJson<double>(json['remainingAmount']),
      isPaid: serializer.fromJson<bool>(json['isPaid']),
      latitude: serializer.fromJson<double?>(json['latitude']),
      longitude: serializer.fromJson<double?>(json['longitude']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<DateTime>(date),
      'lastModified': serializer.toJson<DateTime>(lastModified),
      'name': serializer.toJson<String>(name),
      'phone': serializer.toJson<String?>(phone),
      'cccd': serializer.toJson<String?>(cccd),
      'fieldAddress': serializer.toJson<String?>(fieldAddress),
      'traderName': serializer.toJson<String>(traderName),
      'riceVariety': serializer.toJson<String>(riceVariety),
      'seasonLabel': serializer.toJson<String>(seasonLabel),
      'totalWeight': serializer.toJson<double>(totalWeight),
      'bagWeight': serializer.toJson<double>(bagWeight),
      'impurityWeight': serializer.toJson<double>(impurityWeight),
      'netWeight': serializer.toJson<double>(netWeight),
      'moisturePercent': serializer.toJson<double>(moisturePercent),
      'bagCount': serializer.toJson<int>(bagCount),
      'bagMethodIsSampling': serializer.toJson<bool>(bagMethodIsSampling),
      'bagSampleCount': serializer.toJson<int>(bagSampleCount),
      'bagSampleTotalWeight': serializer.toJson<double>(bagSampleTotalWeight),
      'bagWeightPerUnit': serializer.toJson<double>(bagWeightPerUnit),
      'impurityIsPercent': serializer.toJson<bool>(impurityIsPercent),
      'impurityFixed': serializer.toJson<double>(impurityFixed),
      'impurityPercent': serializer.toJson<double>(impurityPercent),
      'weightInputMode': serializer.toJson<String>(weightInputMode),
      'pricePerKg': serializer.toJson<double>(pricePerKg),
      'totalAmount': serializer.toJson<double>(totalAmount),
      'depositAmount': serializer.toJson<double>(depositAmount),
      'paidAmount': serializer.toJson<double>(paidAmount),
      'remainingAmount': serializer.toJson<double>(remainingAmount),
      'isPaid': serializer.toJson<bool>(isPaid),
      'latitude': serializer.toJson<double?>(latitude),
      'longitude': serializer.toJson<double?>(longitude),
      'isDeleted': serializer.toJson<bool>(isDeleted),
    };
  }

  RiceCard copyWith(
          {int? id,
          DateTime? date,
          DateTime? lastModified,
          String? name,
          Value<String?> phone = const Value.absent(),
          Value<String?> cccd = const Value.absent(),
          Value<String?> fieldAddress = const Value.absent(),
          String? traderName,
          String? riceVariety,
          String? seasonLabel,
          double? totalWeight,
          double? bagWeight,
          double? impurityWeight,
          double? netWeight,
          double? moisturePercent,
          int? bagCount,
          bool? bagMethodIsSampling,
          int? bagSampleCount,
          double? bagSampleTotalWeight,
          double? bagWeightPerUnit,
          bool? impurityIsPercent,
          double? impurityFixed,
          double? impurityPercent,
          String? weightInputMode,
          double? pricePerKg,
          double? totalAmount,
          double? depositAmount,
          double? paidAmount,
          double? remainingAmount,
          bool? isPaid,
          Value<double?> latitude = const Value.absent(),
          Value<double?> longitude = const Value.absent(),
          bool? isDeleted}) =>
      RiceCard(
        id: id ?? this.id,
        date: date ?? this.date,
        lastModified: lastModified ?? this.lastModified,
        name: name ?? this.name,
        phone: phone.present ? phone.value : this.phone,
        cccd: cccd.present ? cccd.value : this.cccd,
        fieldAddress:
            fieldAddress.present ? fieldAddress.value : this.fieldAddress,
        traderName: traderName ?? this.traderName,
        riceVariety: riceVariety ?? this.riceVariety,
        seasonLabel: seasonLabel ?? this.seasonLabel,
        totalWeight: totalWeight ?? this.totalWeight,
        bagWeight: bagWeight ?? this.bagWeight,
        impurityWeight: impurityWeight ?? this.impurityWeight,
        netWeight: netWeight ?? this.netWeight,
        moisturePercent: moisturePercent ?? this.moisturePercent,
        bagCount: bagCount ?? this.bagCount,
        bagMethodIsSampling: bagMethodIsSampling ?? this.bagMethodIsSampling,
        bagSampleCount: bagSampleCount ?? this.bagSampleCount,
        bagSampleTotalWeight: bagSampleTotalWeight ?? this.bagSampleTotalWeight,
        bagWeightPerUnit: bagWeightPerUnit ?? this.bagWeightPerUnit,
        impurityIsPercent: impurityIsPercent ?? this.impurityIsPercent,
        impurityFixed: impurityFixed ?? this.impurityFixed,
        impurityPercent: impurityPercent ?? this.impurityPercent,
        weightInputMode: weightInputMode ?? this.weightInputMode,
        pricePerKg: pricePerKg ?? this.pricePerKg,
        totalAmount: totalAmount ?? this.totalAmount,
        depositAmount: depositAmount ?? this.depositAmount,
        paidAmount: paidAmount ?? this.paidAmount,
        remainingAmount: remainingAmount ?? this.remainingAmount,
        isPaid: isPaid ?? this.isPaid,
        latitude: latitude.present ? latitude.value : this.latitude,
        longitude: longitude.present ? longitude.value : this.longitude,
        isDeleted: isDeleted ?? this.isDeleted,
      );
  RiceCard copyWithCompanion(CardsCompanion data) {
    return RiceCard(
      id: data.id.present ? data.id.value : this.id,
      date: data.date.present ? data.date.value : this.date,
      lastModified: data.lastModified.present
          ? data.lastModified.value
          : this.lastModified,
      name: data.name.present ? data.name.value : this.name,
      phone: data.phone.present ? data.phone.value : this.phone,
      cccd: data.cccd.present ? data.cccd.value : this.cccd,
      fieldAddress: data.fieldAddress.present
          ? data.fieldAddress.value
          : this.fieldAddress,
      traderName:
          data.traderName.present ? data.traderName.value : this.traderName,
      riceVariety:
          data.riceVariety.present ? data.riceVariety.value : this.riceVariety,
      seasonLabel:
          data.seasonLabel.present ? data.seasonLabel.value : this.seasonLabel,
      totalWeight:
          data.totalWeight.present ? data.totalWeight.value : this.totalWeight,
      bagWeight: data.bagWeight.present ? data.bagWeight.value : this.bagWeight,
      impurityWeight: data.impurityWeight.present
          ? data.impurityWeight.value
          : this.impurityWeight,
      netWeight: data.netWeight.present ? data.netWeight.value : this.netWeight,
      moisturePercent: data.moisturePercent.present
          ? data.moisturePercent.value
          : this.moisturePercent,
      bagCount: data.bagCount.present ? data.bagCount.value : this.bagCount,
      bagMethodIsSampling: data.bagMethodIsSampling.present
          ? data.bagMethodIsSampling.value
          : this.bagMethodIsSampling,
      bagSampleCount: data.bagSampleCount.present
          ? data.bagSampleCount.value
          : this.bagSampleCount,
      bagSampleTotalWeight: data.bagSampleTotalWeight.present
          ? data.bagSampleTotalWeight.value
          : this.bagSampleTotalWeight,
      bagWeightPerUnit: data.bagWeightPerUnit.present
          ? data.bagWeightPerUnit.value
          : this.bagWeightPerUnit,
      impurityIsPercent: data.impurityIsPercent.present
          ? data.impurityIsPercent.value
          : this.impurityIsPercent,
      impurityFixed: data.impurityFixed.present
          ? data.impurityFixed.value
          : this.impurityFixed,
      impurityPercent: data.impurityPercent.present
          ? data.impurityPercent.value
          : this.impurityPercent,
      weightInputMode: data.weightInputMode.present
          ? data.weightInputMode.value
          : this.weightInputMode,
      pricePerKg:
          data.pricePerKg.present ? data.pricePerKg.value : this.pricePerKg,
      totalAmount:
          data.totalAmount.present ? data.totalAmount.value : this.totalAmount,
      depositAmount: data.depositAmount.present
          ? data.depositAmount.value
          : this.depositAmount,
      paidAmount:
          data.paidAmount.present ? data.paidAmount.value : this.paidAmount,
      remainingAmount: data.remainingAmount.present
          ? data.remainingAmount.value
          : this.remainingAmount,
      isPaid: data.isPaid.present ? data.isPaid.value : this.isPaid,
      latitude: data.latitude.present ? data.latitude.value : this.latitude,
      longitude: data.longitude.present ? data.longitude.value : this.longitude,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RiceCard(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('lastModified: $lastModified, ')
          ..write('name: $name, ')
          ..write('phone: $phone, ')
          ..write('cccd: $cccd, ')
          ..write('fieldAddress: $fieldAddress, ')
          ..write('traderName: $traderName, ')
          ..write('riceVariety: $riceVariety, ')
          ..write('seasonLabel: $seasonLabel, ')
          ..write('totalWeight: $totalWeight, ')
          ..write('bagWeight: $bagWeight, ')
          ..write('impurityWeight: $impurityWeight, ')
          ..write('netWeight: $netWeight, ')
          ..write('moisturePercent: $moisturePercent, ')
          ..write('bagCount: $bagCount, ')
          ..write('bagMethodIsSampling: $bagMethodIsSampling, ')
          ..write('bagSampleCount: $bagSampleCount, ')
          ..write('bagSampleTotalWeight: $bagSampleTotalWeight, ')
          ..write('bagWeightPerUnit: $bagWeightPerUnit, ')
          ..write('impurityIsPercent: $impurityIsPercent, ')
          ..write('impurityFixed: $impurityFixed, ')
          ..write('impurityPercent: $impurityPercent, ')
          ..write('weightInputMode: $weightInputMode, ')
          ..write('pricePerKg: $pricePerKg, ')
          ..write('totalAmount: $totalAmount, ')
          ..write('depositAmount: $depositAmount, ')
          ..write('paidAmount: $paidAmount, ')
          ..write('remainingAmount: $remainingAmount, ')
          ..write('isPaid: $isPaid, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('isDeleted: $isDeleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        date,
        lastModified,
        name,
        phone,
        cccd,
        fieldAddress,
        traderName,
        riceVariety,
        seasonLabel,
        totalWeight,
        bagWeight,
        impurityWeight,
        netWeight,
        moisturePercent,
        bagCount,
        bagMethodIsSampling,
        bagSampleCount,
        bagSampleTotalWeight,
        bagWeightPerUnit,
        impurityIsPercent,
        impurityFixed,
        impurityPercent,
        weightInputMode,
        pricePerKg,
        totalAmount,
        depositAmount,
        paidAmount,
        remainingAmount,
        isPaid,
        latitude,
        longitude,
        isDeleted
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RiceCard &&
          other.id == this.id &&
          other.date == this.date &&
          other.lastModified == this.lastModified &&
          other.name == this.name &&
          other.phone == this.phone &&
          other.cccd == this.cccd &&
          other.fieldAddress == this.fieldAddress &&
          other.traderName == this.traderName &&
          other.riceVariety == this.riceVariety &&
          other.seasonLabel == this.seasonLabel &&
          other.totalWeight == this.totalWeight &&
          other.bagWeight == this.bagWeight &&
          other.impurityWeight == this.impurityWeight &&
          other.netWeight == this.netWeight &&
          other.moisturePercent == this.moisturePercent &&
          other.bagCount == this.bagCount &&
          other.bagMethodIsSampling == this.bagMethodIsSampling &&
          other.bagSampleCount == this.bagSampleCount &&
          other.bagSampleTotalWeight == this.bagSampleTotalWeight &&
          other.bagWeightPerUnit == this.bagWeightPerUnit &&
          other.impurityIsPercent == this.impurityIsPercent &&
          other.impurityFixed == this.impurityFixed &&
          other.impurityPercent == this.impurityPercent &&
          other.weightInputMode == this.weightInputMode &&
          other.pricePerKg == this.pricePerKg &&
          other.totalAmount == this.totalAmount &&
          other.depositAmount == this.depositAmount &&
          other.paidAmount == this.paidAmount &&
          other.remainingAmount == this.remainingAmount &&
          other.isPaid == this.isPaid &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude &&
          other.isDeleted == this.isDeleted);
}

class CardsCompanion extends UpdateCompanion<RiceCard> {
  final Value<int> id;
  final Value<DateTime> date;
  final Value<DateTime> lastModified;
  final Value<String> name;
  final Value<String?> phone;
  final Value<String?> cccd;
  final Value<String?> fieldAddress;
  final Value<String> traderName;
  final Value<String> riceVariety;
  final Value<String> seasonLabel;
  final Value<double> totalWeight;
  final Value<double> bagWeight;
  final Value<double> impurityWeight;
  final Value<double> netWeight;
  final Value<double> moisturePercent;
  final Value<int> bagCount;
  final Value<bool> bagMethodIsSampling;
  final Value<int> bagSampleCount;
  final Value<double> bagSampleTotalWeight;
  final Value<double> bagWeightPerUnit;
  final Value<bool> impurityIsPercent;
  final Value<double> impurityFixed;
  final Value<double> impurityPercent;
  final Value<String> weightInputMode;
  final Value<double> pricePerKg;
  final Value<double> totalAmount;
  final Value<double> depositAmount;
  final Value<double> paidAmount;
  final Value<double> remainingAmount;
  final Value<bool> isPaid;
  final Value<double?> latitude;
  final Value<double?> longitude;
  final Value<bool> isDeleted;
  const CardsCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.lastModified = const Value.absent(),
    this.name = const Value.absent(),
    this.phone = const Value.absent(),
    this.cccd = const Value.absent(),
    this.fieldAddress = const Value.absent(),
    this.traderName = const Value.absent(),
    this.riceVariety = const Value.absent(),
    this.seasonLabel = const Value.absent(),
    this.totalWeight = const Value.absent(),
    this.bagWeight = const Value.absent(),
    this.impurityWeight = const Value.absent(),
    this.netWeight = const Value.absent(),
    this.moisturePercent = const Value.absent(),
    this.bagCount = const Value.absent(),
    this.bagMethodIsSampling = const Value.absent(),
    this.bagSampleCount = const Value.absent(),
    this.bagSampleTotalWeight = const Value.absent(),
    this.bagWeightPerUnit = const Value.absent(),
    this.impurityIsPercent = const Value.absent(),
    this.impurityFixed = const Value.absent(),
    this.impurityPercent = const Value.absent(),
    this.weightInputMode = const Value.absent(),
    this.pricePerKg = const Value.absent(),
    this.totalAmount = const Value.absent(),
    this.depositAmount = const Value.absent(),
    this.paidAmount = const Value.absent(),
    this.remainingAmount = const Value.absent(),
    this.isPaid = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.isDeleted = const Value.absent(),
  });
  CardsCompanion.insert({
    this.id = const Value.absent(),
    required DateTime date,
    required DateTime lastModified,
    required String name,
    this.phone = const Value.absent(),
    this.cccd = const Value.absent(),
    this.fieldAddress = const Value.absent(),
    this.traderName = const Value.absent(),
    required String riceVariety,
    required String seasonLabel,
    this.totalWeight = const Value.absent(),
    this.bagWeight = const Value.absent(),
    this.impurityWeight = const Value.absent(),
    this.netWeight = const Value.absent(),
    this.moisturePercent = const Value.absent(),
    this.bagCount = const Value.absent(),
    this.bagMethodIsSampling = const Value.absent(),
    this.bagSampleCount = const Value.absent(),
    this.bagSampleTotalWeight = const Value.absent(),
    this.bagWeightPerUnit = const Value.absent(),
    this.impurityIsPercent = const Value.absent(),
    this.impurityFixed = const Value.absent(),
    this.impurityPercent = const Value.absent(),
    this.weightInputMode = const Value.absent(),
    this.pricePerKg = const Value.absent(),
    this.totalAmount = const Value.absent(),
    this.depositAmount = const Value.absent(),
    this.paidAmount = const Value.absent(),
    this.remainingAmount = const Value.absent(),
    this.isPaid = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.isDeleted = const Value.absent(),
  })  : date = Value(date),
        lastModified = Value(lastModified),
        name = Value(name),
        riceVariety = Value(riceVariety),
        seasonLabel = Value(seasonLabel);
  static Insertable<RiceCard> custom({
    Expression<int>? id,
    Expression<DateTime>? date,
    Expression<DateTime>? lastModified,
    Expression<String>? name,
    Expression<String>? phone,
    Expression<String>? cccd,
    Expression<String>? fieldAddress,
    Expression<String>? traderName,
    Expression<String>? riceVariety,
    Expression<String>? seasonLabel,
    Expression<double>? totalWeight,
    Expression<double>? bagWeight,
    Expression<double>? impurityWeight,
    Expression<double>? netWeight,
    Expression<double>? moisturePercent,
    Expression<int>? bagCount,
    Expression<bool>? bagMethodIsSampling,
    Expression<int>? bagSampleCount,
    Expression<double>? bagSampleTotalWeight,
    Expression<double>? bagWeightPerUnit,
    Expression<bool>? impurityIsPercent,
    Expression<double>? impurityFixed,
    Expression<double>? impurityPercent,
    Expression<String>? weightInputMode,
    Expression<double>? pricePerKg,
    Expression<double>? totalAmount,
    Expression<double>? depositAmount,
    Expression<double>? paidAmount,
    Expression<double>? remainingAmount,
    Expression<bool>? isPaid,
    Expression<double>? latitude,
    Expression<double>? longitude,
    Expression<bool>? isDeleted,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (lastModified != null) 'last_modified': lastModified,
      if (name != null) 'name': name,
      if (phone != null) 'phone': phone,
      if (cccd != null) 'cccd': cccd,
      if (fieldAddress != null) 'field_address': fieldAddress,
      if (traderName != null) 'trader_name': traderName,
      if (riceVariety != null) 'rice_variety': riceVariety,
      if (seasonLabel != null) 'season_label': seasonLabel,
      if (totalWeight != null) 'total_weight': totalWeight,
      if (bagWeight != null) 'bag_weight': bagWeight,
      if (impurityWeight != null) 'impurity_weight': impurityWeight,
      if (netWeight != null) 'net_weight': netWeight,
      if (moisturePercent != null) 'moisture_percent': moisturePercent,
      if (bagCount != null) 'bag_count': bagCount,
      if (bagMethodIsSampling != null)
        'bag_method_is_sampling': bagMethodIsSampling,
      if (bagSampleCount != null) 'bag_sample_count': bagSampleCount,
      if (bagSampleTotalWeight != null)
        'bag_sample_total_weight': bagSampleTotalWeight,
      if (bagWeightPerUnit != null) 'bag_weight_per_unit': bagWeightPerUnit,
      if (impurityIsPercent != null) 'impurity_is_percent': impurityIsPercent,
      if (impurityFixed != null) 'impurity_fixed': impurityFixed,
      if (impurityPercent != null) 'impurity_percent': impurityPercent,
      if (weightInputMode != null) 'weight_input_mode': weightInputMode,
      if (pricePerKg != null) 'price_per_kg': pricePerKg,
      if (totalAmount != null) 'total_amount': totalAmount,
      if (depositAmount != null) 'deposit_amount': depositAmount,
      if (paidAmount != null) 'paid_amount': paidAmount,
      if (remainingAmount != null) 'remaining_amount': remainingAmount,
      if (isPaid != null) 'is_paid': isPaid,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (isDeleted != null) 'is_deleted': isDeleted,
    });
  }

  CardsCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? date,
      Value<DateTime>? lastModified,
      Value<String>? name,
      Value<String?>? phone,
      Value<String?>? cccd,
      Value<String?>? fieldAddress,
      Value<String>? traderName,
      Value<String>? riceVariety,
      Value<String>? seasonLabel,
      Value<double>? totalWeight,
      Value<double>? bagWeight,
      Value<double>? impurityWeight,
      Value<double>? netWeight,
      Value<double>? moisturePercent,
      Value<int>? bagCount,
      Value<bool>? bagMethodIsSampling,
      Value<int>? bagSampleCount,
      Value<double>? bagSampleTotalWeight,
      Value<double>? bagWeightPerUnit,
      Value<bool>? impurityIsPercent,
      Value<double>? impurityFixed,
      Value<double>? impurityPercent,
      Value<String>? weightInputMode,
      Value<double>? pricePerKg,
      Value<double>? totalAmount,
      Value<double>? depositAmount,
      Value<double>? paidAmount,
      Value<double>? remainingAmount,
      Value<bool>? isPaid,
      Value<double?>? latitude,
      Value<double?>? longitude,
      Value<bool>? isDeleted}) {
    return CardsCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      lastModified: lastModified ?? this.lastModified,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      cccd: cccd ?? this.cccd,
      fieldAddress: fieldAddress ?? this.fieldAddress,
      traderName: traderName ?? this.traderName,
      riceVariety: riceVariety ?? this.riceVariety,
      seasonLabel: seasonLabel ?? this.seasonLabel,
      totalWeight: totalWeight ?? this.totalWeight,
      bagWeight: bagWeight ?? this.bagWeight,
      impurityWeight: impurityWeight ?? this.impurityWeight,
      netWeight: netWeight ?? this.netWeight,
      moisturePercent: moisturePercent ?? this.moisturePercent,
      bagCount: bagCount ?? this.bagCount,
      bagMethodIsSampling: bagMethodIsSampling ?? this.bagMethodIsSampling,
      bagSampleCount: bagSampleCount ?? this.bagSampleCount,
      bagSampleTotalWeight: bagSampleTotalWeight ?? this.bagSampleTotalWeight,
      bagWeightPerUnit: bagWeightPerUnit ?? this.bagWeightPerUnit,
      impurityIsPercent: impurityIsPercent ?? this.impurityIsPercent,
      impurityFixed: impurityFixed ?? this.impurityFixed,
      impurityPercent: impurityPercent ?? this.impurityPercent,
      weightInputMode: weightInputMode ?? this.weightInputMode,
      pricePerKg: pricePerKg ?? this.pricePerKg,
      totalAmount: totalAmount ?? this.totalAmount,
      depositAmount: depositAmount ?? this.depositAmount,
      paidAmount: paidAmount ?? this.paidAmount,
      remainingAmount: remainingAmount ?? this.remainingAmount,
      isPaid: isPaid ?? this.isPaid,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (lastModified.present) {
      map['last_modified'] = Variable<DateTime>(lastModified.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (cccd.present) {
      map['cccd'] = Variable<String>(cccd.value);
    }
    if (fieldAddress.present) {
      map['field_address'] = Variable<String>(fieldAddress.value);
    }
    if (traderName.present) {
      map['trader_name'] = Variable<String>(traderName.value);
    }
    if (riceVariety.present) {
      map['rice_variety'] = Variable<String>(riceVariety.value);
    }
    if (seasonLabel.present) {
      map['season_label'] = Variable<String>(seasonLabel.value);
    }
    if (totalWeight.present) {
      map['total_weight'] = Variable<double>(totalWeight.value);
    }
    if (bagWeight.present) {
      map['bag_weight'] = Variable<double>(bagWeight.value);
    }
    if (impurityWeight.present) {
      map['impurity_weight'] = Variable<double>(impurityWeight.value);
    }
    if (netWeight.present) {
      map['net_weight'] = Variable<double>(netWeight.value);
    }
    if (moisturePercent.present) {
      map['moisture_percent'] = Variable<double>(moisturePercent.value);
    }
    if (bagCount.present) {
      map['bag_count'] = Variable<int>(bagCount.value);
    }
    if (bagMethodIsSampling.present) {
      map['bag_method_is_sampling'] = Variable<bool>(bagMethodIsSampling.value);
    }
    if (bagSampleCount.present) {
      map['bag_sample_count'] = Variable<int>(bagSampleCount.value);
    }
    if (bagSampleTotalWeight.present) {
      map['bag_sample_total_weight'] =
          Variable<double>(bagSampleTotalWeight.value);
    }
    if (bagWeightPerUnit.present) {
      map['bag_weight_per_unit'] = Variable<double>(bagWeightPerUnit.value);
    }
    if (impurityIsPercent.present) {
      map['impurity_is_percent'] = Variable<bool>(impurityIsPercent.value);
    }
    if (impurityFixed.present) {
      map['impurity_fixed'] = Variable<double>(impurityFixed.value);
    }
    if (impurityPercent.present) {
      map['impurity_percent'] = Variable<double>(impurityPercent.value);
    }
    if (weightInputMode.present) {
      map['weight_input_mode'] = Variable<String>(weightInputMode.value);
    }
    if (pricePerKg.present) {
      map['price_per_kg'] = Variable<double>(pricePerKg.value);
    }
    if (totalAmount.present) {
      map['total_amount'] = Variable<double>(totalAmount.value);
    }
    if (depositAmount.present) {
      map['deposit_amount'] = Variable<double>(depositAmount.value);
    }
    if (paidAmount.present) {
      map['paid_amount'] = Variable<double>(paidAmount.value);
    }
    if (remainingAmount.present) {
      map['remaining_amount'] = Variable<double>(remainingAmount.value);
    }
    if (isPaid.present) {
      map['is_paid'] = Variable<bool>(isPaid.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<double>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<double>(longitude.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CardsCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('lastModified: $lastModified, ')
          ..write('name: $name, ')
          ..write('phone: $phone, ')
          ..write('cccd: $cccd, ')
          ..write('fieldAddress: $fieldAddress, ')
          ..write('traderName: $traderName, ')
          ..write('riceVariety: $riceVariety, ')
          ..write('seasonLabel: $seasonLabel, ')
          ..write('totalWeight: $totalWeight, ')
          ..write('bagWeight: $bagWeight, ')
          ..write('impurityWeight: $impurityWeight, ')
          ..write('netWeight: $netWeight, ')
          ..write('moisturePercent: $moisturePercent, ')
          ..write('bagCount: $bagCount, ')
          ..write('bagMethodIsSampling: $bagMethodIsSampling, ')
          ..write('bagSampleCount: $bagSampleCount, ')
          ..write('bagSampleTotalWeight: $bagSampleTotalWeight, ')
          ..write('bagWeightPerUnit: $bagWeightPerUnit, ')
          ..write('impurityIsPercent: $impurityIsPercent, ')
          ..write('impurityFixed: $impurityFixed, ')
          ..write('impurityPercent: $impurityPercent, ')
          ..write('weightInputMode: $weightInputMode, ')
          ..write('pricePerKg: $pricePerKg, ')
          ..write('totalAmount: $totalAmount, ')
          ..write('depositAmount: $depositAmount, ')
          ..write('paidAmount: $paidAmount, ')
          ..write('remainingAmount: $remainingAmount, ')
          ..write('isPaid: $isPaid, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('isDeleted: $isDeleted')
          ..write(')'))
        .toString();
  }
}

class $WeightEntriesTable extends WeightEntries
    with TableInfo<$WeightEntriesTable, WeightEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WeightEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _cardIdMeta = const VerificationMeta('cardId');
  @override
  late final GeneratedColumn<int> cardId = GeneratedColumn<int>(
      'card_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES cards (id) ON DELETE CASCADE'));
  static const VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<double> weight = GeneratedColumn<double>(
      'weight', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _bagWeightMeta =
      const VerificationMeta('bagWeight');
  @override
  late final GeneratedColumn<double> bagWeight = GeneratedColumn<double>(
      'bag_weight', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _impurityWeightMeta =
      const VerificationMeta('impurityWeight');
  @override
  late final GeneratedColumn<double> impurityWeight = GeneratedColumn<double>(
      'impurity_weight', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _netWeightMeta =
      const VerificationMeta('netWeight');
  @override
  late final GeneratedColumn<double> netWeight = GeneratedColumn<double>(
      'net_weight', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _timestampMeta =
      const VerificationMeta('timestamp');
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
      'timestamp', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, cardId, weight, bagWeight, impurityWeight, netWeight, timestamp];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'weight_entries';
  @override
  VerificationContext validateIntegrity(Insertable<WeightEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('card_id')) {
      context.handle(_cardIdMeta,
          cardId.isAcceptableOrUnknown(data['card_id']!, _cardIdMeta));
    } else if (isInserting) {
      context.missing(_cardIdMeta);
    }
    if (data.containsKey('weight')) {
      context.handle(_weightMeta,
          weight.isAcceptableOrUnknown(data['weight']!, _weightMeta));
    } else if (isInserting) {
      context.missing(_weightMeta);
    }
    if (data.containsKey('bag_weight')) {
      context.handle(_bagWeightMeta,
          bagWeight.isAcceptableOrUnknown(data['bag_weight']!, _bagWeightMeta));
    }
    if (data.containsKey('impurity_weight')) {
      context.handle(
          _impurityWeightMeta,
          impurityWeight.isAcceptableOrUnknown(
              data['impurity_weight']!, _impurityWeightMeta));
    }
    if (data.containsKey('net_weight')) {
      context.handle(_netWeightMeta,
          netWeight.isAcceptableOrUnknown(data['net_weight']!, _netWeightMeta));
    }
    if (data.containsKey('timestamp')) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta));
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WeightEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WeightEntry(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      cardId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}card_id'])!,
      weight: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}weight'])!,
      bagWeight: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}bag_weight'])!,
      impurityWeight: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}impurity_weight'])!,
      netWeight: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}net_weight'])!,
      timestamp: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}timestamp'])!,
    );
  }

  @override
  $WeightEntriesTable createAlias(String alias) {
    return $WeightEntriesTable(attachedDatabase, alias);
  }
}

class WeightEntry extends DataClass implements Insertable<WeightEntry> {
  final int id;
  final int cardId;
  final double weight;
  final double bagWeight;
  final double impurityWeight;
  final double netWeight;
  final DateTime timestamp;
  const WeightEntry(
      {required this.id,
      required this.cardId,
      required this.weight,
      required this.bagWeight,
      required this.impurityWeight,
      required this.netWeight,
      required this.timestamp});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['card_id'] = Variable<int>(cardId);
    map['weight'] = Variable<double>(weight);
    map['bag_weight'] = Variable<double>(bagWeight);
    map['impurity_weight'] = Variable<double>(impurityWeight);
    map['net_weight'] = Variable<double>(netWeight);
    map['timestamp'] = Variable<DateTime>(timestamp);
    return map;
  }

  WeightEntriesCompanion toCompanion(bool nullToAbsent) {
    return WeightEntriesCompanion(
      id: Value(id),
      cardId: Value(cardId),
      weight: Value(weight),
      bagWeight: Value(bagWeight),
      impurityWeight: Value(impurityWeight),
      netWeight: Value(netWeight),
      timestamp: Value(timestamp),
    );
  }

  factory WeightEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WeightEntry(
      id: serializer.fromJson<int>(json['id']),
      cardId: serializer.fromJson<int>(json['cardId']),
      weight: serializer.fromJson<double>(json['weight']),
      bagWeight: serializer.fromJson<double>(json['bagWeight']),
      impurityWeight: serializer.fromJson<double>(json['impurityWeight']),
      netWeight: serializer.fromJson<double>(json['netWeight']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'cardId': serializer.toJson<int>(cardId),
      'weight': serializer.toJson<double>(weight),
      'bagWeight': serializer.toJson<double>(bagWeight),
      'impurityWeight': serializer.toJson<double>(impurityWeight),
      'netWeight': serializer.toJson<double>(netWeight),
      'timestamp': serializer.toJson<DateTime>(timestamp),
    };
  }

  WeightEntry copyWith(
          {int? id,
          int? cardId,
          double? weight,
          double? bagWeight,
          double? impurityWeight,
          double? netWeight,
          DateTime? timestamp}) =>
      WeightEntry(
        id: id ?? this.id,
        cardId: cardId ?? this.cardId,
        weight: weight ?? this.weight,
        bagWeight: bagWeight ?? this.bagWeight,
        impurityWeight: impurityWeight ?? this.impurityWeight,
        netWeight: netWeight ?? this.netWeight,
        timestamp: timestamp ?? this.timestamp,
      );
  WeightEntry copyWithCompanion(WeightEntriesCompanion data) {
    return WeightEntry(
      id: data.id.present ? data.id.value : this.id,
      cardId: data.cardId.present ? data.cardId.value : this.cardId,
      weight: data.weight.present ? data.weight.value : this.weight,
      bagWeight: data.bagWeight.present ? data.bagWeight.value : this.bagWeight,
      impurityWeight: data.impurityWeight.present
          ? data.impurityWeight.value
          : this.impurityWeight,
      netWeight: data.netWeight.present ? data.netWeight.value : this.netWeight,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WeightEntry(')
          ..write('id: $id, ')
          ..write('cardId: $cardId, ')
          ..write('weight: $weight, ')
          ..write('bagWeight: $bagWeight, ')
          ..write('impurityWeight: $impurityWeight, ')
          ..write('netWeight: $netWeight, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, cardId, weight, bagWeight, impurityWeight, netWeight, timestamp);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WeightEntry &&
          other.id == this.id &&
          other.cardId == this.cardId &&
          other.weight == this.weight &&
          other.bagWeight == this.bagWeight &&
          other.impurityWeight == this.impurityWeight &&
          other.netWeight == this.netWeight &&
          other.timestamp == this.timestamp);
}

class WeightEntriesCompanion extends UpdateCompanion<WeightEntry> {
  final Value<int> id;
  final Value<int> cardId;
  final Value<double> weight;
  final Value<double> bagWeight;
  final Value<double> impurityWeight;
  final Value<double> netWeight;
  final Value<DateTime> timestamp;
  const WeightEntriesCompanion({
    this.id = const Value.absent(),
    this.cardId = const Value.absent(),
    this.weight = const Value.absent(),
    this.bagWeight = const Value.absent(),
    this.impurityWeight = const Value.absent(),
    this.netWeight = const Value.absent(),
    this.timestamp = const Value.absent(),
  });
  WeightEntriesCompanion.insert({
    this.id = const Value.absent(),
    required int cardId,
    required double weight,
    this.bagWeight = const Value.absent(),
    this.impurityWeight = const Value.absent(),
    this.netWeight = const Value.absent(),
    required DateTime timestamp,
  })  : cardId = Value(cardId),
        weight = Value(weight),
        timestamp = Value(timestamp);
  static Insertable<WeightEntry> custom({
    Expression<int>? id,
    Expression<int>? cardId,
    Expression<double>? weight,
    Expression<double>? bagWeight,
    Expression<double>? impurityWeight,
    Expression<double>? netWeight,
    Expression<DateTime>? timestamp,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (cardId != null) 'card_id': cardId,
      if (weight != null) 'weight': weight,
      if (bagWeight != null) 'bag_weight': bagWeight,
      if (impurityWeight != null) 'impurity_weight': impurityWeight,
      if (netWeight != null) 'net_weight': netWeight,
      if (timestamp != null) 'timestamp': timestamp,
    });
  }

  WeightEntriesCompanion copyWith(
      {Value<int>? id,
      Value<int>? cardId,
      Value<double>? weight,
      Value<double>? bagWeight,
      Value<double>? impurityWeight,
      Value<double>? netWeight,
      Value<DateTime>? timestamp}) {
    return WeightEntriesCompanion(
      id: id ?? this.id,
      cardId: cardId ?? this.cardId,
      weight: weight ?? this.weight,
      bagWeight: bagWeight ?? this.bagWeight,
      impurityWeight: impurityWeight ?? this.impurityWeight,
      netWeight: netWeight ?? this.netWeight,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (cardId.present) {
      map['card_id'] = Variable<int>(cardId.value);
    }
    if (weight.present) {
      map['weight'] = Variable<double>(weight.value);
    }
    if (bagWeight.present) {
      map['bag_weight'] = Variable<double>(bagWeight.value);
    }
    if (impurityWeight.present) {
      map['impurity_weight'] = Variable<double>(impurityWeight.value);
    }
    if (netWeight.present) {
      map['net_weight'] = Variable<double>(netWeight.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WeightEntriesCompanion(')
          ..write('id: $id, ')
          ..write('cardId: $cardId, ')
          ..write('weight: $weight, ')
          ..write('bagWeight: $bagWeight, ')
          ..write('impurityWeight: $impurityWeight, ')
          ..write('netWeight: $netWeight, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }
}

class $TransactionsTable extends Transactions
    with TableInfo<$TransactionsTable, Transaction> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TransactionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _cardIdMeta = const VerificationMeta('cardId');
  @override
  late final GeneratedColumn<int> cardId = GeneratedColumn<int>(
      'card_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES cards (id) ON DELETE CASCADE'));
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
      'amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, cardId, amount, type, description, date];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'transactions';
  @override
  VerificationContext validateIntegrity(Insertable<Transaction> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('card_id')) {
      context.handle(_cardIdMeta,
          cardId.isAcceptableOrUnknown(data['card_id']!, _cardIdMeta));
    } else if (isInserting) {
      context.missing(_cardIdMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Transaction map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Transaction(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      cardId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}card_id'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
    );
  }

  @override
  $TransactionsTable createAlias(String alias) {
    return $TransactionsTable(attachedDatabase, alias);
  }
}

class Transaction extends DataClass implements Insertable<Transaction> {
  final int id;
  final int cardId;
  final double amount;
  final String type;
  final String? description;
  final DateTime date;
  const Transaction(
      {required this.id,
      required this.cardId,
      required this.amount,
      required this.type,
      this.description,
      required this.date});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['card_id'] = Variable<int>(cardId);
    map['amount'] = Variable<double>(amount);
    map['type'] = Variable<String>(type);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['date'] = Variable<DateTime>(date);
    return map;
  }

  TransactionsCompanion toCompanion(bool nullToAbsent) {
    return TransactionsCompanion(
      id: Value(id),
      cardId: Value(cardId),
      amount: Value(amount),
      type: Value(type),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      date: Value(date),
    );
  }

  factory Transaction.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Transaction(
      id: serializer.fromJson<int>(json['id']),
      cardId: serializer.fromJson<int>(json['cardId']),
      amount: serializer.fromJson<double>(json['amount']),
      type: serializer.fromJson<String>(json['type']),
      description: serializer.fromJson<String?>(json['description']),
      date: serializer.fromJson<DateTime>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'cardId': serializer.toJson<int>(cardId),
      'amount': serializer.toJson<double>(amount),
      'type': serializer.toJson<String>(type),
      'description': serializer.toJson<String?>(description),
      'date': serializer.toJson<DateTime>(date),
    };
  }

  Transaction copyWith(
          {int? id,
          int? cardId,
          double? amount,
          String? type,
          Value<String?> description = const Value.absent(),
          DateTime? date}) =>
      Transaction(
        id: id ?? this.id,
        cardId: cardId ?? this.cardId,
        amount: amount ?? this.amount,
        type: type ?? this.type,
        description: description.present ? description.value : this.description,
        date: date ?? this.date,
      );
  Transaction copyWithCompanion(TransactionsCompanion data) {
    return Transaction(
      id: data.id.present ? data.id.value : this.id,
      cardId: data.cardId.present ? data.cardId.value : this.cardId,
      amount: data.amount.present ? data.amount.value : this.amount,
      type: data.type.present ? data.type.value : this.type,
      description:
          data.description.present ? data.description.value : this.description,
      date: data.date.present ? data.date.value : this.date,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Transaction(')
          ..write('id: $id, ')
          ..write('cardId: $cardId, ')
          ..write('amount: $amount, ')
          ..write('type: $type, ')
          ..write('description: $description, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, cardId, amount, type, description, date);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Transaction &&
          other.id == this.id &&
          other.cardId == this.cardId &&
          other.amount == this.amount &&
          other.type == this.type &&
          other.description == this.description &&
          other.date == this.date);
}

class TransactionsCompanion extends UpdateCompanion<Transaction> {
  final Value<int> id;
  final Value<int> cardId;
  final Value<double> amount;
  final Value<String> type;
  final Value<String?> description;
  final Value<DateTime> date;
  const TransactionsCompanion({
    this.id = const Value.absent(),
    this.cardId = const Value.absent(),
    this.amount = const Value.absent(),
    this.type = const Value.absent(),
    this.description = const Value.absent(),
    this.date = const Value.absent(),
  });
  TransactionsCompanion.insert({
    this.id = const Value.absent(),
    required int cardId,
    required double amount,
    required String type,
    this.description = const Value.absent(),
    required DateTime date,
  })  : cardId = Value(cardId),
        amount = Value(amount),
        type = Value(type),
        date = Value(date);
  static Insertable<Transaction> custom({
    Expression<int>? id,
    Expression<int>? cardId,
    Expression<double>? amount,
    Expression<String>? type,
    Expression<String>? description,
    Expression<DateTime>? date,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (cardId != null) 'card_id': cardId,
      if (amount != null) 'amount': amount,
      if (type != null) 'type': type,
      if (description != null) 'description': description,
      if (date != null) 'date': date,
    });
  }

  TransactionsCompanion copyWith(
      {Value<int>? id,
      Value<int>? cardId,
      Value<double>? amount,
      Value<String>? type,
      Value<String?>? description,
      Value<DateTime>? date}) {
    return TransactionsCompanion(
      id: id ?? this.id,
      cardId: cardId ?? this.cardId,
      amount: amount ?? this.amount,
      type: type ?? this.type,
      description: description ?? this.description,
      date: date ?? this.date,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (cardId.present) {
      map['card_id'] = Variable<int>(cardId.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionsCompanion(')
          ..write('id: $id, ')
          ..write('cardId: $cardId, ')
          ..write('amount: $amount, ')
          ..write('type: $type, ')
          ..write('description: $description, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }
}

class $RicePricesTable extends RicePrices
    with TableInfo<$RicePricesTable, RicePrice> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RicePricesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _varietyMeta =
      const VerificationMeta('variety');
  @override
  late final GeneratedColumn<String> variety = GeneratedColumn<String>(
      'variety', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _priceMinMeta =
      const VerificationMeta('priceMin');
  @override
  late final GeneratedColumn<double> priceMin = GeneratedColumn<double>(
      'price_min', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _priceMaxMeta =
      const VerificationMeta('priceMax');
  @override
  late final GeneratedColumn<double> priceMax = GeneratedColumn<double>(
      'price_max', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _priceAvg7dMeta =
      const VerificationMeta('priceAvg7d');
  @override
  late final GeneratedColumn<double> priceAvg7d = GeneratedColumn<double>(
      'price_avg7d', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _regionMeta = const VerificationMeta('region');
  @override
  late final GeneratedColumn<String> region = GeneratedColumn<String>(
      'region', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _trendMeta = const VerificationMeta('trend');
  @override
  late final GeneratedColumn<String> trend = GeneratedColumn<String>(
      'trend', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _riceTypeMeta =
      const VerificationMeta('riceType');
  @override
  late final GeneratedColumn<String> riceType = GeneratedColumn<String>(
      'rice_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<String> source = GeneratedColumn<String>(
      'source', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        variety,
        priceMin,
        priceMax,
        priceAvg7d,
        region,
        updatedAt,
        trend,
        riceType,
        source
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'rice_prices';
  @override
  VerificationContext validateIntegrity(Insertable<RicePrice> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('variety')) {
      context.handle(_varietyMeta,
          variety.isAcceptableOrUnknown(data['variety']!, _varietyMeta));
    } else if (isInserting) {
      context.missing(_varietyMeta);
    }
    if (data.containsKey('price_min')) {
      context.handle(_priceMinMeta,
          priceMin.isAcceptableOrUnknown(data['price_min']!, _priceMinMeta));
    } else if (isInserting) {
      context.missing(_priceMinMeta);
    }
    if (data.containsKey('price_max')) {
      context.handle(_priceMaxMeta,
          priceMax.isAcceptableOrUnknown(data['price_max']!, _priceMaxMeta));
    } else if (isInserting) {
      context.missing(_priceMaxMeta);
    }
    if (data.containsKey('price_avg7d')) {
      context.handle(
          _priceAvg7dMeta,
          priceAvg7d.isAcceptableOrUnknown(
              data['price_avg7d']!, _priceAvg7dMeta));
    } else if (isInserting) {
      context.missing(_priceAvg7dMeta);
    }
    if (data.containsKey('region')) {
      context.handle(_regionMeta,
          region.isAcceptableOrUnknown(data['region']!, _regionMeta));
    } else if (isInserting) {
      context.missing(_regionMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('trend')) {
      context.handle(
          _trendMeta, trend.isAcceptableOrUnknown(data['trend']!, _trendMeta));
    } else if (isInserting) {
      context.missing(_trendMeta);
    }
    if (data.containsKey('rice_type')) {
      context.handle(_riceTypeMeta,
          riceType.isAcceptableOrUnknown(data['rice_type']!, _riceTypeMeta));
    } else if (isInserting) {
      context.missing(_riceTypeMeta);
    }
    if (data.containsKey('source')) {
      context.handle(_sourceMeta,
          source.isAcceptableOrUnknown(data['source']!, _sourceMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RicePrice map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RicePrice(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      variety: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}variety'])!,
      priceMin: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}price_min'])!,
      priceMax: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}price_max'])!,
      priceAvg7d: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}price_avg7d'])!,
      region: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}region'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      trend: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}trend'])!,
      riceType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}rice_type'])!,
      source: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}source']),
    );
  }

  @override
  $RicePricesTable createAlias(String alias) {
    return $RicePricesTable(attachedDatabase, alias);
  }
}

class RicePrice extends DataClass implements Insertable<RicePrice> {
  final String id;
  final String variety;
  final double priceMin;
  final double priceMax;
  final double priceAvg7d;
  final String region;
  final DateTime updatedAt;
  final String trend;
  final String riceType;
  final String? source;
  const RicePrice(
      {required this.id,
      required this.variety,
      required this.priceMin,
      required this.priceMax,
      required this.priceAvg7d,
      required this.region,
      required this.updatedAt,
      required this.trend,
      required this.riceType,
      this.source});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['variety'] = Variable<String>(variety);
    map['price_min'] = Variable<double>(priceMin);
    map['price_max'] = Variable<double>(priceMax);
    map['price_avg7d'] = Variable<double>(priceAvg7d);
    map['region'] = Variable<String>(region);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['trend'] = Variable<String>(trend);
    map['rice_type'] = Variable<String>(riceType);
    if (!nullToAbsent || source != null) {
      map['source'] = Variable<String>(source);
    }
    return map;
  }

  RicePricesCompanion toCompanion(bool nullToAbsent) {
    return RicePricesCompanion(
      id: Value(id),
      variety: Value(variety),
      priceMin: Value(priceMin),
      priceMax: Value(priceMax),
      priceAvg7d: Value(priceAvg7d),
      region: Value(region),
      updatedAt: Value(updatedAt),
      trend: Value(trend),
      riceType: Value(riceType),
      source:
          source == null && nullToAbsent ? const Value.absent() : Value(source),
    );
  }

  factory RicePrice.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RicePrice(
      id: serializer.fromJson<String>(json['id']),
      variety: serializer.fromJson<String>(json['variety']),
      priceMin: serializer.fromJson<double>(json['priceMin']),
      priceMax: serializer.fromJson<double>(json['priceMax']),
      priceAvg7d: serializer.fromJson<double>(json['priceAvg7d']),
      region: serializer.fromJson<String>(json['region']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      trend: serializer.fromJson<String>(json['trend']),
      riceType: serializer.fromJson<String>(json['riceType']),
      source: serializer.fromJson<String?>(json['source']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'variety': serializer.toJson<String>(variety),
      'priceMin': serializer.toJson<double>(priceMin),
      'priceMax': serializer.toJson<double>(priceMax),
      'priceAvg7d': serializer.toJson<double>(priceAvg7d),
      'region': serializer.toJson<String>(region),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'trend': serializer.toJson<String>(trend),
      'riceType': serializer.toJson<String>(riceType),
      'source': serializer.toJson<String?>(source),
    };
  }

  RicePrice copyWith(
          {String? id,
          String? variety,
          double? priceMin,
          double? priceMax,
          double? priceAvg7d,
          String? region,
          DateTime? updatedAt,
          String? trend,
          String? riceType,
          Value<String?> source = const Value.absent()}) =>
      RicePrice(
        id: id ?? this.id,
        variety: variety ?? this.variety,
        priceMin: priceMin ?? this.priceMin,
        priceMax: priceMax ?? this.priceMax,
        priceAvg7d: priceAvg7d ?? this.priceAvg7d,
        region: region ?? this.region,
        updatedAt: updatedAt ?? this.updatedAt,
        trend: trend ?? this.trend,
        riceType: riceType ?? this.riceType,
        source: source.present ? source.value : this.source,
      );
  RicePrice copyWithCompanion(RicePricesCompanion data) {
    return RicePrice(
      id: data.id.present ? data.id.value : this.id,
      variety: data.variety.present ? data.variety.value : this.variety,
      priceMin: data.priceMin.present ? data.priceMin.value : this.priceMin,
      priceMax: data.priceMax.present ? data.priceMax.value : this.priceMax,
      priceAvg7d:
          data.priceAvg7d.present ? data.priceAvg7d.value : this.priceAvg7d,
      region: data.region.present ? data.region.value : this.region,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      trend: data.trend.present ? data.trend.value : this.trend,
      riceType: data.riceType.present ? data.riceType.value : this.riceType,
      source: data.source.present ? data.source.value : this.source,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RicePrice(')
          ..write('id: $id, ')
          ..write('variety: $variety, ')
          ..write('priceMin: $priceMin, ')
          ..write('priceMax: $priceMax, ')
          ..write('priceAvg7d: $priceAvg7d, ')
          ..write('region: $region, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('trend: $trend, ')
          ..write('riceType: $riceType, ')
          ..write('source: $source')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, variety, priceMin, priceMax, priceAvg7d,
      region, updatedAt, trend, riceType, source);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RicePrice &&
          other.id == this.id &&
          other.variety == this.variety &&
          other.priceMin == this.priceMin &&
          other.priceMax == this.priceMax &&
          other.priceAvg7d == this.priceAvg7d &&
          other.region == this.region &&
          other.updatedAt == this.updatedAt &&
          other.trend == this.trend &&
          other.riceType == this.riceType &&
          other.source == this.source);
}

class RicePricesCompanion extends UpdateCompanion<RicePrice> {
  final Value<String> id;
  final Value<String> variety;
  final Value<double> priceMin;
  final Value<double> priceMax;
  final Value<double> priceAvg7d;
  final Value<String> region;
  final Value<DateTime> updatedAt;
  final Value<String> trend;
  final Value<String> riceType;
  final Value<String?> source;
  final Value<int> rowid;
  const RicePricesCompanion({
    this.id = const Value.absent(),
    this.variety = const Value.absent(),
    this.priceMin = const Value.absent(),
    this.priceMax = const Value.absent(),
    this.priceAvg7d = const Value.absent(),
    this.region = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.trend = const Value.absent(),
    this.riceType = const Value.absent(),
    this.source = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RicePricesCompanion.insert({
    required String id,
    required String variety,
    required double priceMin,
    required double priceMax,
    required double priceAvg7d,
    required String region,
    required DateTime updatedAt,
    required String trend,
    required String riceType,
    this.source = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        variety = Value(variety),
        priceMin = Value(priceMin),
        priceMax = Value(priceMax),
        priceAvg7d = Value(priceAvg7d),
        region = Value(region),
        updatedAt = Value(updatedAt),
        trend = Value(trend),
        riceType = Value(riceType);
  static Insertable<RicePrice> custom({
    Expression<String>? id,
    Expression<String>? variety,
    Expression<double>? priceMin,
    Expression<double>? priceMax,
    Expression<double>? priceAvg7d,
    Expression<String>? region,
    Expression<DateTime>? updatedAt,
    Expression<String>? trend,
    Expression<String>? riceType,
    Expression<String>? source,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (variety != null) 'variety': variety,
      if (priceMin != null) 'price_min': priceMin,
      if (priceMax != null) 'price_max': priceMax,
      if (priceAvg7d != null) 'price_avg7d': priceAvg7d,
      if (region != null) 'region': region,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (trend != null) 'trend': trend,
      if (riceType != null) 'rice_type': riceType,
      if (source != null) 'source': source,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RicePricesCompanion copyWith(
      {Value<String>? id,
      Value<String>? variety,
      Value<double>? priceMin,
      Value<double>? priceMax,
      Value<double>? priceAvg7d,
      Value<String>? region,
      Value<DateTime>? updatedAt,
      Value<String>? trend,
      Value<String>? riceType,
      Value<String?>? source,
      Value<int>? rowid}) {
    return RicePricesCompanion(
      id: id ?? this.id,
      variety: variety ?? this.variety,
      priceMin: priceMin ?? this.priceMin,
      priceMax: priceMax ?? this.priceMax,
      priceAvg7d: priceAvg7d ?? this.priceAvg7d,
      region: region ?? this.region,
      updatedAt: updatedAt ?? this.updatedAt,
      trend: trend ?? this.trend,
      riceType: riceType ?? this.riceType,
      source: source ?? this.source,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (variety.present) {
      map['variety'] = Variable<String>(variety.value);
    }
    if (priceMin.present) {
      map['price_min'] = Variable<double>(priceMin.value);
    }
    if (priceMax.present) {
      map['price_max'] = Variable<double>(priceMax.value);
    }
    if (priceAvg7d.present) {
      map['price_avg7d'] = Variable<double>(priceAvg7d.value);
    }
    if (region.present) {
      map['region'] = Variable<String>(region.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (trend.present) {
      map['trend'] = Variable<String>(trend.value);
    }
    if (riceType.present) {
      map['rice_type'] = Variable<String>(riceType.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RicePricesCompanion(')
          ..write('id: $id, ')
          ..write('variety: $variety, ')
          ..write('priceMin: $priceMin, ')
          ..write('priceMax: $priceMax, ')
          ..write('priceAvg7d: $priceAvg7d, ')
          ..write('region: $region, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('trend: $trend, ')
          ..write('riceType: $riceType, ')
          ..write('source: $source, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $NewsArticlesTable extends NewsArticles
    with TableInfo<$NewsArticlesTable, NewsArticle> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NewsArticlesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
      'url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _imageUrlMeta =
      const VerificationMeta('imageUrl');
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
      'image_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _sourceNameMeta =
      const VerificationMeta('sourceName');
  @override
  late final GeneratedColumn<String> sourceName = GeneratedColumn<String>(
      'source_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _publishedAtMeta =
      const VerificationMeta('publishedAt');
  @override
  late final GeneratedColumn<DateTime> publishedAt = GeneratedColumn<DateTime>(
      'published_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _cachedAtMeta =
      const VerificationMeta('cachedAt');
  @override
  late final GeneratedColumn<DateTime> cachedAt = GeneratedColumn<DateTime>(
      'cached_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        description,
        url,
        imageUrl,
        sourceName,
        publishedAt,
        cachedAt,
        category
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'news_articles';
  @override
  VerificationContext validateIntegrity(Insertable<NewsArticle> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('url')) {
      context.handle(
          _urlMeta, url.isAcceptableOrUnknown(data['url']!, _urlMeta));
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    if (data.containsKey('image_url')) {
      context.handle(_imageUrlMeta,
          imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta));
    }
    if (data.containsKey('source_name')) {
      context.handle(
          _sourceNameMeta,
          sourceName.isAcceptableOrUnknown(
              data['source_name']!, _sourceNameMeta));
    } else if (isInserting) {
      context.missing(_sourceNameMeta);
    }
    if (data.containsKey('published_at')) {
      context.handle(
          _publishedAtMeta,
          publishedAt.isAcceptableOrUnknown(
              data['published_at']!, _publishedAtMeta));
    } else if (isInserting) {
      context.missing(_publishedAtMeta);
    }
    if (data.containsKey('cached_at')) {
      context.handle(_cachedAtMeta,
          cachedAt.isAcceptableOrUnknown(data['cached_at']!, _cachedAtMeta));
    } else if (isInserting) {
      context.missing(_cachedAtMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NewsArticle map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NewsArticle(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      url: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}url'])!,
      imageUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_url']),
      sourceName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}source_name'])!,
      publishedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}published_at'])!,
      cachedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}cached_at'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category'])!,
    );
  }

  @override
  $NewsArticlesTable createAlias(String alias) {
    return $NewsArticlesTable(attachedDatabase, alias);
  }
}

class NewsArticle extends DataClass implements Insertable<NewsArticle> {
  final String id;
  final String title;
  final String? description;
  final String url;
  final String? imageUrl;
  final String sourceName;
  final DateTime publishedAt;
  final DateTime cachedAt;
  final String category;
  const NewsArticle(
      {required this.id,
      required this.title,
      this.description,
      required this.url,
      this.imageUrl,
      required this.sourceName,
      required this.publishedAt,
      required this.cachedAt,
      required this.category});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['url'] = Variable<String>(url);
    if (!nullToAbsent || imageUrl != null) {
      map['image_url'] = Variable<String>(imageUrl);
    }
    map['source_name'] = Variable<String>(sourceName);
    map['published_at'] = Variable<DateTime>(publishedAt);
    map['cached_at'] = Variable<DateTime>(cachedAt);
    map['category'] = Variable<String>(category);
    return map;
  }

  NewsArticlesCompanion toCompanion(bool nullToAbsent) {
    return NewsArticlesCompanion(
      id: Value(id),
      title: Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      url: Value(url),
      imageUrl: imageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(imageUrl),
      sourceName: Value(sourceName),
      publishedAt: Value(publishedAt),
      cachedAt: Value(cachedAt),
      category: Value(category),
    );
  }

  factory NewsArticle.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NewsArticle(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String?>(json['description']),
      url: serializer.fromJson<String>(json['url']),
      imageUrl: serializer.fromJson<String?>(json['imageUrl']),
      sourceName: serializer.fromJson<String>(json['sourceName']),
      publishedAt: serializer.fromJson<DateTime>(json['publishedAt']),
      cachedAt: serializer.fromJson<DateTime>(json['cachedAt']),
      category: serializer.fromJson<String>(json['category']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String?>(description),
      'url': serializer.toJson<String>(url),
      'imageUrl': serializer.toJson<String?>(imageUrl),
      'sourceName': serializer.toJson<String>(sourceName),
      'publishedAt': serializer.toJson<DateTime>(publishedAt),
      'cachedAt': serializer.toJson<DateTime>(cachedAt),
      'category': serializer.toJson<String>(category),
    };
  }

  NewsArticle copyWith(
          {String? id,
          String? title,
          Value<String?> description = const Value.absent(),
          String? url,
          Value<String?> imageUrl = const Value.absent(),
          String? sourceName,
          DateTime? publishedAt,
          DateTime? cachedAt,
          String? category}) =>
      NewsArticle(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description.present ? description.value : this.description,
        url: url ?? this.url,
        imageUrl: imageUrl.present ? imageUrl.value : this.imageUrl,
        sourceName: sourceName ?? this.sourceName,
        publishedAt: publishedAt ?? this.publishedAt,
        cachedAt: cachedAt ?? this.cachedAt,
        category: category ?? this.category,
      );
  NewsArticle copyWithCompanion(NewsArticlesCompanion data) {
    return NewsArticle(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      description:
          data.description.present ? data.description.value : this.description,
      url: data.url.present ? data.url.value : this.url,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
      sourceName:
          data.sourceName.present ? data.sourceName.value : this.sourceName,
      publishedAt:
          data.publishedAt.present ? data.publishedAt.value : this.publishedAt,
      cachedAt: data.cachedAt.present ? data.cachedAt.value : this.cachedAt,
      category: data.category.present ? data.category.value : this.category,
    );
  }

  @override
  String toString() {
    return (StringBuffer('NewsArticle(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('url: $url, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('sourceName: $sourceName, ')
          ..write('publishedAt: $publishedAt, ')
          ..write('cachedAt: $cachedAt, ')
          ..write('category: $category')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, description, url, imageUrl,
      sourceName, publishedAt, cachedAt, category);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NewsArticle &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.url == this.url &&
          other.imageUrl == this.imageUrl &&
          other.sourceName == this.sourceName &&
          other.publishedAt == this.publishedAt &&
          other.cachedAt == this.cachedAt &&
          other.category == this.category);
}

class NewsArticlesCompanion extends UpdateCompanion<NewsArticle> {
  final Value<String> id;
  final Value<String> title;
  final Value<String?> description;
  final Value<String> url;
  final Value<String?> imageUrl;
  final Value<String> sourceName;
  final Value<DateTime> publishedAt;
  final Value<DateTime> cachedAt;
  final Value<String> category;
  final Value<int> rowid;
  const NewsArticlesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.url = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.sourceName = const Value.absent(),
    this.publishedAt = const Value.absent(),
    this.cachedAt = const Value.absent(),
    this.category = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  NewsArticlesCompanion.insert({
    required String id,
    required String title,
    this.description = const Value.absent(),
    required String url,
    this.imageUrl = const Value.absent(),
    required String sourceName,
    required DateTime publishedAt,
    required DateTime cachedAt,
    required String category,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        title = Value(title),
        url = Value(url),
        sourceName = Value(sourceName),
        publishedAt = Value(publishedAt),
        cachedAt = Value(cachedAt),
        category = Value(category);
  static Insertable<NewsArticle> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? url,
    Expression<String>? imageUrl,
    Expression<String>? sourceName,
    Expression<DateTime>? publishedAt,
    Expression<DateTime>? cachedAt,
    Expression<String>? category,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (url != null) 'url': url,
      if (imageUrl != null) 'image_url': imageUrl,
      if (sourceName != null) 'source_name': sourceName,
      if (publishedAt != null) 'published_at': publishedAt,
      if (cachedAt != null) 'cached_at': cachedAt,
      if (category != null) 'category': category,
      if (rowid != null) 'rowid': rowid,
    });
  }

  NewsArticlesCompanion copyWith(
      {Value<String>? id,
      Value<String>? title,
      Value<String?>? description,
      Value<String>? url,
      Value<String?>? imageUrl,
      Value<String>? sourceName,
      Value<DateTime>? publishedAt,
      Value<DateTime>? cachedAt,
      Value<String>? category,
      Value<int>? rowid}) {
    return NewsArticlesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      url: url ?? this.url,
      imageUrl: imageUrl ?? this.imageUrl,
      sourceName: sourceName ?? this.sourceName,
      publishedAt: publishedAt ?? this.publishedAt,
      cachedAt: cachedAt ?? this.cachedAt,
      category: category ?? this.category,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (sourceName.present) {
      map['source_name'] = Variable<String>(sourceName.value);
    }
    if (publishedAt.present) {
      map['published_at'] = Variable<DateTime>(publishedAt.value);
    }
    if (cachedAt.present) {
      map['cached_at'] = Variable<DateTime>(cachedAt.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NewsArticlesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('url: $url, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('sourceName: $sourceName, ')
          ..write('publishedAt: $publishedAt, ')
          ..write('cachedAt: $cachedAt, ')
          ..write('category: $category, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ChatMessagesTable extends ChatMessages
    with TableInfo<$ChatMessagesTable, ChatMessage> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChatMessagesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _roleMeta = const VerificationMeta('role');
  @override
  late final GeneratedColumn<String> role = GeneratedColumn<String>(
      'role', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _timestampMeta =
      const VerificationMeta('timestamp');
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
      'timestamp', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _isErrorMeta =
      const VerificationMeta('isError');
  @override
  late final GeneratedColumn<bool> isError = GeneratedColumn<bool>(
      'is_error', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_error" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [id, content, role, timestamp, isError];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'chat_messages';
  @override
  VerificationContext validateIntegrity(Insertable<ChatMessage> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('role')) {
      context.handle(
          _roleMeta, role.isAcceptableOrUnknown(data['role']!, _roleMeta));
    } else if (isInserting) {
      context.missing(_roleMeta);
    }
    if (data.containsKey('timestamp')) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta));
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    if (data.containsKey('is_error')) {
      context.handle(_isErrorMeta,
          isError.isAcceptableOrUnknown(data['is_error']!, _isErrorMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ChatMessage map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ChatMessage(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content'])!,
      role: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}role'])!,
      timestamp: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}timestamp'])!,
      isError: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_error'])!,
    );
  }

  @override
  $ChatMessagesTable createAlias(String alias) {
    return $ChatMessagesTable(attachedDatabase, alias);
  }
}

class ChatMessage extends DataClass implements Insertable<ChatMessage> {
  final int id;
  final String content;
  final String role;
  final DateTime timestamp;
  final bool isError;
  const ChatMessage(
      {required this.id,
      required this.content,
      required this.role,
      required this.timestamp,
      required this.isError});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['content'] = Variable<String>(content);
    map['role'] = Variable<String>(role);
    map['timestamp'] = Variable<DateTime>(timestamp);
    map['is_error'] = Variable<bool>(isError);
    return map;
  }

  ChatMessagesCompanion toCompanion(bool nullToAbsent) {
    return ChatMessagesCompanion(
      id: Value(id),
      content: Value(content),
      role: Value(role),
      timestamp: Value(timestamp),
      isError: Value(isError),
    );
  }

  factory ChatMessage.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ChatMessage(
      id: serializer.fromJson<int>(json['id']),
      content: serializer.fromJson<String>(json['content']),
      role: serializer.fromJson<String>(json['role']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
      isError: serializer.fromJson<bool>(json['isError']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'content': serializer.toJson<String>(content),
      'role': serializer.toJson<String>(role),
      'timestamp': serializer.toJson<DateTime>(timestamp),
      'isError': serializer.toJson<bool>(isError),
    };
  }

  ChatMessage copyWith(
          {int? id,
          String? content,
          String? role,
          DateTime? timestamp,
          bool? isError}) =>
      ChatMessage(
        id: id ?? this.id,
        content: content ?? this.content,
        role: role ?? this.role,
        timestamp: timestamp ?? this.timestamp,
        isError: isError ?? this.isError,
      );
  ChatMessage copyWithCompanion(ChatMessagesCompanion data) {
    return ChatMessage(
      id: data.id.present ? data.id.value : this.id,
      content: data.content.present ? data.content.value : this.content,
      role: data.role.present ? data.role.value : this.role,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
      isError: data.isError.present ? data.isError.value : this.isError,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ChatMessage(')
          ..write('id: $id, ')
          ..write('content: $content, ')
          ..write('role: $role, ')
          ..write('timestamp: $timestamp, ')
          ..write('isError: $isError')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, content, role, timestamp, isError);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ChatMessage &&
          other.id == this.id &&
          other.content == this.content &&
          other.role == this.role &&
          other.timestamp == this.timestamp &&
          other.isError == this.isError);
}

class ChatMessagesCompanion extends UpdateCompanion<ChatMessage> {
  final Value<int> id;
  final Value<String> content;
  final Value<String> role;
  final Value<DateTime> timestamp;
  final Value<bool> isError;
  const ChatMessagesCompanion({
    this.id = const Value.absent(),
    this.content = const Value.absent(),
    this.role = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.isError = const Value.absent(),
  });
  ChatMessagesCompanion.insert({
    this.id = const Value.absent(),
    required String content,
    required String role,
    required DateTime timestamp,
    this.isError = const Value.absent(),
  })  : content = Value(content),
        role = Value(role),
        timestamp = Value(timestamp);
  static Insertable<ChatMessage> custom({
    Expression<int>? id,
    Expression<String>? content,
    Expression<String>? role,
    Expression<DateTime>? timestamp,
    Expression<bool>? isError,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (content != null) 'content': content,
      if (role != null) 'role': role,
      if (timestamp != null) 'timestamp': timestamp,
      if (isError != null) 'is_error': isError,
    });
  }

  ChatMessagesCompanion copyWith(
      {Value<int>? id,
      Value<String>? content,
      Value<String>? role,
      Value<DateTime>? timestamp,
      Value<bool>? isError}) {
    return ChatMessagesCompanion(
      id: id ?? this.id,
      content: content ?? this.content,
      role: role ?? this.role,
      timestamp: timestamp ?? this.timestamp,
      isError: isError ?? this.isError,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (role.present) {
      map['role'] = Variable<String>(role.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    if (isError.present) {
      map['is_error'] = Variable<bool>(isError.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChatMessagesCompanion(')
          ..write('id: $id, ')
          ..write('content: $content, ')
          ..write('role: $role, ')
          ..write('timestamp: $timestamp, ')
          ..write('isError: $isError')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CardsTable cards = $CardsTable(this);
  late final $WeightEntriesTable weightEntries = $WeightEntriesTable(this);
  late final $TransactionsTable transactions = $TransactionsTable(this);
  late final $RicePricesTable ricePrices = $RicePricesTable(this);
  late final $NewsArticlesTable newsArticles = $NewsArticlesTable(this);
  late final $ChatMessagesTable chatMessages = $ChatMessagesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        cards,
        weightEntries,
        transactions,
        ricePrices,
        newsArticles,
        chatMessages
      ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules(
        [
          WritePropagation(
            on: TableUpdateQuery.onTableName('cards',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('weight_entries', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('cards',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('transactions', kind: UpdateKind.delete),
            ],
          ),
        ],
      );
}

typedef $$CardsTableCreateCompanionBuilder = CardsCompanion Function({
  Value<int> id,
  required DateTime date,
  required DateTime lastModified,
  required String name,
  Value<String?> phone,
  Value<String?> cccd,
  Value<String?> fieldAddress,
  Value<String> traderName,
  required String riceVariety,
  required String seasonLabel,
  Value<double> totalWeight,
  Value<double> bagWeight,
  Value<double> impurityWeight,
  Value<double> netWeight,
  Value<double> moisturePercent,
  Value<int> bagCount,
  Value<bool> bagMethodIsSampling,
  Value<int> bagSampleCount,
  Value<double> bagSampleTotalWeight,
  Value<double> bagWeightPerUnit,
  Value<bool> impurityIsPercent,
  Value<double> impurityFixed,
  Value<double> impurityPercent,
  Value<String> weightInputMode,
  Value<double> pricePerKg,
  Value<double> totalAmount,
  Value<double> depositAmount,
  Value<double> paidAmount,
  Value<double> remainingAmount,
  Value<bool> isPaid,
  Value<double?> latitude,
  Value<double?> longitude,
  Value<bool> isDeleted,
});
typedef $$CardsTableUpdateCompanionBuilder = CardsCompanion Function({
  Value<int> id,
  Value<DateTime> date,
  Value<DateTime> lastModified,
  Value<String> name,
  Value<String?> phone,
  Value<String?> cccd,
  Value<String?> fieldAddress,
  Value<String> traderName,
  Value<String> riceVariety,
  Value<String> seasonLabel,
  Value<double> totalWeight,
  Value<double> bagWeight,
  Value<double> impurityWeight,
  Value<double> netWeight,
  Value<double> moisturePercent,
  Value<int> bagCount,
  Value<bool> bagMethodIsSampling,
  Value<int> bagSampleCount,
  Value<double> bagSampleTotalWeight,
  Value<double> bagWeightPerUnit,
  Value<bool> impurityIsPercent,
  Value<double> impurityFixed,
  Value<double> impurityPercent,
  Value<String> weightInputMode,
  Value<double> pricePerKg,
  Value<double> totalAmount,
  Value<double> depositAmount,
  Value<double> paidAmount,
  Value<double> remainingAmount,
  Value<bool> isPaid,
  Value<double?> latitude,
  Value<double?> longitude,
  Value<bool> isDeleted,
});

final class $$CardsTableReferences
    extends BaseReferences<_$AppDatabase, $CardsTable, RiceCard> {
  $$CardsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$WeightEntriesTable, List<WeightEntry>>
      _weightEntriesRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.weightEntries,
              aliasName:
                  $_aliasNameGenerator(db.cards.id, db.weightEntries.cardId));

  $$WeightEntriesTableProcessedTableManager get weightEntriesRefs {
    final manager = $$WeightEntriesTableTableManager($_db, $_db.weightEntries)
        .filter((f) => f.cardId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_weightEntriesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$TransactionsTable, List<Transaction>>
      _transactionsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.transactions,
          aliasName: $_aliasNameGenerator(db.cards.id, db.transactions.cardId));

  $$TransactionsTableProcessedTableManager get transactionsRefs {
    final manager = $$TransactionsTableTableManager($_db, $_db.transactions)
        .filter((f) => f.cardId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_transactionsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$CardsTableFilterComposer extends Composer<_$AppDatabase, $CardsTable> {
  $$CardsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastModified => $composableBuilder(
      column: $table.lastModified, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get phone => $composableBuilder(
      column: $table.phone, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get cccd => $composableBuilder(
      column: $table.cccd, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get fieldAddress => $composableBuilder(
      column: $table.fieldAddress, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get traderName => $composableBuilder(
      column: $table.traderName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get riceVariety => $composableBuilder(
      column: $table.riceVariety, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get seasonLabel => $composableBuilder(
      column: $table.seasonLabel, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get totalWeight => $composableBuilder(
      column: $table.totalWeight, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get bagWeight => $composableBuilder(
      column: $table.bagWeight, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get impurityWeight => $composableBuilder(
      column: $table.impurityWeight,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get netWeight => $composableBuilder(
      column: $table.netWeight, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get moisturePercent => $composableBuilder(
      column: $table.moisturePercent,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get bagCount => $composableBuilder(
      column: $table.bagCount, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get bagMethodIsSampling => $composableBuilder(
      column: $table.bagMethodIsSampling,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get bagSampleCount => $composableBuilder(
      column: $table.bagSampleCount,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get bagSampleTotalWeight => $composableBuilder(
      column: $table.bagSampleTotalWeight,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get bagWeightPerUnit => $composableBuilder(
      column: $table.bagWeightPerUnit,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get impurityIsPercent => $composableBuilder(
      column: $table.impurityIsPercent,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get impurityFixed => $composableBuilder(
      column: $table.impurityFixed, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get impurityPercent => $composableBuilder(
      column: $table.impurityPercent,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get weightInputMode => $composableBuilder(
      column: $table.weightInputMode,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get pricePerKg => $composableBuilder(
      column: $table.pricePerKg, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get totalAmount => $composableBuilder(
      column: $table.totalAmount, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get depositAmount => $composableBuilder(
      column: $table.depositAmount, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get paidAmount => $composableBuilder(
      column: $table.paidAmount, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get remainingAmount => $composableBuilder(
      column: $table.remainingAmount,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isPaid => $composableBuilder(
      column: $table.isPaid, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get latitude => $composableBuilder(
      column: $table.latitude, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get longitude => $composableBuilder(
      column: $table.longitude, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnFilters(column));

  Expression<bool> weightEntriesRefs(
      Expression<bool> Function($$WeightEntriesTableFilterComposer f) f) {
    final $$WeightEntriesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.weightEntries,
        getReferencedColumn: (t) => t.cardId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WeightEntriesTableFilterComposer(
              $db: $db,
              $table: $db.weightEntries,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> transactionsRefs(
      Expression<bool> Function($$TransactionsTableFilterComposer f) f) {
    final $$TransactionsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.transactions,
        getReferencedColumn: (t) => t.cardId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TransactionsTableFilterComposer(
              $db: $db,
              $table: $db.transactions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$CardsTableOrderingComposer
    extends Composer<_$AppDatabase, $CardsTable> {
  $$CardsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastModified => $composableBuilder(
      column: $table.lastModified,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get phone => $composableBuilder(
      column: $table.phone, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get cccd => $composableBuilder(
      column: $table.cccd, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get fieldAddress => $composableBuilder(
      column: $table.fieldAddress,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get traderName => $composableBuilder(
      column: $table.traderName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get riceVariety => $composableBuilder(
      column: $table.riceVariety, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get seasonLabel => $composableBuilder(
      column: $table.seasonLabel, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get totalWeight => $composableBuilder(
      column: $table.totalWeight, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get bagWeight => $composableBuilder(
      column: $table.bagWeight, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get impurityWeight => $composableBuilder(
      column: $table.impurityWeight,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get netWeight => $composableBuilder(
      column: $table.netWeight, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get moisturePercent => $composableBuilder(
      column: $table.moisturePercent,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get bagCount => $composableBuilder(
      column: $table.bagCount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get bagMethodIsSampling => $composableBuilder(
      column: $table.bagMethodIsSampling,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get bagSampleCount => $composableBuilder(
      column: $table.bagSampleCount,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get bagSampleTotalWeight => $composableBuilder(
      column: $table.bagSampleTotalWeight,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get bagWeightPerUnit => $composableBuilder(
      column: $table.bagWeightPerUnit,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get impurityIsPercent => $composableBuilder(
      column: $table.impurityIsPercent,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get impurityFixed => $composableBuilder(
      column: $table.impurityFixed,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get impurityPercent => $composableBuilder(
      column: $table.impurityPercent,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get weightInputMode => $composableBuilder(
      column: $table.weightInputMode,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get pricePerKg => $composableBuilder(
      column: $table.pricePerKg, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get totalAmount => $composableBuilder(
      column: $table.totalAmount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get depositAmount => $composableBuilder(
      column: $table.depositAmount,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get paidAmount => $composableBuilder(
      column: $table.paidAmount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get remainingAmount => $composableBuilder(
      column: $table.remainingAmount,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isPaid => $composableBuilder(
      column: $table.isPaid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get latitude => $composableBuilder(
      column: $table.latitude, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get longitude => $composableBuilder(
      column: $table.longitude, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnOrderings(column));
}

class $$CardsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CardsTable> {
  $$CardsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<DateTime> get lastModified => $composableBuilder(
      column: $table.lastModified, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get cccd =>
      $composableBuilder(column: $table.cccd, builder: (column) => column);

  GeneratedColumn<String> get fieldAddress => $composableBuilder(
      column: $table.fieldAddress, builder: (column) => column);

  GeneratedColumn<String> get traderName => $composableBuilder(
      column: $table.traderName, builder: (column) => column);

  GeneratedColumn<String> get riceVariety => $composableBuilder(
      column: $table.riceVariety, builder: (column) => column);

  GeneratedColumn<String> get seasonLabel => $composableBuilder(
      column: $table.seasonLabel, builder: (column) => column);

  GeneratedColumn<double> get totalWeight => $composableBuilder(
      column: $table.totalWeight, builder: (column) => column);

  GeneratedColumn<double> get bagWeight =>
      $composableBuilder(column: $table.bagWeight, builder: (column) => column);

  GeneratedColumn<double> get impurityWeight => $composableBuilder(
      column: $table.impurityWeight, builder: (column) => column);

  GeneratedColumn<double> get netWeight =>
      $composableBuilder(column: $table.netWeight, builder: (column) => column);

  GeneratedColumn<double> get moisturePercent => $composableBuilder(
      column: $table.moisturePercent, builder: (column) => column);

  GeneratedColumn<int> get bagCount =>
      $composableBuilder(column: $table.bagCount, builder: (column) => column);

  GeneratedColumn<bool> get bagMethodIsSampling => $composableBuilder(
      column: $table.bagMethodIsSampling, builder: (column) => column);

  GeneratedColumn<int> get bagSampleCount => $composableBuilder(
      column: $table.bagSampleCount, builder: (column) => column);

  GeneratedColumn<double> get bagSampleTotalWeight => $composableBuilder(
      column: $table.bagSampleTotalWeight, builder: (column) => column);

  GeneratedColumn<double> get bagWeightPerUnit => $composableBuilder(
      column: $table.bagWeightPerUnit, builder: (column) => column);

  GeneratedColumn<bool> get impurityIsPercent => $composableBuilder(
      column: $table.impurityIsPercent, builder: (column) => column);

  GeneratedColumn<double> get impurityFixed => $composableBuilder(
      column: $table.impurityFixed, builder: (column) => column);

  GeneratedColumn<double> get impurityPercent => $composableBuilder(
      column: $table.impurityPercent, builder: (column) => column);

  GeneratedColumn<String> get weightInputMode => $composableBuilder(
      column: $table.weightInputMode, builder: (column) => column);

  GeneratedColumn<double> get pricePerKg => $composableBuilder(
      column: $table.pricePerKg, builder: (column) => column);

  GeneratedColumn<double> get totalAmount => $composableBuilder(
      column: $table.totalAmount, builder: (column) => column);

  GeneratedColumn<double> get depositAmount => $composableBuilder(
      column: $table.depositAmount, builder: (column) => column);

  GeneratedColumn<double> get paidAmount => $composableBuilder(
      column: $table.paidAmount, builder: (column) => column);

  GeneratedColumn<double> get remainingAmount => $composableBuilder(
      column: $table.remainingAmount, builder: (column) => column);

  GeneratedColumn<bool> get isPaid =>
      $composableBuilder(column: $table.isPaid, builder: (column) => column);

  GeneratedColumn<double> get latitude =>
      $composableBuilder(column: $table.latitude, builder: (column) => column);

  GeneratedColumn<double> get longitude =>
      $composableBuilder(column: $table.longitude, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  Expression<T> weightEntriesRefs<T extends Object>(
      Expression<T> Function($$WeightEntriesTableAnnotationComposer a) f) {
    final $$WeightEntriesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.weightEntries,
        getReferencedColumn: (t) => t.cardId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WeightEntriesTableAnnotationComposer(
              $db: $db,
              $table: $db.weightEntries,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> transactionsRefs<T extends Object>(
      Expression<T> Function($$TransactionsTableAnnotationComposer a) f) {
    final $$TransactionsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.transactions,
        getReferencedColumn: (t) => t.cardId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TransactionsTableAnnotationComposer(
              $db: $db,
              $table: $db.transactions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$CardsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CardsTable,
    RiceCard,
    $$CardsTableFilterComposer,
    $$CardsTableOrderingComposer,
    $$CardsTableAnnotationComposer,
    $$CardsTableCreateCompanionBuilder,
    $$CardsTableUpdateCompanionBuilder,
    (RiceCard, $$CardsTableReferences),
    RiceCard,
    PrefetchHooks Function({bool weightEntriesRefs, bool transactionsRefs})> {
  $$CardsTableTableManager(_$AppDatabase db, $CardsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CardsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CardsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CardsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<DateTime> lastModified = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> phone = const Value.absent(),
            Value<String?> cccd = const Value.absent(),
            Value<String?> fieldAddress = const Value.absent(),
            Value<String> traderName = const Value.absent(),
            Value<String> riceVariety = const Value.absent(),
            Value<String> seasonLabel = const Value.absent(),
            Value<double> totalWeight = const Value.absent(),
            Value<double> bagWeight = const Value.absent(),
            Value<double> impurityWeight = const Value.absent(),
            Value<double> netWeight = const Value.absent(),
            Value<double> moisturePercent = const Value.absent(),
            Value<int> bagCount = const Value.absent(),
            Value<bool> bagMethodIsSampling = const Value.absent(),
            Value<int> bagSampleCount = const Value.absent(),
            Value<double> bagSampleTotalWeight = const Value.absent(),
            Value<double> bagWeightPerUnit = const Value.absent(),
            Value<bool> impurityIsPercent = const Value.absent(),
            Value<double> impurityFixed = const Value.absent(),
            Value<double> impurityPercent = const Value.absent(),
            Value<String> weightInputMode = const Value.absent(),
            Value<double> pricePerKg = const Value.absent(),
            Value<double> totalAmount = const Value.absent(),
            Value<double> depositAmount = const Value.absent(),
            Value<double> paidAmount = const Value.absent(),
            Value<double> remainingAmount = const Value.absent(),
            Value<bool> isPaid = const Value.absent(),
            Value<double?> latitude = const Value.absent(),
            Value<double?> longitude = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
          }) =>
              CardsCompanion(
            id: id,
            date: date,
            lastModified: lastModified,
            name: name,
            phone: phone,
            cccd: cccd,
            fieldAddress: fieldAddress,
            traderName: traderName,
            riceVariety: riceVariety,
            seasonLabel: seasonLabel,
            totalWeight: totalWeight,
            bagWeight: bagWeight,
            impurityWeight: impurityWeight,
            netWeight: netWeight,
            moisturePercent: moisturePercent,
            bagCount: bagCount,
            bagMethodIsSampling: bagMethodIsSampling,
            bagSampleCount: bagSampleCount,
            bagSampleTotalWeight: bagSampleTotalWeight,
            bagWeightPerUnit: bagWeightPerUnit,
            impurityIsPercent: impurityIsPercent,
            impurityFixed: impurityFixed,
            impurityPercent: impurityPercent,
            weightInputMode: weightInputMode,
            pricePerKg: pricePerKg,
            totalAmount: totalAmount,
            depositAmount: depositAmount,
            paidAmount: paidAmount,
            remainingAmount: remainingAmount,
            isPaid: isPaid,
            latitude: latitude,
            longitude: longitude,
            isDeleted: isDeleted,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required DateTime date,
            required DateTime lastModified,
            required String name,
            Value<String?> phone = const Value.absent(),
            Value<String?> cccd = const Value.absent(),
            Value<String?> fieldAddress = const Value.absent(),
            Value<String> traderName = const Value.absent(),
            required String riceVariety,
            required String seasonLabel,
            Value<double> totalWeight = const Value.absent(),
            Value<double> bagWeight = const Value.absent(),
            Value<double> impurityWeight = const Value.absent(),
            Value<double> netWeight = const Value.absent(),
            Value<double> moisturePercent = const Value.absent(),
            Value<int> bagCount = const Value.absent(),
            Value<bool> bagMethodIsSampling = const Value.absent(),
            Value<int> bagSampleCount = const Value.absent(),
            Value<double> bagSampleTotalWeight = const Value.absent(),
            Value<double> bagWeightPerUnit = const Value.absent(),
            Value<bool> impurityIsPercent = const Value.absent(),
            Value<double> impurityFixed = const Value.absent(),
            Value<double> impurityPercent = const Value.absent(),
            Value<String> weightInputMode = const Value.absent(),
            Value<double> pricePerKg = const Value.absent(),
            Value<double> totalAmount = const Value.absent(),
            Value<double> depositAmount = const Value.absent(),
            Value<double> paidAmount = const Value.absent(),
            Value<double> remainingAmount = const Value.absent(),
            Value<bool> isPaid = const Value.absent(),
            Value<double?> latitude = const Value.absent(),
            Value<double?> longitude = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
          }) =>
              CardsCompanion.insert(
            id: id,
            date: date,
            lastModified: lastModified,
            name: name,
            phone: phone,
            cccd: cccd,
            fieldAddress: fieldAddress,
            traderName: traderName,
            riceVariety: riceVariety,
            seasonLabel: seasonLabel,
            totalWeight: totalWeight,
            bagWeight: bagWeight,
            impurityWeight: impurityWeight,
            netWeight: netWeight,
            moisturePercent: moisturePercent,
            bagCount: bagCount,
            bagMethodIsSampling: bagMethodIsSampling,
            bagSampleCount: bagSampleCount,
            bagSampleTotalWeight: bagSampleTotalWeight,
            bagWeightPerUnit: bagWeightPerUnit,
            impurityIsPercent: impurityIsPercent,
            impurityFixed: impurityFixed,
            impurityPercent: impurityPercent,
            weightInputMode: weightInputMode,
            pricePerKg: pricePerKg,
            totalAmount: totalAmount,
            depositAmount: depositAmount,
            paidAmount: paidAmount,
            remainingAmount: remainingAmount,
            isPaid: isPaid,
            latitude: latitude,
            longitude: longitude,
            isDeleted: isDeleted,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$CardsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: (
              {weightEntriesRefs = false, transactionsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (weightEntriesRefs) db.weightEntries,
                if (transactionsRefs) db.transactions
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (weightEntriesRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$CardsTableReferences._weightEntriesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$CardsTableReferences(db, table, p0)
                                .weightEntriesRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.cardId == item.id),
                        typedResults: items),
                  if (transactionsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$CardsTableReferences._transactionsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$CardsTableReferences(db, table, p0)
                                .transactionsRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.cardId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$CardsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CardsTable,
    RiceCard,
    $$CardsTableFilterComposer,
    $$CardsTableOrderingComposer,
    $$CardsTableAnnotationComposer,
    $$CardsTableCreateCompanionBuilder,
    $$CardsTableUpdateCompanionBuilder,
    (RiceCard, $$CardsTableReferences),
    RiceCard,
    PrefetchHooks Function({bool weightEntriesRefs, bool transactionsRefs})>;
typedef $$WeightEntriesTableCreateCompanionBuilder = WeightEntriesCompanion
    Function({
  Value<int> id,
  required int cardId,
  required double weight,
  Value<double> bagWeight,
  Value<double> impurityWeight,
  Value<double> netWeight,
  required DateTime timestamp,
});
typedef $$WeightEntriesTableUpdateCompanionBuilder = WeightEntriesCompanion
    Function({
  Value<int> id,
  Value<int> cardId,
  Value<double> weight,
  Value<double> bagWeight,
  Value<double> impurityWeight,
  Value<double> netWeight,
  Value<DateTime> timestamp,
});

final class $$WeightEntriesTableReferences
    extends BaseReferences<_$AppDatabase, $WeightEntriesTable, WeightEntry> {
  $$WeightEntriesTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $CardsTable _cardIdTable(_$AppDatabase db) => db.cards
      .createAlias($_aliasNameGenerator(db.weightEntries.cardId, db.cards.id));

  $$CardsTableProcessedTableManager? get cardId {
    if ($_item.cardId == null) return null;
    final manager = $$CardsTableTableManager($_db, $_db.cards)
        .filter((f) => f.id($_item.cardId!));
    final item = $_typedResult.readTableOrNull(_cardIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$WeightEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $WeightEntriesTable> {
  $$WeightEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get weight => $composableBuilder(
      column: $table.weight, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get bagWeight => $composableBuilder(
      column: $table.bagWeight, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get impurityWeight => $composableBuilder(
      column: $table.impurityWeight,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get netWeight => $composableBuilder(
      column: $table.netWeight, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get timestamp => $composableBuilder(
      column: $table.timestamp, builder: (column) => ColumnFilters(column));

  $$CardsTableFilterComposer get cardId {
    final $$CardsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.cardId,
        referencedTable: $db.cards,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CardsTableFilterComposer(
              $db: $db,
              $table: $db.cards,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$WeightEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $WeightEntriesTable> {
  $$WeightEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get weight => $composableBuilder(
      column: $table.weight, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get bagWeight => $composableBuilder(
      column: $table.bagWeight, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get impurityWeight => $composableBuilder(
      column: $table.impurityWeight,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get netWeight => $composableBuilder(
      column: $table.netWeight, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get timestamp => $composableBuilder(
      column: $table.timestamp, builder: (column) => ColumnOrderings(column));

  $$CardsTableOrderingComposer get cardId {
    final $$CardsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.cardId,
        referencedTable: $db.cards,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CardsTableOrderingComposer(
              $db: $db,
              $table: $db.cards,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$WeightEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $WeightEntriesTable> {
  $$WeightEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get weight =>
      $composableBuilder(column: $table.weight, builder: (column) => column);

  GeneratedColumn<double> get bagWeight =>
      $composableBuilder(column: $table.bagWeight, builder: (column) => column);

  GeneratedColumn<double> get impurityWeight => $composableBuilder(
      column: $table.impurityWeight, builder: (column) => column);

  GeneratedColumn<double> get netWeight =>
      $composableBuilder(column: $table.netWeight, builder: (column) => column);

  GeneratedColumn<DateTime> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);

  $$CardsTableAnnotationComposer get cardId {
    final $$CardsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.cardId,
        referencedTable: $db.cards,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CardsTableAnnotationComposer(
              $db: $db,
              $table: $db.cards,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$WeightEntriesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $WeightEntriesTable,
    WeightEntry,
    $$WeightEntriesTableFilterComposer,
    $$WeightEntriesTableOrderingComposer,
    $$WeightEntriesTableAnnotationComposer,
    $$WeightEntriesTableCreateCompanionBuilder,
    $$WeightEntriesTableUpdateCompanionBuilder,
    (WeightEntry, $$WeightEntriesTableReferences),
    WeightEntry,
    PrefetchHooks Function({bool cardId})> {
  $$WeightEntriesTableTableManager(_$AppDatabase db, $WeightEntriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WeightEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WeightEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WeightEntriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> cardId = const Value.absent(),
            Value<double> weight = const Value.absent(),
            Value<double> bagWeight = const Value.absent(),
            Value<double> impurityWeight = const Value.absent(),
            Value<double> netWeight = const Value.absent(),
            Value<DateTime> timestamp = const Value.absent(),
          }) =>
              WeightEntriesCompanion(
            id: id,
            cardId: cardId,
            weight: weight,
            bagWeight: bagWeight,
            impurityWeight: impurityWeight,
            netWeight: netWeight,
            timestamp: timestamp,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int cardId,
            required double weight,
            Value<double> bagWeight = const Value.absent(),
            Value<double> impurityWeight = const Value.absent(),
            Value<double> netWeight = const Value.absent(),
            required DateTime timestamp,
          }) =>
              WeightEntriesCompanion.insert(
            id: id,
            cardId: cardId,
            weight: weight,
            bagWeight: bagWeight,
            impurityWeight: impurityWeight,
            netWeight: netWeight,
            timestamp: timestamp,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$WeightEntriesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({cardId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (cardId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.cardId,
                    referencedTable:
                        $$WeightEntriesTableReferences._cardIdTable(db),
                    referencedColumn:
                        $$WeightEntriesTableReferences._cardIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$WeightEntriesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $WeightEntriesTable,
    WeightEntry,
    $$WeightEntriesTableFilterComposer,
    $$WeightEntriesTableOrderingComposer,
    $$WeightEntriesTableAnnotationComposer,
    $$WeightEntriesTableCreateCompanionBuilder,
    $$WeightEntriesTableUpdateCompanionBuilder,
    (WeightEntry, $$WeightEntriesTableReferences),
    WeightEntry,
    PrefetchHooks Function({bool cardId})>;
typedef $$TransactionsTableCreateCompanionBuilder = TransactionsCompanion
    Function({
  Value<int> id,
  required int cardId,
  required double amount,
  required String type,
  Value<String?> description,
  required DateTime date,
});
typedef $$TransactionsTableUpdateCompanionBuilder = TransactionsCompanion
    Function({
  Value<int> id,
  Value<int> cardId,
  Value<double> amount,
  Value<String> type,
  Value<String?> description,
  Value<DateTime> date,
});

final class $$TransactionsTableReferences
    extends BaseReferences<_$AppDatabase, $TransactionsTable, Transaction> {
  $$TransactionsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CardsTable _cardIdTable(_$AppDatabase db) => db.cards
      .createAlias($_aliasNameGenerator(db.transactions.cardId, db.cards.id));

  $$CardsTableProcessedTableManager? get cardId {
    if ($_item.cardId == null) return null;
    final manager = $$CardsTableTableManager($_db, $_db.cards)
        .filter((f) => f.id($_item.cardId!));
    final item = $_typedResult.readTableOrNull(_cardIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$TransactionsTableFilterComposer
    extends Composer<_$AppDatabase, $TransactionsTable> {
  $$TransactionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  $$CardsTableFilterComposer get cardId {
    final $$CardsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.cardId,
        referencedTable: $db.cards,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CardsTableFilterComposer(
              $db: $db,
              $table: $db.cards,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TransactionsTableOrderingComposer
    extends Composer<_$AppDatabase, $TransactionsTable> {
  $$TransactionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  $$CardsTableOrderingComposer get cardId {
    final $$CardsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.cardId,
        referencedTable: $db.cards,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CardsTableOrderingComposer(
              $db: $db,
              $table: $db.cards,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TransactionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TransactionsTable> {
  $$TransactionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  $$CardsTableAnnotationComposer get cardId {
    final $$CardsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.cardId,
        referencedTable: $db.cards,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CardsTableAnnotationComposer(
              $db: $db,
              $table: $db.cards,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TransactionsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TransactionsTable,
    Transaction,
    $$TransactionsTableFilterComposer,
    $$TransactionsTableOrderingComposer,
    $$TransactionsTableAnnotationComposer,
    $$TransactionsTableCreateCompanionBuilder,
    $$TransactionsTableUpdateCompanionBuilder,
    (Transaction, $$TransactionsTableReferences),
    Transaction,
    PrefetchHooks Function({bool cardId})> {
  $$TransactionsTableTableManager(_$AppDatabase db, $TransactionsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TransactionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TransactionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TransactionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> cardId = const Value.absent(),
            Value<double> amount = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
          }) =>
              TransactionsCompanion(
            id: id,
            cardId: cardId,
            amount: amount,
            type: type,
            description: description,
            date: date,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int cardId,
            required double amount,
            required String type,
            Value<String?> description = const Value.absent(),
            required DateTime date,
          }) =>
              TransactionsCompanion.insert(
            id: id,
            cardId: cardId,
            amount: amount,
            type: type,
            description: description,
            date: date,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$TransactionsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({cardId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (cardId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.cardId,
                    referencedTable:
                        $$TransactionsTableReferences._cardIdTable(db),
                    referencedColumn:
                        $$TransactionsTableReferences._cardIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$TransactionsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TransactionsTable,
    Transaction,
    $$TransactionsTableFilterComposer,
    $$TransactionsTableOrderingComposer,
    $$TransactionsTableAnnotationComposer,
    $$TransactionsTableCreateCompanionBuilder,
    $$TransactionsTableUpdateCompanionBuilder,
    (Transaction, $$TransactionsTableReferences),
    Transaction,
    PrefetchHooks Function({bool cardId})>;
typedef $$RicePricesTableCreateCompanionBuilder = RicePricesCompanion Function({
  required String id,
  required String variety,
  required double priceMin,
  required double priceMax,
  required double priceAvg7d,
  required String region,
  required DateTime updatedAt,
  required String trend,
  required String riceType,
  Value<String?> source,
  Value<int> rowid,
});
typedef $$RicePricesTableUpdateCompanionBuilder = RicePricesCompanion Function({
  Value<String> id,
  Value<String> variety,
  Value<double> priceMin,
  Value<double> priceMax,
  Value<double> priceAvg7d,
  Value<String> region,
  Value<DateTime> updatedAt,
  Value<String> trend,
  Value<String> riceType,
  Value<String?> source,
  Value<int> rowid,
});

class $$RicePricesTableFilterComposer
    extends Composer<_$AppDatabase, $RicePricesTable> {
  $$RicePricesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get variety => $composableBuilder(
      column: $table.variety, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get priceMin => $composableBuilder(
      column: $table.priceMin, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get priceMax => $composableBuilder(
      column: $table.priceMax, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get priceAvg7d => $composableBuilder(
      column: $table.priceAvg7d, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get region => $composableBuilder(
      column: $table.region, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get trend => $composableBuilder(
      column: $table.trend, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get riceType => $composableBuilder(
      column: $table.riceType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get source => $composableBuilder(
      column: $table.source, builder: (column) => ColumnFilters(column));
}

class $$RicePricesTableOrderingComposer
    extends Composer<_$AppDatabase, $RicePricesTable> {
  $$RicePricesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get variety => $composableBuilder(
      column: $table.variety, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get priceMin => $composableBuilder(
      column: $table.priceMin, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get priceMax => $composableBuilder(
      column: $table.priceMax, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get priceAvg7d => $composableBuilder(
      column: $table.priceAvg7d, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get region => $composableBuilder(
      column: $table.region, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get trend => $composableBuilder(
      column: $table.trend, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get riceType => $composableBuilder(
      column: $table.riceType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get source => $composableBuilder(
      column: $table.source, builder: (column) => ColumnOrderings(column));
}

class $$RicePricesTableAnnotationComposer
    extends Composer<_$AppDatabase, $RicePricesTable> {
  $$RicePricesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get variety =>
      $composableBuilder(column: $table.variety, builder: (column) => column);

  GeneratedColumn<double> get priceMin =>
      $composableBuilder(column: $table.priceMin, builder: (column) => column);

  GeneratedColumn<double> get priceMax =>
      $composableBuilder(column: $table.priceMax, builder: (column) => column);

  GeneratedColumn<double> get priceAvg7d => $composableBuilder(
      column: $table.priceAvg7d, builder: (column) => column);

  GeneratedColumn<String> get region =>
      $composableBuilder(column: $table.region, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get trend =>
      $composableBuilder(column: $table.trend, builder: (column) => column);

  GeneratedColumn<String> get riceType =>
      $composableBuilder(column: $table.riceType, builder: (column) => column);

  GeneratedColumn<String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);
}

class $$RicePricesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $RicePricesTable,
    RicePrice,
    $$RicePricesTableFilterComposer,
    $$RicePricesTableOrderingComposer,
    $$RicePricesTableAnnotationComposer,
    $$RicePricesTableCreateCompanionBuilder,
    $$RicePricesTableUpdateCompanionBuilder,
    (RicePrice, BaseReferences<_$AppDatabase, $RicePricesTable, RicePrice>),
    RicePrice,
    PrefetchHooks Function()> {
  $$RicePricesTableTableManager(_$AppDatabase db, $RicePricesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RicePricesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RicePricesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RicePricesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> variety = const Value.absent(),
            Value<double> priceMin = const Value.absent(),
            Value<double> priceMax = const Value.absent(),
            Value<double> priceAvg7d = const Value.absent(),
            Value<String> region = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<String> trend = const Value.absent(),
            Value<String> riceType = const Value.absent(),
            Value<String?> source = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              RicePricesCompanion(
            id: id,
            variety: variety,
            priceMin: priceMin,
            priceMax: priceMax,
            priceAvg7d: priceAvg7d,
            region: region,
            updatedAt: updatedAt,
            trend: trend,
            riceType: riceType,
            source: source,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String variety,
            required double priceMin,
            required double priceMax,
            required double priceAvg7d,
            required String region,
            required DateTime updatedAt,
            required String trend,
            required String riceType,
            Value<String?> source = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              RicePricesCompanion.insert(
            id: id,
            variety: variety,
            priceMin: priceMin,
            priceMax: priceMax,
            priceAvg7d: priceAvg7d,
            region: region,
            updatedAt: updatedAt,
            trend: trend,
            riceType: riceType,
            source: source,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$RicePricesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $RicePricesTable,
    RicePrice,
    $$RicePricesTableFilterComposer,
    $$RicePricesTableOrderingComposer,
    $$RicePricesTableAnnotationComposer,
    $$RicePricesTableCreateCompanionBuilder,
    $$RicePricesTableUpdateCompanionBuilder,
    (RicePrice, BaseReferences<_$AppDatabase, $RicePricesTable, RicePrice>),
    RicePrice,
    PrefetchHooks Function()>;
typedef $$NewsArticlesTableCreateCompanionBuilder = NewsArticlesCompanion
    Function({
  required String id,
  required String title,
  Value<String?> description,
  required String url,
  Value<String?> imageUrl,
  required String sourceName,
  required DateTime publishedAt,
  required DateTime cachedAt,
  required String category,
  Value<int> rowid,
});
typedef $$NewsArticlesTableUpdateCompanionBuilder = NewsArticlesCompanion
    Function({
  Value<String> id,
  Value<String> title,
  Value<String?> description,
  Value<String> url,
  Value<String?> imageUrl,
  Value<String> sourceName,
  Value<DateTime> publishedAt,
  Value<DateTime> cachedAt,
  Value<String> category,
  Value<int> rowid,
});

class $$NewsArticlesTableFilterComposer
    extends Composer<_$AppDatabase, $NewsArticlesTable> {
  $$NewsArticlesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get url => $composableBuilder(
      column: $table.url, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get imageUrl => $composableBuilder(
      column: $table.imageUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sourceName => $composableBuilder(
      column: $table.sourceName, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get publishedAt => $composableBuilder(
      column: $table.publishedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get cachedAt => $composableBuilder(
      column: $table.cachedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnFilters(column));
}

class $$NewsArticlesTableOrderingComposer
    extends Composer<_$AppDatabase, $NewsArticlesTable> {
  $$NewsArticlesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get url => $composableBuilder(
      column: $table.url, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get imageUrl => $composableBuilder(
      column: $table.imageUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sourceName => $composableBuilder(
      column: $table.sourceName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get publishedAt => $composableBuilder(
      column: $table.publishedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get cachedAt => $composableBuilder(
      column: $table.cachedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnOrderings(column));
}

class $$NewsArticlesTableAnnotationComposer
    extends Composer<_$AppDatabase, $NewsArticlesTable> {
  $$NewsArticlesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get url =>
      $composableBuilder(column: $table.url, builder: (column) => column);

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

  GeneratedColumn<String> get sourceName => $composableBuilder(
      column: $table.sourceName, builder: (column) => column);

  GeneratedColumn<DateTime> get publishedAt => $composableBuilder(
      column: $table.publishedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get cachedAt =>
      $composableBuilder(column: $table.cachedAt, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);
}

class $$NewsArticlesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $NewsArticlesTable,
    NewsArticle,
    $$NewsArticlesTableFilterComposer,
    $$NewsArticlesTableOrderingComposer,
    $$NewsArticlesTableAnnotationComposer,
    $$NewsArticlesTableCreateCompanionBuilder,
    $$NewsArticlesTableUpdateCompanionBuilder,
    (
      NewsArticle,
      BaseReferences<_$AppDatabase, $NewsArticlesTable, NewsArticle>
    ),
    NewsArticle,
    PrefetchHooks Function()> {
  $$NewsArticlesTableTableManager(_$AppDatabase db, $NewsArticlesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NewsArticlesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NewsArticlesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$NewsArticlesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<String> url = const Value.absent(),
            Value<String?> imageUrl = const Value.absent(),
            Value<String> sourceName = const Value.absent(),
            Value<DateTime> publishedAt = const Value.absent(),
            Value<DateTime> cachedAt = const Value.absent(),
            Value<String> category = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              NewsArticlesCompanion(
            id: id,
            title: title,
            description: description,
            url: url,
            imageUrl: imageUrl,
            sourceName: sourceName,
            publishedAt: publishedAt,
            cachedAt: cachedAt,
            category: category,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String title,
            Value<String?> description = const Value.absent(),
            required String url,
            Value<String?> imageUrl = const Value.absent(),
            required String sourceName,
            required DateTime publishedAt,
            required DateTime cachedAt,
            required String category,
            Value<int> rowid = const Value.absent(),
          }) =>
              NewsArticlesCompanion.insert(
            id: id,
            title: title,
            description: description,
            url: url,
            imageUrl: imageUrl,
            sourceName: sourceName,
            publishedAt: publishedAt,
            cachedAt: cachedAt,
            category: category,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$NewsArticlesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $NewsArticlesTable,
    NewsArticle,
    $$NewsArticlesTableFilterComposer,
    $$NewsArticlesTableOrderingComposer,
    $$NewsArticlesTableAnnotationComposer,
    $$NewsArticlesTableCreateCompanionBuilder,
    $$NewsArticlesTableUpdateCompanionBuilder,
    (
      NewsArticle,
      BaseReferences<_$AppDatabase, $NewsArticlesTable, NewsArticle>
    ),
    NewsArticle,
    PrefetchHooks Function()>;
typedef $$ChatMessagesTableCreateCompanionBuilder = ChatMessagesCompanion
    Function({
  Value<int> id,
  required String content,
  required String role,
  required DateTime timestamp,
  Value<bool> isError,
});
typedef $$ChatMessagesTableUpdateCompanionBuilder = ChatMessagesCompanion
    Function({
  Value<int> id,
  Value<String> content,
  Value<String> role,
  Value<DateTime> timestamp,
  Value<bool> isError,
});

class $$ChatMessagesTableFilterComposer
    extends Composer<_$AppDatabase, $ChatMessagesTable> {
  $$ChatMessagesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get content => $composableBuilder(
      column: $table.content, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get role => $composableBuilder(
      column: $table.role, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get timestamp => $composableBuilder(
      column: $table.timestamp, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isError => $composableBuilder(
      column: $table.isError, builder: (column) => ColumnFilters(column));
}

class $$ChatMessagesTableOrderingComposer
    extends Composer<_$AppDatabase, $ChatMessagesTable> {
  $$ChatMessagesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get content => $composableBuilder(
      column: $table.content, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get role => $composableBuilder(
      column: $table.role, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get timestamp => $composableBuilder(
      column: $table.timestamp, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isError => $composableBuilder(
      column: $table.isError, builder: (column) => ColumnOrderings(column));
}

class $$ChatMessagesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ChatMessagesTable> {
  $$ChatMessagesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<String> get role =>
      $composableBuilder(column: $table.role, builder: (column) => column);

  GeneratedColumn<DateTime> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);

  GeneratedColumn<bool> get isError =>
      $composableBuilder(column: $table.isError, builder: (column) => column);
}

class $$ChatMessagesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ChatMessagesTable,
    ChatMessage,
    $$ChatMessagesTableFilterComposer,
    $$ChatMessagesTableOrderingComposer,
    $$ChatMessagesTableAnnotationComposer,
    $$ChatMessagesTableCreateCompanionBuilder,
    $$ChatMessagesTableUpdateCompanionBuilder,
    (
      ChatMessage,
      BaseReferences<_$AppDatabase, $ChatMessagesTable, ChatMessage>
    ),
    ChatMessage,
    PrefetchHooks Function()> {
  $$ChatMessagesTableTableManager(_$AppDatabase db, $ChatMessagesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ChatMessagesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ChatMessagesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ChatMessagesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> content = const Value.absent(),
            Value<String> role = const Value.absent(),
            Value<DateTime> timestamp = const Value.absent(),
            Value<bool> isError = const Value.absent(),
          }) =>
              ChatMessagesCompanion(
            id: id,
            content: content,
            role: role,
            timestamp: timestamp,
            isError: isError,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String content,
            required String role,
            required DateTime timestamp,
            Value<bool> isError = const Value.absent(),
          }) =>
              ChatMessagesCompanion.insert(
            id: id,
            content: content,
            role: role,
            timestamp: timestamp,
            isError: isError,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ChatMessagesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ChatMessagesTable,
    ChatMessage,
    $$ChatMessagesTableFilterComposer,
    $$ChatMessagesTableOrderingComposer,
    $$ChatMessagesTableAnnotationComposer,
    $$ChatMessagesTableCreateCompanionBuilder,
    $$ChatMessagesTableUpdateCompanionBuilder,
    (
      ChatMessage,
      BaseReferences<_$AppDatabase, $ChatMessagesTable, ChatMessage>
    ),
    ChatMessage,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CardsTableTableManager get cards =>
      $$CardsTableTableManager(_db, _db.cards);
  $$WeightEntriesTableTableManager get weightEntries =>
      $$WeightEntriesTableTableManager(_db, _db.weightEntries);
  $$TransactionsTableTableManager get transactions =>
      $$TransactionsTableTableManager(_db, _db.transactions);
  $$RicePricesTableTableManager get ricePrices =>
      $$RicePricesTableTableManager(_db, _db.ricePrices);
  $$NewsArticlesTableTableManager get newsArticles =>
      $$NewsArticlesTableTableManager(_db, _db.newsArticles);
  $$ChatMessagesTableTableManager get chatMessages =>
      $$ChatMessagesTableTableManager(_db, _db.chatMessages);
}
