import 'package:flutter/foundation.dart';
import 'package:drivers_test/core/core.dart';
import 'package:drivers_test/features/testing/domain/domain.dart';

class TestListChangeNotifier with ChangeNotifier {
  List<String>? _categories;
  List<String>? get categories => _categories;

  List<TestEntity>? _tests;
  List<TestEntity>? get tests => _tests;

  String? _category;
  String? get category => _category;

  Future getTests({required String? category}) async {
    _tests = await sl.get<TestingRepository>().getTests(category);
    if (_categories == null) {
      _categories = _tests?.map((e) => e.category).toList();
      _categories?.insert(0, 'All tests');
    }
    _category = category ?? _categories?.first;
    notifyListeners();
  }
}
