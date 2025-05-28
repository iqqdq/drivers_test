import 'package:drift/drift.dart';
import 'package:drivers_test/features/home/domain/domain.dart';
import 'package:drivers_test/core/core.dart';

class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl(this._db);

  final AppDatabase _db;

  @override
  Future<TestEntity> initExam({required String state}) async {
    // Загружаем данные из assets
    final jsonData = await _db.loadJsonData(state: state);
    // Получаем новые вопросы штата
    final questionIds = await _db.getRandomUniqueQuestionIds(
      limit: jsonData.first.max,
    );
    // Проверяем, если экзамен для штата уже есть в бд, тогда перезаписываем его с новыми вопросами
    final query =
        await (_db.select(_db.tests)
          ..where((e) => e.state.equals(state) & e.isExam)).getSingleOrNull();
    late final int id;

    if (query == null) {
      id = await _db
          .into(_db.tests)
          .insert(
            TestsCompanion.insert(
              state: state,
              isExam: Value(true),
              questionIds: questionIds,
              minPassRatio: jsonData.first.min / jsonData.first.max,
            ),
          );
    } else {
      id = query.id;
      await _db
          .into(_db.tests)
          .insertOnConflictUpdate(
            TestsCompanion.insert(
              id: Value(query.id),
              state: state,
              isExam: Value(true),
              questionIds: questionIds,
              minPassRatio: jsonData.first.min / jsonData.first.max,
            ),
          );
    }

    final exam =
        await (_db.select(_db.tests)
          ..where((e) => e.id.equals(id))).getSingle();
    return exam;
  }
}
