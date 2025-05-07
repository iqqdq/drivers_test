import 'dart:convert';
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

  // Закрыть соединение с БД (вызывать при завершении работы)
  Future<void> close() async {
    await _db.close();
  }

  /// Сохраняет данные любого типа (T), которые можно сериализовать в String.
  Future<void> save<T>(String key, T value) async {
    final stringValue = _serialize(value); // Сериализация в String
    await _db
        .into(_db.localStorageItems)
        .insertOnConflictUpdate(
          LocalStorageItemsCompanion.insert(
            key: key,
            value: Value(stringValue),
          ),
        );
  }

  /// Получает данные типа T (десериализует из String).
  Future<T?> get<T>(String key) async {
    final item =
        await (_db.select(_db.localStorageItems)
          ..where((tbl) => tbl.key.equals(key))).getSingleOrNull();

    return item?.value != null ? _deserialize<T>(item!.value!) : null;
  }

  /// Удаляет данные по ключу.
  Future<void> delete(String key) async {
    await (_db.delete(_db.localStorageItems)
      ..where((tbl) => tbl.key.equals(key))).go();
  }

  // Приватные методы для сериализации/десериализации
  String _serialize<T>(T value) {
    if (value is String) return value;
    if (value is int || value is double || value is bool) {
      return value.toString();
    }
    if (value is Map || value is List) {
      return json.encode(value);
    }
    throw ArgumentError('Unsupported type for serialization');
  }

  T _deserialize<T>(String value) {
    if (T == String) return value as T;
    if (T == int) return int.parse(value) as T;
    if (T == double) return double.parse(value) as T;
    if (T == bool) return (value.toLowerCase() == 'true') as T;
    if (T == Map || T == List) {
      return json.decode(value) as T;
    }
    if (T == Map<String, dynamic>) {
      final decoded = json.decode(value) as Map;
      return decoded.cast<String, dynamic>() as T;
    }

    throw ArgumentError('Unsupported type for deserialization');
  }
}
