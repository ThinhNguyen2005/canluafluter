import 'package:drift/drift.dart';
import '../../../database/app_database.dart';
import '../../../core/utils/rice_calculator.dart';

class WeighingRepository {
  final AppDatabase _db;

  WeighingRepository(this._db);

  // --- Card Queries & Streams ---

  /// Watch all active (non-deleted) weighing cards
  Stream<List<RiceCard>> watchActiveCards() {
    return (_db.select(_db.cards)
          ..where((c) => c.isDeleted.equals(false))
          ..orderBy([(c) => OrderingTerm(expression: c.date, mode: OrderingMode.desc)]))
        .watch();
  }

  /// Watch a specific weighing card
  Stream<RiceCard> watchCard(int id) {
    return (_db.select(_db.cards)..where((c) => c.id.equals(id))).watchSingle();
  }

  /// Get a single card by ID (one-shot Future)
  Future<RiceCard> getCard(int id) {
    return (_db.select(_db.cards)..where((c) => c.id.equals(id))).getSingle();
  }

  /// Get all soft-deleted cards (trash list)
  Future<List<RiceCard>> getDeletedCards() {
    return (_db.select(_db.cards)
          ..where((c) => c.isDeleted.equals(true))
          ..orderBy([(c) => OrderingTerm(expression: c.date, mode: OrderingMode.desc)]))
        .get();
  }

  // --- Weight Entry Queries ---

  /// Watch all weight entries for a card
  Stream<List<WeightEntry>> watchWeightEntries(int cardId) {
    return (_db.select(_db.weightEntries)
          ..where((e) => e.cardId.equals(cardId))
          ..orderBy([(e) => OrderingTerm(expression: e.timestamp, mode: OrderingMode.desc)]))
        .watch();
  }

  /// Get all weight entries for a card
  Future<List<WeightEntry>> getWeightEntries(int cardId) {
    return (_db.select(_db.weightEntries)
          ..where((e) => e.cardId.equals(cardId))
          ..orderBy([(e) => OrderingTerm(expression: e.timestamp, mode: OrderingMode.asc)]))
        .get();
  }

  // --- Card Operations ---

  /// Create a new card
  Future<int> createCard(CardsCompanion companion) async {
    return _db.transaction(() async {
      final cardId = await _db.into(_db.cards).insert(companion);

      // If deposit > 0, record deposit transaction
      final deposit = companion.depositAmount.value;
      if (deposit > 0) {
        await _db.into(_db.transactions).insert(
              TransactionsCompanion.insert(
                cardId: cardId,
                amount: deposit,
                type: 'DEPOSIT',
                description: Value('Tiền đặt cọc khi tạo phiếu'),
                date: companion.date.value,
              ),
            );
      }

      await _recalculateCard(cardId);
      return cardId;
    });
  }

  /// Update an existing card's details and trigger recalculation
  Future<void> updateCard(int cardId, CardsCompanion companion) async {
    await _db.transaction(() async {
      await (_db.update(_db.cards)..where((c) => c.id.equals(cardId))).write(companion);
      await _recalculateCard(cardId);
    });
  }

  /// Soft delete a card (move to trash)
  Future<void> deleteCard(int cardId) async {
    await (_db.update(_db.cards)..where((c) => c.id.equals(cardId))).write(
      const CardsCompanion(isDeleted: Value(true)),
    );
  }

  /// Restore a card from trash
  Future<void> restoreCard(int cardId) async {
    await (_db.update(_db.cards)..where((c) => c.id.equals(cardId))).write(
      const CardsCompanion(isDeleted: Value(false)),
    );
  }

  /// Permanently delete a card from database (cascades to weight entries and transactions)
  Future<void> permanentlyDeleteCard(int cardId) async {
    await (_db.delete(_db.cards)..where((c) => c.id.equals(cardId))).go();
  }

  // --- Weight Entry Operations ---

  /// Add a new weight entry and recalculate the card aggregates
  Future<int> addWeightEntry(int cardId, double weight) async {
    return _db.transaction(() async {
      // Calculate weight-specific metrics if they apply (like sampling bag weight)
      // Here, each entry represents a single bag.
      // 2. Insert weight entry
      final entryId = await _db.into(_db.weightEntries).insert(
            WeightEntriesCompanion.insert(
              cardId: cardId,
              weight: weight,
              timestamp: DateTime.now(),
            ),
          );

      // 3. Recalculate aggregates
      await _recalculateCard(cardId);
      return entryId;
    });
  }

