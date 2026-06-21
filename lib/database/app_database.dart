import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'app_database.g.dart';

@DataClassName('RiceCard')
class Cards extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get date => dateTime()();
  DateTimeColumn get lastModified => dateTime()();
  TextColumn get name => text()();
  TextColumn get phone => text().nullable()();
  TextColumn get cccd => text().nullable()();
  TextColumn get fieldAddress => text().nullable()();
  TextColumn get traderName => text().withDefault(const Constant(''))();
  TextColumn get riceVariety => text()();
  TextColumn get seasonLabel => text()();
  
  RealColumn get totalWeight => real().withDefault(const Constant(0.0))();
  RealColumn get bagWeight => real().withDefault(const Constant(0.0))();
  RealColumn get impurityWeight => real().withDefault(const Constant(0.0))();
  RealColumn get netWeight => real().withDefault(const Constant(0.0))();
  RealColumn get moisturePercent => real().withDefault(const Constant(0.0))();
  IntColumn get bagCount => integer().withDefault(const Constant(0))();
  
  BoolColumn get bagMethodIsSampling => boolean().withDefault(const Constant(false))();
  IntColumn get bagSampleCount => integer().withDefault(const Constant(0))();
  RealColumn get bagSampleTotalWeight => real().withDefault(const Constant(0.0))();
  RealColumn get bagWeightPerUnit => real().withDefault(const Constant(0.3))();
  BoolColumn get impurityIsPercent => boolean().withDefault(const Constant(false))();
  RealColumn get impurityFixed => real().withDefault(const Constant(0.0))();
  RealColumn get impurityPercent => real().withDefault(const Constant(0.0))();
  TextColumn get weightInputMode => text().withDefault(const Constant('SMALL'))();
  
  RealColumn get pricePerKg => real().withDefault(const Constant(0.0))();
  RealColumn get totalAmount => real().withDefault(const Constant(0.0))();
  RealColumn get depositAmount => real().withDefault(const Constant(0.0))();
  RealColumn get paidAmount => real().withDefault(const Constant(0.0))();
  RealColumn get remainingAmount => real().withDefault(const Constant(0.0))();
  BoolColumn get isPaid => boolean().withDefault(const Constant(false))();
  
  RealColumn get latitude => real().nullable()();
  RealColumn get longitude => real().nullable()();
  BoolColumn get isDeleted => boolean().withDefault(const Constant(false))();
}

class WeightEntries extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get cardId => integer().references(Cards, #id, onDelete: KeyAction.cascade)();
  RealColumn get weight => real()();
  RealColumn get bagWeight => real().withDefault(const Constant(0.0))();
  RealColumn get impurityWeight => real().withDefault(const Constant(0.0))();
  RealColumn get netWeight => real().withDefault(const Constant(0.0))();
  DateTimeColumn get timestamp => dateTime()();
}

class Transactions extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get cardId => integer().references(Cards, #id, onDelete: KeyAction.cascade)();
  RealColumn get amount => real()();
  TextColumn get type => text()(); // 'DEPOSIT', 'PAYMENT', 'REFUND'
  TextColumn get description => text().nullable()();
  DateTimeColumn get date => dateTime()();
}

class RicePrices extends Table {
  TextColumn get id => text()();
  TextColumn get variety => text()();
  RealColumn get priceMin => real()();
  RealColumn get priceMax => real()();
  RealColumn get priceAvg7d => real()();
  TextColumn get region => text()();
  DateTimeColumn get updatedAt => dateTime()();
  TextColumn get trend => text()(); // 'UP', 'DOWN', 'STABLE'
  TextColumn get riceType => text()(); // 'lúa khô', 'lúa ướt', 'gạo tẻ', 'nếp'
  TextColumn get source => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class NewsArticles extends Table {
  TextColumn get id => text()(); // URL hash
  TextColumn get title => text()();
  TextColumn get description => text().nullable()();
  TextColumn get url => text()();
  TextColumn get imageUrl => text().nullable()();
  TextColumn get sourceName => text()();
  DateTimeColumn get publishedAt => dateTime()();
  DateTimeColumn get cachedAt => dateTime()();
  TextColumn get category => text()(); // 'Lúa', 'Gạo', 'Thị trường', 'Khác'

  @override
  Set<Column> get primaryKey => {id};
}

class ChatMessages extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get content => text()();
  TextColumn get role => text()(); // 'user', 'assistant'
  DateTimeColumn get timestamp => dateTime()();
  BoolColumn get isError => boolean().withDefault(const Constant(false))();
}

@DriftDatabase(tables: [Cards, WeightEntries, Transactions, RicePrices, NewsArticles, ChatMessages])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        beforeOpen: (details) async {
          // Enable foreign keys support in SQLite
          await customStatement('PRAGMA foreign_keys = ON');
        },
      );
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'can_lua.db'));
    return NativeDatabase.createInBackground(file);
  });
}
