import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

part 'app_database.g.dart';

// Определяем таблицу для хранения ключ-значение
class LocalStorageItems extends Table {
  TextColumn get key => text()();
  TextColumn get value => text().nullable()();

  @override
  Set<Column> get primaryKey => {key};
}

// Класс базы данных
@DriftDatabase(tables: [LocalStorageItems])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'local_storage.sqlite'));
    return NativeDatabase(file);
  });
}

// Основной класс LocalStorage
class LocalStorage {
  final AppDatabase _db;

  LocalStorage._(this._db);

  static Future<LocalStorage> create() async {
    final db = AppDatabase();
    return LocalStorage._(db);
  }

  // Сохранить значение по ключу
  Future<void> save(String key, String value) async {
    await _db
        .into(_db.localStorageItems)
        .insertOnConflictUpdate(
          LocalStorageItemsCompanion.insert(key: key, value: Value(value)),
        );
  }

  // Получить значение по ключу
  Future<String?> get(String key) async {
    final item =
        await (_db.select(_db.localStorageItems)
          ..where((tbl) => tbl.key.equals(key))).getSingleOrNull();

    return item?.value;
  }

  // Удалить значение по ключу
  Future<void> delete(String key) async {
    await (_db.delete(_db.localStorageItems)
      ..where((tbl) => tbl.key.equals(key))).go();
  }

  // Закрыть соединение с БД (вызывать при завершении работы)
  Future<void> close() async {
    await _db.close();
  }
}