  /// Update an existing weight entry and recalculate aggregates
  Future<void> updateWeightEntry(int entryId, int cardId, double weight) async {
    await _db.transaction(() async {
      await (_db.update(_db.weightEntries)..where((e) => e.id.equals(entryId))).write(
        WeightEntriesCompanion(weight: Value(weight)),
      );
      await _recalculateCard(cardId);
    });
  }

  /// Delete a weight entry and recalculate card aggregates
  Future<void> deleteWeightEntry(int entryId, int cardId) async {
    await _db.transaction(() async {
      await (_db.delete(_db.weightEntries)..where((e) => e.id.equals(entryId))).go();
      await _recalculateCard(cardId);
    });
  }

  // --- Transaction Operations ---

  /// Get all financial transactions for a card
  Future<List<Transaction>> getTransactions(int cardId) {
    return (_db.select(_db.transactions)
          ..where((t) => t.cardId.equals(cardId))
          ..orderBy([(t) => OrderingTerm(expression: t.date, mode: OrderingMode.asc)]))
        .get();
  }

  /// Record a payment, deposit, or refund transaction
  Future<int> addTransaction({
    required int cardId,
    required double amount,
    required String type, // 'DEPOSIT', 'PAYMENT', 'REFUND'
    String? description,
  }) async {
    return _db.transaction(() async {
      final id = await _db.into(_db.transactions).insert(
            TransactionsCompanion.insert(
              cardId: cardId,
              amount: amount,
              type: type,
              description: Value(description),
              date: DateTime.now(),
            ),
          );

      await _recalculateCard(cardId);
      return id;
    });
  }

  /// Delete a transaction and recalculate
  Future<void> deleteTransaction(int transactionId, int cardId) async {
    await _db.transaction(() async {
      await (_db.delete(_db.transactions)..where((t) => t.id.equals(transactionId))).go();
      await _recalculateCard(cardId);
    });
  }

  // --- Private Helper Recalculation Engine ---

  /// Recalculate all computed fields of a card
  Future<void> _recalculateCard(int cardId) async {
    // 1. Fetch current card details
    final card = await getCard(cardId);

    // 2. Fetch all weight entries
    final entries = await getWeightEntries(cardId);
    final bagCount = entries.length;
    final totalWeight = entries.fold<double>(0.0, (sum, e) => sum + e.weight);

    // 3. Fetch all transactions to compute paid and deposit amounts
    final txs = await getTransactions(cardId);
    
    double depositAmount = 0.0;
    double paidAmount = 0.0;

    for (final tx in txs) {
      if (tx.type == 'DEPOSIT') {
        depositAmount += tx.amount;
      } else if (tx.type == 'PAYMENT') {
        paidAmount += tx.amount;
      } else if (tx.type == 'REFUND') {
        paidAmount -= tx.amount; // Refund reduces the paid amount
      }
    }

    // 4. Run RiceCalculator
    final calc = RiceCalculator.calculateAll(
      totalWeight: totalWeight,
      bagCount: bagCount,
      pricePerKg: card.pricePerKg,
      depositAmount: depositAmount,
      paidAmount: paidAmount,
      bagMethodIsSampling: card.bagMethodIsSampling,
      bagWeightPerUnit: card.bagWeightPerUnit,
      bagSampleCount: card.bagSampleCount,
      bagSampleTotalWeight: card.bagSampleTotalWeight,
      impurityIsPercent: card.impurityIsPercent,
      impurityFixed: card.impurityFixed,
      impurityPercent: card.impurityPercent,
      moisturePercent: card.moisturePercent,
    );

    // 5. Update Card row with calculated figures
    final isPaid = calc.remainingAmount <= 0 && calc.totalAmount > 0;
    
    await (_db.update(_db.cards)..where((c) => c.id.equals(cardId))).write(
      CardsCompanion(
        totalWeight: Value(calc.totalWeight),
        bagCount: Value(calc.bagCount),
        bagWeight: Value(calc.totalBagWeight),
        impurityWeight: Value(calc.impurityWeight),
        netWeight: Value(calc.netWeight),
        totalAmount: Value(calc.totalAmount),
        depositAmount: Value(depositAmount),
        paidAmount: Value(paidAmount),
        remainingAmount: Value(calc.remainingAmount),
        isPaid: Value(isPaid),
        lastModified: Value(DateTime.now()),
      ),
    );
  }
}
