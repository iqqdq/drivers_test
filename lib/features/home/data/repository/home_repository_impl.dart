import 'package:drift/drift.dart';
import 'package:drivers_test/features/home/domain/domain.dart';
import 'package:drivers_test/core/core.dart';

class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl(this._db);

  final AppDatabase _db;

  @override
  Future<TestEntity> initExam({required String state}) async {
    final jsonData = await _db.loadJsonData(state: state);
    final questionIds = await _db.getRandomUniqueQuestionIds();
    final id = await _db
        .into(_db.tests)
        .insert(
          TestsCompanion.insert(
            state: state,
            isExam: Value(true),
            questionIds: questionIds,
            minPassRatio: jsonData.first.min / jsonData.first.max,
          ),
        );

    final query = _db.select(_db.tests)..where((e) => e.id.equals(id));
    return await query.getSingle();
  }
}
