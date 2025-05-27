import 'package:drift/drift.dart';
import 'package:drivers_test/features/settings/domain/domain.dart';

@UseRowClass(SettingsEntity, constructor: 'fromRow')
class Settings extends Table {
  IntColumn get id => integer().withDefault(const Constant(0))();
  BoolColumn get isPushEnabled => boolean().nullable()();
  TextColumn get state => text().nullable()();
  TextColumn get license => text().nullable()();
  BoolColumn get isOnboardingComplete =>
      boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}
