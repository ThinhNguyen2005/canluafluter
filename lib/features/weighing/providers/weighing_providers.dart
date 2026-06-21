import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../database/database_provider.dart';
import '../data/weighing_repository.dart';
import '../../../database/app_database.dart';

final weighingRepositoryProvider = Provider<WeighingRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return WeighingRepository(db);
});

final activeCardsProvider = StreamProvider<List<RiceCard>>((ref) {
  final repo = ref.watch(weighingRepositoryProvider);
  return repo.watchActiveCards();
});

final cardProvider = StreamProvider.family<RiceCard, int>((ref, cardId) {
  final repo = ref.watch(weighingRepositoryProvider);
  return repo.watchCard(cardId);
});

final weightEntriesProvider = StreamProvider.family<List<WeightEntry>, int>((ref, cardId) {
  final repo = ref.watch(weighingRepositoryProvider);
  return repo.watchWeightEntries(cardId);
});
