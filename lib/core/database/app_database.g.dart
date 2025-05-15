// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $TestTableTable extends TestTable
    with TableInfo<$TestTableTable, TestTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TestTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [category, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'test_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<TestTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {category, name};
  @override
  TestTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TestTableData(
      category:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}category'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
    );
  }

  @override
  $TestTableTable createAlias(String alias) {
    return $TestTableTable(attachedDatabase, alias);
  }
}

class TestTableData extends DataClass implements Insertable<TestTableData> {
  final String category;
  final String name;
  const TestTableData({required this.category, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['category'] = Variable<String>(category);
    map['name'] = Variable<String>(name);
    return map;
  }

  TestTableCompanion toCompanion(bool nullToAbsent) {
    return TestTableCompanion(category: Value(category), name: Value(name));
  }

  factory TestTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TestTableData(
      category: serializer.fromJson<String>(json['category']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'category': serializer.toJson<String>(category),
      'name': serializer.toJson<String>(name),
    };
  }

  TestTableData copyWith({String? category, String? name}) => TestTableData(
    category: category ?? this.category,
    name: name ?? this.name,
  );
  TestTableData copyWithCompanion(TestTableCompanion data) {
    return TestTableData(
      category: data.category.present ? data.category.value : this.category,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TestTableData(')
          ..write('category: $category, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(category, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TestTableData &&
          other.category == this.category &&
          other.name == this.name);
}

class TestTableCompanion extends UpdateCompanion<TestTableData> {
  final Value<String> category;
  final Value<String> name;
  final Value<int> rowid;
  const TestTableCompanion({
    this.category = const Value.absent(),
    this.name = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TestTableCompanion.insert({
    required String category,
    required String name,
    this.rowid = const Value.absent(),
  }) : category = Value(category),
       name = Value(name);
  static Insertable<TestTableData> custom({
    Expression<String>? category,
    Expression<String>? name,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (category != null) 'category': category,
      if (name != null) 'name': name,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TestTableCompanion copyWith({
    Value<String>? category,
    Value<String>? name,
    Value<int>? rowid,
  }) {
    return TestTableCompanion(
      category: category ?? this.category,
      name: name ?? this.name,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TestTableCompanion(')
          ..write('category: $category, ')
          ..write('name: $name, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $QuestionTableTable extends QuestionTable
    with TableInfo<$QuestionTableTable, QuestionEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $QuestionTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _testCategoryMeta = const VerificationMeta(
    'testCategory',
  );
  @override
  late final GeneratedColumn<String> testCategory = GeneratedColumn<String>(
    'test_category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _testNameMeta = const VerificationMeta(
    'testName',
  );
  @override
  late final GeneratedColumn<String> testName = GeneratedColumn<String>(
    'test_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
    'image',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _questionMeta = const VerificationMeta(
    'question',
  );
  @override
  late final GeneratedColumn<String> question = GeneratedColumn<String>(
    'question',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> answers =
      GeneratedColumn<String>(
        'answers',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<List<String>>($QuestionTableTable.$converteranswers);
  static const VerificationMeta _correctMeta = const VerificationMeta(
    'correct',
  );
  @override
  late final GeneratedColumn<int> correct = GeneratedColumn<int>(
    'correct',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _answerMeta = const VerificationMeta('answer');
  @override
  late final GeneratedColumn<int> answer = GeneratedColumn<int>(
    'answer',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    testCategory,
    testName,
    image,
    question,
    answers,
    correct,
    answer,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'question_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<QuestionEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('test_category')) {
      context.handle(
        _testCategoryMeta,
        testCategory.isAcceptableOrUnknown(
          data['test_category']!,
          _testCategoryMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_testCategoryMeta);
    }
    if (data.containsKey('test_name')) {
      context.handle(
        _testNameMeta,
        testName.isAcceptableOrUnknown(data['test_name']!, _testNameMeta),
      );
    } else if (isInserting) {
      context.missing(_testNameMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
        _imageMeta,
        image.isAcceptableOrUnknown(data['image']!, _imageMeta),
      );
    }
    if (data.containsKey('question')) {
      context.handle(
        _questionMeta,
        question.isAcceptableOrUnknown(data['question']!, _questionMeta),
      );
    } else if (isInserting) {
      context.missing(_questionMeta);
    }
    if (data.containsKey('correct')) {
      context.handle(
        _correctMeta,
        correct.isAcceptableOrUnknown(data['correct']!, _correctMeta),
      );
    } else if (isInserting) {
      context.missing(_correctMeta);
    }
    if (data.containsKey('answer')) {
      context.handle(
        _answerMeta,
        answer.isAcceptableOrUnknown(data['answer']!, _answerMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {testCategory, testName, question};
  @override
  QuestionEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return QuestionEntity.fromRow(
      image: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image'],
      ),
      question:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}question'],
          )!,
      answers: $QuestionTableTable.$converteranswers.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}answers'],
        )!,
      ),
      correct:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}correct'],
          )!,
      answer: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}answer'],
      ),
    );
  }

  @override
  $QuestionTableTable createAlias(String alias) {
    return $QuestionTableTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $converteranswers =
      const ListConverter();
}

class QuestionTableCompanion extends UpdateCompanion<QuestionEntity> {
  final Value<String> testCategory;
  final Value<String> testName;
  final Value<String?> image;
  final Value<String> question;
  final Value<List<String>> answers;
  final Value<int> correct;
  final Value<int?> answer;
  final Value<int> rowid;
  const QuestionTableCompanion({
    this.testCategory = const Value.absent(),
    this.testName = const Value.absent(),
    this.image = const Value.absent(),
    this.question = const Value.absent(),
    this.answers = const Value.absent(),
    this.correct = const Value.absent(),
    this.answer = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  QuestionTableCompanion.insert({
    required String testCategory,
    required String testName,
    this.image = const Value.absent(),
    required String question,
    required List<String> answers,
    required int correct,
    this.answer = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : testCategory = Value(testCategory),
       testName = Value(testName),
       question = Value(question),
       answers = Value(answers),
       correct = Value(correct);
  static Insertable<QuestionEntity> custom({
    Expression<String>? testCategory,
    Expression<String>? testName,
    Expression<String>? image,
    Expression<String>? question,
    Expression<String>? answers,
    Expression<int>? correct,
    Expression<int>? answer,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (testCategory != null) 'test_category': testCategory,
      if (testName != null) 'test_name': testName,
      if (image != null) 'image': image,
      if (question != null) 'question': question,
      if (answers != null) 'answers': answers,
      if (correct != null) 'correct': correct,
      if (answer != null) 'answer': answer,
      if (rowid != null) 'rowid': rowid,
    });
  }

  QuestionTableCompanion copyWith({
    Value<String>? testCategory,
    Value<String>? testName,
    Value<String?>? image,
    Value<String>? question,
    Value<List<String>>? answers,
    Value<int>? correct,
    Value<int?>? answer,
    Value<int>? rowid,
  }) {
    return QuestionTableCompanion(
      testCategory: testCategory ?? this.testCategory,
      testName: testName ?? this.testName,
      image: image ?? this.image,
      question: question ?? this.question,
      answers: answers ?? this.answers,
      correct: correct ?? this.correct,
      answer: answer ?? this.answer,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (testCategory.present) {
      map['test_category'] = Variable<String>(testCategory.value);
    }
    if (testName.present) {
      map['test_name'] = Variable<String>(testName.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (question.present) {
      map['question'] = Variable<String>(question.value);
    }
    if (answers.present) {
      map['answers'] = Variable<String>(
        $QuestionTableTable.$converteranswers.toSql(answers.value),
      );
    }
    if (correct.present) {
      map['correct'] = Variable<int>(correct.value);
    }
    if (answer.present) {
      map['answer'] = Variable<int>(answer.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('QuestionTableCompanion(')
          ..write('testCategory: $testCategory, ')
          ..write('testName: $testName, ')
          ..write('image: $image, ')
          ..write('question: $question, ')
          ..write('answers: $answers, ')
          ..write('correct: $correct, ')
          ..write('answer: $answer, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SettingsTableTable extends SettingsTable
    with TableInfo<$SettingsTableTable, SettingsEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SettingsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _isPushEnabledMeta = const VerificationMeta(
    'isPushEnabled',
  );
  @override
  late final GeneratedColumn<bool> isPushEnabled = GeneratedColumn<bool>(
    'is_push_enabled',
    aliasedName,
    true,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_push_enabled" IN (0, 1))',
    ),
  );
  static const VerificationMeta _stateMeta = const VerificationMeta('state');
  @override
  late final GeneratedColumn<String> state = GeneratedColumn<String>(
    'state',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _licenseMeta = const VerificationMeta(
    'license',
  );
  @override
  late final GeneratedColumn<String> license = GeneratedColumn<String>(
    'license',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, isPushEnabled, state, license];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'settings_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<SettingsEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('is_push_enabled')) {
      context.handle(
        _isPushEnabledMeta,
        isPushEnabled.isAcceptableOrUnknown(
          data['is_push_enabled']!,
          _isPushEnabledMeta,
        ),
      );
    }
    if (data.containsKey('state')) {
      context.handle(
        _stateMeta,
        state.isAcceptableOrUnknown(data['state']!, _stateMeta),
      );
    }
    if (data.containsKey('license')) {
      context.handle(
        _licenseMeta,
        license.isAcceptableOrUnknown(data['license']!, _licenseMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SettingsEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SettingsEntity.fromRow(
      isPushEnabled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_push_enabled'],
      ),
      state: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}state'],
      ),
      license: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}license'],
      ),
    );
  }

  @override
  $SettingsTableTable createAlias(String alias) {
    return $SettingsTableTable(attachedDatabase, alias);
  }
}

class SettingsTableCompanion extends UpdateCompanion<SettingsEntity> {
  final Value<int> id;
  final Value<bool?> isPushEnabled;
  final Value<String?> state;
  final Value<String?> license;
  const SettingsTableCompanion({
    this.id = const Value.absent(),
    this.isPushEnabled = const Value.absent(),
    this.state = const Value.absent(),
    this.license = const Value.absent(),
  });
  SettingsTableCompanion.insert({
    this.id = const Value.absent(),
    this.isPushEnabled = const Value.absent(),
    this.state = const Value.absent(),
    this.license = const Value.absent(),
  });
  static Insertable<SettingsEntity> custom({
    Expression<int>? id,
    Expression<bool>? isPushEnabled,
    Expression<String>? state,
    Expression<String>? license,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (isPushEnabled != null) 'is_push_enabled': isPushEnabled,
      if (state != null) 'state': state,
      if (license != null) 'license': license,
    });
  }

  SettingsTableCompanion copyWith({
    Value<int>? id,
    Value<bool?>? isPushEnabled,
    Value<String?>? state,
    Value<String?>? license,
  }) {
    return SettingsTableCompanion(
      id: id ?? this.id,
      isPushEnabled: isPushEnabled ?? this.isPushEnabled,
      state: state ?? this.state,
      license: license ?? this.license,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (isPushEnabled.present) {
      map['is_push_enabled'] = Variable<bool>(isPushEnabled.value);
    }
    if (state.present) {
      map['state'] = Variable<String>(state.value);
    }
    if (license.present) {
      map['license'] = Variable<String>(license.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SettingsTableCompanion(')
          ..write('id: $id, ')
          ..write('isPushEnabled: $isPushEnabled, ')
          ..write('state: $state, ')
          ..write('license: $license')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $TestTableTable testTable = $TestTableTable(this);
  late final $QuestionTableTable questionTable = $QuestionTableTable(this);
  late final $SettingsTableTable settingsTable = $SettingsTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    testTable,
    questionTable,
    settingsTable,
  ];
}

typedef $$TestTableTableCreateCompanionBuilder =
    TestTableCompanion Function({
      required String category,
      required String name,
      Value<int> rowid,
    });
typedef $$TestTableTableUpdateCompanionBuilder =
    TestTableCompanion Function({
      Value<String> category,
      Value<String> name,
      Value<int> rowid,
    });

class $$TestTableTableFilterComposer
    extends Composer<_$AppDatabase, $TestTableTable> {
  $$TestTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TestTableTableOrderingComposer
    extends Composer<_$AppDatabase, $TestTableTable> {
  $$TestTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TestTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $TestTableTable> {
  $$TestTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);
}

class $$TestTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TestTableTable,
          TestTableData,
          $$TestTableTableFilterComposer,
          $$TestTableTableOrderingComposer,
          $$TestTableTableAnnotationComposer,
          $$TestTableTableCreateCompanionBuilder,
          $$TestTableTableUpdateCompanionBuilder,
          (
            TestTableData,
            BaseReferences<_$AppDatabase, $TestTableTable, TestTableData>,
          ),
          TestTableData,
          PrefetchHooks Function()
        > {
  $$TestTableTableTableManager(_$AppDatabase db, $TestTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$TestTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$TestTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$TestTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> category = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TestTableCompanion(
                category: category,
                name: name,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String category,
                required String name,
                Value<int> rowid = const Value.absent(),
              }) => TestTableCompanion.insert(
                category: category,
                name: name,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TestTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TestTableTable,
      TestTableData,
      $$TestTableTableFilterComposer,
      $$TestTableTableOrderingComposer,
      $$TestTableTableAnnotationComposer,
      $$TestTableTableCreateCompanionBuilder,
      $$TestTableTableUpdateCompanionBuilder,
      (
        TestTableData,
        BaseReferences<_$AppDatabase, $TestTableTable, TestTableData>,
      ),
      TestTableData,
      PrefetchHooks Function()
    >;
typedef $$QuestionTableTableCreateCompanionBuilder =
    QuestionTableCompanion Function({
      required String testCategory,
      required String testName,
      Value<String?> image,
      required String question,
      required List<String> answers,
      required int correct,
      Value<int?> answer,
      Value<int> rowid,
    });
typedef $$QuestionTableTableUpdateCompanionBuilder =
    QuestionTableCompanion Function({
      Value<String> testCategory,
      Value<String> testName,
      Value<String?> image,
      Value<String> question,
      Value<List<String>> answers,
      Value<int> correct,
      Value<int?> answer,
      Value<int> rowid,
    });

class $$QuestionTableTableFilterComposer
    extends Composer<_$AppDatabase, $QuestionTableTable> {
  $$QuestionTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get testCategory => $composableBuilder(
    column: $table.testCategory,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get testName => $composableBuilder(
    column: $table.testName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get image => $composableBuilder(
    column: $table.image,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get question => $composableBuilder(
    column: $table.question,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
  get answers => $composableBuilder(
    column: $table.answers,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<int> get correct => $composableBuilder(
    column: $table.correct,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get answer => $composableBuilder(
    column: $table.answer,
    builder: (column) => ColumnFilters(column),
  );
}

class $$QuestionTableTableOrderingComposer
    extends Composer<_$AppDatabase, $QuestionTableTable> {
  $$QuestionTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get testCategory => $composableBuilder(
    column: $table.testCategory,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get testName => $composableBuilder(
    column: $table.testName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get image => $composableBuilder(
    column: $table.image,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get question => $composableBuilder(
    column: $table.question,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get answers => $composableBuilder(
    column: $table.answers,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get correct => $composableBuilder(
    column: $table.correct,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get answer => $composableBuilder(
    column: $table.answer,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$QuestionTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $QuestionTableTable> {
  $$QuestionTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get testCategory => $composableBuilder(
    column: $table.testCategory,
    builder: (column) => column,
  );

  GeneratedColumn<String> get testName =>
      $composableBuilder(column: $table.testName, builder: (column) => column);

  GeneratedColumn<String> get image =>
      $composableBuilder(column: $table.image, builder: (column) => column);

  GeneratedColumn<String> get question =>
      $composableBuilder(column: $table.question, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get answers =>
      $composableBuilder(column: $table.answers, builder: (column) => column);

  GeneratedColumn<int> get correct =>
      $composableBuilder(column: $table.correct, builder: (column) => column);

  GeneratedColumn<int> get answer =>
      $composableBuilder(column: $table.answer, builder: (column) => column);
}

class $$QuestionTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $QuestionTableTable,
          QuestionEntity,
          $$QuestionTableTableFilterComposer,
          $$QuestionTableTableOrderingComposer,
          $$QuestionTableTableAnnotationComposer,
          $$QuestionTableTableCreateCompanionBuilder,
          $$QuestionTableTableUpdateCompanionBuilder,
          (
            QuestionEntity,
            BaseReferences<_$AppDatabase, $QuestionTableTable, QuestionEntity>,
          ),
          QuestionEntity,
          PrefetchHooks Function()
        > {
  $$QuestionTableTableTableManager(_$AppDatabase db, $QuestionTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$QuestionTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () =>
                  $$QuestionTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$QuestionTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> testCategory = const Value.absent(),
                Value<String> testName = const Value.absent(),
                Value<String?> image = const Value.absent(),
                Value<String> question = const Value.absent(),
                Value<List<String>> answers = const Value.absent(),
                Value<int> correct = const Value.absent(),
                Value<int?> answer = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => QuestionTableCompanion(
                testCategory: testCategory,
                testName: testName,
                image: image,
                question: question,
                answers: answers,
                correct: correct,
                answer: answer,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String testCategory,
                required String testName,
                Value<String?> image = const Value.absent(),
                required String question,
                required List<String> answers,
                required int correct,
                Value<int?> answer = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => QuestionTableCompanion.insert(
                testCategory: testCategory,
                testName: testName,
                image: image,
                question: question,
                answers: answers,
                correct: correct,
                answer: answer,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$QuestionTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $QuestionTableTable,
      QuestionEntity,
      $$QuestionTableTableFilterComposer,
      $$QuestionTableTableOrderingComposer,
      $$QuestionTableTableAnnotationComposer,
      $$QuestionTableTableCreateCompanionBuilder,
      $$QuestionTableTableUpdateCompanionBuilder,
      (
        QuestionEntity,
        BaseReferences<_$AppDatabase, $QuestionTableTable, QuestionEntity>,
      ),
      QuestionEntity,
      PrefetchHooks Function()
    >;
typedef $$SettingsTableTableCreateCompanionBuilder =
    SettingsTableCompanion Function({
      Value<int> id,
      Value<bool?> isPushEnabled,
      Value<String?> state,
      Value<String?> license,
    });
typedef $$SettingsTableTableUpdateCompanionBuilder =
    SettingsTableCompanion Function({
      Value<int> id,
      Value<bool?> isPushEnabled,
      Value<String?> state,
      Value<String?> license,
    });

class $$SettingsTableTableFilterComposer
    extends Composer<_$AppDatabase, $SettingsTableTable> {
  $$SettingsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isPushEnabled => $composableBuilder(
    column: $table.isPushEnabled,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get state => $composableBuilder(
    column: $table.state,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get license => $composableBuilder(
    column: $table.license,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SettingsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $SettingsTableTable> {
  $$SettingsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isPushEnabled => $composableBuilder(
    column: $table.isPushEnabled,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get state => $composableBuilder(
    column: $table.state,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get license => $composableBuilder(
    column: $table.license,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SettingsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $SettingsTableTable> {
  $$SettingsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<bool> get isPushEnabled => $composableBuilder(
    column: $table.isPushEnabled,
    builder: (column) => column,
  );

  GeneratedColumn<String> get state =>
      $composableBuilder(column: $table.state, builder: (column) => column);

  GeneratedColumn<String> get license =>
      $composableBuilder(column: $table.license, builder: (column) => column);
}

class $$SettingsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SettingsTableTable,
          SettingsEntity,
          $$SettingsTableTableFilterComposer,
          $$SettingsTableTableOrderingComposer,
          $$SettingsTableTableAnnotationComposer,
          $$SettingsTableTableCreateCompanionBuilder,
          $$SettingsTableTableUpdateCompanionBuilder,
          (
            SettingsEntity,
            BaseReferences<_$AppDatabase, $SettingsTableTable, SettingsEntity>,
          ),
          SettingsEntity,
          PrefetchHooks Function()
        > {
  $$SettingsTableTableTableManager(_$AppDatabase db, $SettingsTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$SettingsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () =>
                  $$SettingsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$SettingsTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<bool?> isPushEnabled = const Value.absent(),
                Value<String?> state = const Value.absent(),
                Value<String?> license = const Value.absent(),
              }) => SettingsTableCompanion(
                id: id,
                isPushEnabled: isPushEnabled,
                state: state,
                license: license,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<bool?> isPushEnabled = const Value.absent(),
                Value<String?> state = const Value.absent(),
                Value<String?> license = const Value.absent(),
              }) => SettingsTableCompanion.insert(
                id: id,
                isPushEnabled: isPushEnabled,
                state: state,
                license: license,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SettingsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SettingsTableTable,
      SettingsEntity,
      $$SettingsTableTableFilterComposer,
      $$SettingsTableTableOrderingComposer,
      $$SettingsTableTableAnnotationComposer,
      $$SettingsTableTableCreateCompanionBuilder,
      $$SettingsTableTableUpdateCompanionBuilder,
      (
        SettingsEntity,
        BaseReferences<_$AppDatabase, $SettingsTableTable, SettingsEntity>,
      ),
      SettingsEntity,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$TestTableTableTableManager get testTable =>
      $$TestTableTableTableManager(_db, _db.testTable);
  $$QuestionTableTableTableManager get questionTable =>
      $$QuestionTableTableTableManager(_db, _db.questionTable);
  $$SettingsTableTableTableManager get settingsTable =>
      $$SettingsTableTableTableManager(_db, _db.settingsTable);
}
