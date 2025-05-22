// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $TestTableTable extends TestTable
    with TableInfo<$TestTableTable, TestEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TestTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _stateMeta = const VerificationMeta('state');
  @override
  late final GeneratedColumn<String> state = GeneratedColumn<String>(
    'state',
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
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<int> amount = GeneratedColumn<int>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, state, name, amount];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'test_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<TestEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('state')) {
      context.handle(
        _stateMeta,
        state.isAcceptableOrUnknown(data['state']!, _stateMeta),
      );
    } else if (isInserting) {
      context.missing(_stateMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {state, id},
  ];
  @override
  TestEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TestEntity.fromRow(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      state:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}state'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      amount:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}amount'],
          )!,
    );
  }

  @override
  $TestTableTable createAlias(String alias) {
    return $TestTableTable(attachedDatabase, alias);
  }
}

class TestTableCompanion extends UpdateCompanion<TestEntity> {
  final Value<int> id;
  final Value<String> state;
  final Value<String> name;
  final Value<int> amount;
  const TestTableCompanion({
    this.id = const Value.absent(),
    this.state = const Value.absent(),
    this.name = const Value.absent(),
    this.amount = const Value.absent(),
  });
  TestTableCompanion.insert({
    this.id = const Value.absent(),
    required String state,
    required String name,
    required int amount,
  }) : state = Value(state),
       name = Value(name),
       amount = Value(amount);
  static Insertable<TestEntity> custom({
    Expression<int>? id,
    Expression<String>? state,
    Expression<String>? name,
    Expression<int>? amount,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (state != null) 'state': state,
      if (name != null) 'name': name,
      if (amount != null) 'amount': amount,
    });
  }

  TestTableCompanion copyWith({
    Value<int>? id,
    Value<String>? state,
    Value<String>? name,
    Value<int>? amount,
  }) {
    return TestTableCompanion(
      id: id ?? this.id,
      state: state ?? this.state,
      name: name ?? this.name,
      amount: amount ?? this.amount,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (state.present) {
      map['state'] = Variable<String>(state.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TestTableCompanion(')
          ..write('id: $id, ')
          ..write('state: $state, ')
          ..write('name: $name, ')
          ..write('amount: $amount')
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
  static const VerificationMeta _testIdMeta = const VerificationMeta('testId');
  @override
  late final GeneratedColumn<int> testId = GeneratedColumn<int>(
    'test_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES test_table (id)',
    ),
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
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
  late final GeneratedColumnWithTypeConverter<List<String>, String> choices =
      GeneratedColumn<String>(
        'choices',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<List<String>>($QuestionTableTable.$converterchoices);
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
  @override
  List<GeneratedColumn> get $columns => [
    testId,
    id,
    image,
    question,
    choices,
    correct,
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
    if (data.containsKey('test_id')) {
      context.handle(
        _testIdMeta,
        testId.isAcceptableOrUnknown(data['test_id']!, _testIdMeta),
      );
    } else if (isInserting) {
      context.missing(_testIdMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {testId, id},
  ];
  @override
  QuestionEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return QuestionEntity.fromRow(
      testId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}test_id'],
          )!,
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      image: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image'],
      ),
      question:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}question'],
          )!,
      choices: $QuestionTableTable.$converterchoices.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}choices'],
        )!,
      ),
      correct:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}correct'],
          )!,
    );
  }

  @override
  $QuestionTableTable createAlias(String alias) {
    return $QuestionTableTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $converterchoices =
      stringConverter;
}

class QuestionTableCompanion extends UpdateCompanion<QuestionEntity> {
  final Value<int> testId;
  final Value<int> id;
  final Value<String?> image;
  final Value<String> question;
  final Value<List<String>> choices;
  final Value<int> correct;
  const QuestionTableCompanion({
    this.testId = const Value.absent(),
    this.id = const Value.absent(),
    this.image = const Value.absent(),
    this.question = const Value.absent(),
    this.choices = const Value.absent(),
    this.correct = const Value.absent(),
  });
  QuestionTableCompanion.insert({
    required int testId,
    this.id = const Value.absent(),
    this.image = const Value.absent(),
    required String question,
    required List<String> choices,
    required int correct,
  }) : testId = Value(testId),
       question = Value(question),
       choices = Value(choices),
       correct = Value(correct);
  static Insertable<QuestionEntity> custom({
    Expression<int>? testId,
    Expression<int>? id,
    Expression<String>? image,
    Expression<String>? question,
    Expression<String>? choices,
    Expression<int>? correct,
  }) {
    return RawValuesInsertable({
      if (testId != null) 'test_id': testId,
      if (id != null) 'id': id,
      if (image != null) 'image': image,
      if (question != null) 'question': question,
      if (choices != null) 'choices': choices,
      if (correct != null) 'correct': correct,
    });
  }

  QuestionTableCompanion copyWith({
    Value<int>? testId,
    Value<int>? id,
    Value<String?>? image,
    Value<String>? question,
    Value<List<String>>? choices,
    Value<int>? correct,
  }) {
    return QuestionTableCompanion(
      testId: testId ?? this.testId,
      id: id ?? this.id,
      image: image ?? this.image,
      question: question ?? this.question,
      choices: choices ?? this.choices,
      correct: correct ?? this.correct,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (testId.present) {
      map['test_id'] = Variable<int>(testId.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (question.present) {
      map['question'] = Variable<String>(question.value);
    }
    if (choices.present) {
      map['choices'] = Variable<String>(
        $QuestionTableTable.$converterchoices.toSql(choices.value),
      );
    }
    if (correct.present) {
      map['correct'] = Variable<int>(correct.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('QuestionTableCompanion(')
          ..write('testId: $testId, ')
          ..write('id: $id, ')
          ..write('image: $image, ')
          ..write('question: $question, ')
          ..write('choices: $choices, ')
          ..write('correct: $correct')
          ..write(')'))
        .toString();
  }
}

class $ResultTableTable extends ResultTable
    with TableInfo<$ResultTableTable, ResultEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ResultTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _testIdMeta = const VerificationMeta('testId');
  @override
  late final GeneratedColumn<int> testId = GeneratedColumn<int>(
    'test_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES test_table (id)',
    ),
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
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES test_table (name)',
    ),
  );
  static const VerificationMeta _testAmountMeta = const VerificationMeta(
    'testAmount',
  );
  @override
  late final GeneratedColumn<int> testAmount = GeneratedColumn<int>(
    'test_amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES test_table (amount)',
    ),
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  @override
  late final GeneratedColumnWithTypeConverter<List<int>, String> answers =
      GeneratedColumn<String>(
        'answers',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<List<int>>($ResultTableTable.$converteranswers);
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
  static const VerificationMeta _durationInSecondsMeta = const VerificationMeta(
    'durationInSeconds',
  );
  @override
  late final GeneratedColumn<int> durationInSeconds = GeneratedColumn<int>(
    'duration_in_seconds',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _completedAtMeta = const VerificationMeta(
    'completedAt',
  );
  @override
  late final GeneratedColumn<DateTime> completedAt = GeneratedColumn<DateTime>(
    'completed_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    testId,
    testName,
    testAmount,
    id,
    answers,
    correct,
    durationInSeconds,
    completedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'result_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<ResultEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('test_id')) {
      context.handle(
        _testIdMeta,
        testId.isAcceptableOrUnknown(data['test_id']!, _testIdMeta),
      );
    } else if (isInserting) {
      context.missing(_testIdMeta);
    }
    if (data.containsKey('test_name')) {
      context.handle(
        _testNameMeta,
        testName.isAcceptableOrUnknown(data['test_name']!, _testNameMeta),
      );
    } else if (isInserting) {
      context.missing(_testNameMeta);
    }
    if (data.containsKey('test_amount')) {
      context.handle(
        _testAmountMeta,
        testAmount.isAcceptableOrUnknown(data['test_amount']!, _testAmountMeta),
      );
    } else if (isInserting) {
      context.missing(_testAmountMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('correct')) {
      context.handle(
        _correctMeta,
        correct.isAcceptableOrUnknown(data['correct']!, _correctMeta),
      );
    } else if (isInserting) {
      context.missing(_correctMeta);
    }
    if (data.containsKey('duration_in_seconds')) {
      context.handle(
        _durationInSecondsMeta,
        durationInSeconds.isAcceptableOrUnknown(
          data['duration_in_seconds']!,
          _durationInSecondsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_durationInSecondsMeta);
    }
    if (data.containsKey('completed_at')) {
      context.handle(
        _completedAtMeta,
        completedAt.isAcceptableOrUnknown(
          data['completed_at']!,
          _completedAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_completedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {testId, id},
  ];
  @override
  ResultEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ResultEntity.fromRow(
      testId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}test_id'],
          )!,
      testName:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}test_name'],
          )!,
      testAmount:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}test_amount'],
          )!,
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      answers: $ResultTableTable.$converteranswers.fromSql(
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
      durationInSeconds:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}duration_in_seconds'],
          )!,
      completedAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}completed_at'],
          )!,
    );
  }

  @override
  $ResultTableTable createAlias(String alias) {
    return $ResultTableTable(attachedDatabase, alias);
  }

  static TypeConverter<List<int>, String> $converteranswers = intConverter;
}

class ResultTableCompanion extends UpdateCompanion<ResultEntity> {
  final Value<int> testId;
  final Value<String> testName;
  final Value<int> testAmount;
  final Value<int> id;
  final Value<List<int>> answers;
  final Value<int> correct;
  final Value<int> durationInSeconds;
  final Value<DateTime> completedAt;
  const ResultTableCompanion({
    this.testId = const Value.absent(),
    this.testName = const Value.absent(),
    this.testAmount = const Value.absent(),
    this.id = const Value.absent(),
    this.answers = const Value.absent(),
    this.correct = const Value.absent(),
    this.durationInSeconds = const Value.absent(),
    this.completedAt = const Value.absent(),
  });
  ResultTableCompanion.insert({
    required int testId,
    required String testName,
    required int testAmount,
    this.id = const Value.absent(),
    required List<int> answers,
    required int correct,
    required int durationInSeconds,
    required DateTime completedAt,
  }) : testId = Value(testId),
       testName = Value(testName),
       testAmount = Value(testAmount),
       answers = Value(answers),
       correct = Value(correct),
       durationInSeconds = Value(durationInSeconds),
       completedAt = Value(completedAt);
  static Insertable<ResultEntity> custom({
    Expression<int>? testId,
    Expression<String>? testName,
    Expression<int>? testAmount,
    Expression<int>? id,
    Expression<String>? answers,
    Expression<int>? correct,
    Expression<int>? durationInSeconds,
    Expression<DateTime>? completedAt,
  }) {
    return RawValuesInsertable({
      if (testId != null) 'test_id': testId,
      if (testName != null) 'test_name': testName,
      if (testAmount != null) 'test_amount': testAmount,
      if (id != null) 'id': id,
      if (answers != null) 'answers': answers,
      if (correct != null) 'correct': correct,
      if (durationInSeconds != null) 'duration_in_seconds': durationInSeconds,
      if (completedAt != null) 'completed_at': completedAt,
    });
  }

  ResultTableCompanion copyWith({
    Value<int>? testId,
    Value<String>? testName,
    Value<int>? testAmount,
    Value<int>? id,
    Value<List<int>>? answers,
    Value<int>? correct,
    Value<int>? durationInSeconds,
    Value<DateTime>? completedAt,
  }) {
    return ResultTableCompanion(
      testId: testId ?? this.testId,
      testName: testName ?? this.testName,
      testAmount: testAmount ?? this.testAmount,
      id: id ?? this.id,
      answers: answers ?? this.answers,
      correct: correct ?? this.correct,
      durationInSeconds: durationInSeconds ?? this.durationInSeconds,
      completedAt: completedAt ?? this.completedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (testId.present) {
      map['test_id'] = Variable<int>(testId.value);
    }
    if (testName.present) {
      map['test_name'] = Variable<String>(testName.value);
    }
    if (testAmount.present) {
      map['test_amount'] = Variable<int>(testAmount.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (answers.present) {
      map['answers'] = Variable<String>(
        $ResultTableTable.$converteranswers.toSql(answers.value),
      );
    }
    if (correct.present) {
      map['correct'] = Variable<int>(correct.value);
    }
    if (durationInSeconds.present) {
      map['duration_in_seconds'] = Variable<int>(durationInSeconds.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<DateTime>(completedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ResultTableCompanion(')
          ..write('testId: $testId, ')
          ..write('testName: $testName, ')
          ..write('testAmount: $testAmount, ')
          ..write('id: $id, ')
          ..write('answers: $answers, ')
          ..write('correct: $correct, ')
          ..write('durationInSeconds: $durationInSeconds, ')
          ..write('completedAt: $completedAt')
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
  late final $ResultTableTable resultTable = $ResultTableTable(this);
  late final $SettingsTableTable settingsTable = $SettingsTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    testTable,
    questionTable,
    resultTable,
    settingsTable,
  ];
}

typedef $$TestTableTableCreateCompanionBuilder =
    TestTableCompanion Function({
      Value<int> id,
      required String state,
      required String name,
      required int amount,
    });
typedef $$TestTableTableUpdateCompanionBuilder =
    TestTableCompanion Function({
      Value<int> id,
      Value<String> state,
      Value<String> name,
      Value<int> amount,
    });

final class $$TestTableTableReferences
    extends BaseReferences<_$AppDatabase, $TestTableTable, TestEntity> {
  $$TestTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$QuestionTableTable, List<QuestionEntity>>
  _questionTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.questionTable,
    aliasName: $_aliasNameGenerator(db.testTable.id, db.questionTable.testId),
  );

  $$QuestionTableTableProcessedTableManager get questionTableRefs {
    final manager = $$QuestionTableTableTableManager(
      $_db,
      $_db.questionTable,
    ).filter((f) => f.testId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_questionTableRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ResultTableTable, List<ResultEntity>> _by_idTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.resultTable,
    aliasName: $_aliasNameGenerator(db.testTable.id, db.resultTable.testId),
  );

  $$ResultTableTableProcessedTableManager get by_id {
    final manager = $$ResultTableTableTableManager(
      $_db,
      $_db.resultTable,
    ).filter((f) => f.testId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_by_idTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ResultTableTable, List<ResultEntity>>
  _by_nameTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.resultTable,
    aliasName: $_aliasNameGenerator(db.testTable.name, db.resultTable.testName),
  );

  $$ResultTableTableProcessedTableManager get by_name {
    final manager = $$ResultTableTableTableManager(
      $_db,
      $_db.resultTable,
    ).filter((f) => f.testName.name.sqlEquals($_itemColumn<String>('name')!));

    final cache = $_typedResult.readTableOrNull(_by_nameTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ResultTableTable, List<ResultEntity>>
  _by_amountTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.resultTable,
    aliasName: $_aliasNameGenerator(
      db.testTable.amount,
      db.resultTable.testAmount,
    ),
  );

  $$ResultTableTableProcessedTableManager get by_amount {
    final manager = $$ResultTableTableTableManager(
      $_db,
      $_db.resultTable,
    ).filter(
      (f) => f.testAmount.amount.sqlEquals($_itemColumn<int>('amount')!),
    );

    final cache = $_typedResult.readTableOrNull(_by_amountTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$TestTableTableFilterComposer
    extends Composer<_$AppDatabase, $TestTableTable> {
  $$TestTableTableFilterComposer({
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

  ColumnFilters<String> get state => $composableBuilder(
    column: $table.state,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> questionTableRefs(
    Expression<bool> Function($$QuestionTableTableFilterComposer f) f,
  ) {
    final $$QuestionTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.questionTable,
      getReferencedColumn: (t) => t.testId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$QuestionTableTableFilterComposer(
            $db: $db,
            $table: $db.questionTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> by_id(
    Expression<bool> Function($$ResultTableTableFilterComposer f) f,
  ) {
    final $$ResultTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.resultTable,
      getReferencedColumn: (t) => t.testId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ResultTableTableFilterComposer(
            $db: $db,
            $table: $db.resultTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> by_name(
    Expression<bool> Function($$ResultTableTableFilterComposer f) f,
  ) {
    final $$ResultTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.name,
      referencedTable: $db.resultTable,
      getReferencedColumn: (t) => t.testName,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ResultTableTableFilterComposer(
            $db: $db,
            $table: $db.resultTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> by_amount(
    Expression<bool> Function($$ResultTableTableFilterComposer f) f,
  ) {
    final $$ResultTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.amount,
      referencedTable: $db.resultTable,
      getReferencedColumn: (t) => t.testAmount,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ResultTableTableFilterComposer(
            $db: $db,
            $table: $db.resultTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
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
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get state => $composableBuilder(
    column: $table.state,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get amount => $composableBuilder(
    column: $table.amount,
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
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get state =>
      $composableBuilder(column: $table.state, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  Expression<T> questionTableRefs<T extends Object>(
    Expression<T> Function($$QuestionTableTableAnnotationComposer a) f,
  ) {
    final $$QuestionTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.questionTable,
      getReferencedColumn: (t) => t.testId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$QuestionTableTableAnnotationComposer(
            $db: $db,
            $table: $db.questionTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> by_id<T extends Object>(
    Expression<T> Function($$ResultTableTableAnnotationComposer a) f,
  ) {
    final $$ResultTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.resultTable,
      getReferencedColumn: (t) => t.testId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ResultTableTableAnnotationComposer(
            $db: $db,
            $table: $db.resultTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> by_name<T extends Object>(
    Expression<T> Function($$ResultTableTableAnnotationComposer a) f,
  ) {
    final $$ResultTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.name,
      referencedTable: $db.resultTable,
      getReferencedColumn: (t) => t.testName,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ResultTableTableAnnotationComposer(
            $db: $db,
            $table: $db.resultTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> by_amount<T extends Object>(
    Expression<T> Function($$ResultTableTableAnnotationComposer a) f,
  ) {
    final $$ResultTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.amount,
      referencedTable: $db.resultTable,
      getReferencedColumn: (t) => t.testAmount,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ResultTableTableAnnotationComposer(
            $db: $db,
            $table: $db.resultTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TestTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TestTableTable,
          TestEntity,
          $$TestTableTableFilterComposer,
          $$TestTableTableOrderingComposer,
          $$TestTableTableAnnotationComposer,
          $$TestTableTableCreateCompanionBuilder,
          $$TestTableTableUpdateCompanionBuilder,
          (TestEntity, $$TestTableTableReferences),
          TestEntity,
          PrefetchHooks Function({
            bool questionTableRefs,
            bool by_id,
            bool by_name,
            bool by_amount,
          })
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
                Value<int> id = const Value.absent(),
                Value<String> state = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> amount = const Value.absent(),
              }) => TestTableCompanion(
                id: id,
                state: state,
                name: name,
                amount: amount,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String state,
                required String name,
                required int amount,
              }) => TestTableCompanion.insert(
                id: id,
                state: state,
                name: name,
                amount: amount,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$TestTableTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({
            questionTableRefs = false,
            by_id = false,
            by_name = false,
            by_amount = false,
          }) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (questionTableRefs) db.questionTable,
                if (by_id) db.resultTable,
                if (by_name) db.resultTable,
                if (by_amount) db.resultTable,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (questionTableRefs)
                    await $_getPrefetchedData<
                      TestEntity,
                      $TestTableTable,
                      QuestionEntity
                    >(
                      currentTable: table,
                      referencedTable: $$TestTableTableReferences
                          ._questionTableRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$TestTableTableReferences(
                                db,
                                table,
                                p0,
                              ).questionTableRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) =>
                              referencedItems.where((e) => e.testId == item.id),
                      typedResults: items,
                    ),
                  if (by_id)
                    await $_getPrefetchedData<
                      TestEntity,
                      $TestTableTable,
                      ResultEntity
                    >(
                      currentTable: table,
                      referencedTable: $$TestTableTableReferences._by_idTable(
                        db,
                      ),
                      managerFromTypedResult:
                          (p0) =>
                              $$TestTableTableReferences(db, table, p0).by_id,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) =>
                              referencedItems.where((e) => e.testId == item.id),
                      typedResults: items,
                    ),
                  if (by_name)
                    await $_getPrefetchedData<
                      TestEntity,
                      $TestTableTable,
                      ResultEntity
                    >(
                      currentTable: table,
                      referencedTable: $$TestTableTableReferences._by_nameTable(
                        db,
                      ),
                      managerFromTypedResult:
                          (p0) =>
                              $$TestTableTableReferences(db, table, p0).by_name,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.testName == item.name,
                          ),
                      typedResults: items,
                    ),
                  if (by_amount)
                    await $_getPrefetchedData<
                      TestEntity,
                      $TestTableTable,
                      ResultEntity
                    >(
                      currentTable: table,
                      referencedTable: $$TestTableTableReferences
                          ._by_amountTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$TestTableTableReferences(
                                db,
                                table,
                                p0,
                              ).by_amount,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.testAmount == item.amount,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$TestTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TestTableTable,
      TestEntity,
      $$TestTableTableFilterComposer,
      $$TestTableTableOrderingComposer,
      $$TestTableTableAnnotationComposer,
      $$TestTableTableCreateCompanionBuilder,
      $$TestTableTableUpdateCompanionBuilder,
      (TestEntity, $$TestTableTableReferences),
      TestEntity,
      PrefetchHooks Function({
        bool questionTableRefs,
        bool by_id,
        bool by_name,
        bool by_amount,
      })
    >;
typedef $$QuestionTableTableCreateCompanionBuilder =
    QuestionTableCompanion Function({
      required int testId,
      Value<int> id,
      Value<String?> image,
      required String question,
      required List<String> choices,
      required int correct,
    });
typedef $$QuestionTableTableUpdateCompanionBuilder =
    QuestionTableCompanion Function({
      Value<int> testId,
      Value<int> id,
      Value<String?> image,
      Value<String> question,
      Value<List<String>> choices,
      Value<int> correct,
    });

final class $$QuestionTableTableReferences
    extends BaseReferences<_$AppDatabase, $QuestionTableTable, QuestionEntity> {
  $$QuestionTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $TestTableTable _testIdTable(_$AppDatabase db) =>
      db.testTable.createAlias(
        $_aliasNameGenerator(db.questionTable.testId, db.testTable.id),
      );

  $$TestTableTableProcessedTableManager get testId {
    final $_column = $_itemColumn<int>('test_id')!;

    final manager = $$TestTableTableTableManager(
      $_db,
      $_db.testTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_testIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$QuestionTableTableFilterComposer
    extends Composer<_$AppDatabase, $QuestionTableTable> {
  $$QuestionTableTableFilterComposer({
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

  ColumnFilters<String> get image => $composableBuilder(
    column: $table.image,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get question => $composableBuilder(
    column: $table.question,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
  get choices => $composableBuilder(
    column: $table.choices,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<int> get correct => $composableBuilder(
    column: $table.correct,
    builder: (column) => ColumnFilters(column),
  );

  $$TestTableTableFilterComposer get testId {
    final $$TestTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.testId,
      referencedTable: $db.testTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TestTableTableFilterComposer(
            $db: $db,
            $table: $db.testTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
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
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
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

  ColumnOrderings<String> get choices => $composableBuilder(
    column: $table.choices,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get correct => $composableBuilder(
    column: $table.correct,
    builder: (column) => ColumnOrderings(column),
  );

  $$TestTableTableOrderingComposer get testId {
    final $$TestTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.testId,
      referencedTable: $db.testTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TestTableTableOrderingComposer(
            $db: $db,
            $table: $db.testTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
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
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get image =>
      $composableBuilder(column: $table.image, builder: (column) => column);

  GeneratedColumn<String> get question =>
      $composableBuilder(column: $table.question, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get choices =>
      $composableBuilder(column: $table.choices, builder: (column) => column);

  GeneratedColumn<int> get correct =>
      $composableBuilder(column: $table.correct, builder: (column) => column);

  $$TestTableTableAnnotationComposer get testId {
    final $$TestTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.testId,
      referencedTable: $db.testTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TestTableTableAnnotationComposer(
            $db: $db,
            $table: $db.testTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
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
          (QuestionEntity, $$QuestionTableTableReferences),
          QuestionEntity,
          PrefetchHooks Function({bool testId})
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
                Value<int> testId = const Value.absent(),
                Value<int> id = const Value.absent(),
                Value<String?> image = const Value.absent(),
                Value<String> question = const Value.absent(),
                Value<List<String>> choices = const Value.absent(),
                Value<int> correct = const Value.absent(),
              }) => QuestionTableCompanion(
                testId: testId,
                id: id,
                image: image,
                question: question,
                choices: choices,
                correct: correct,
              ),
          createCompanionCallback:
              ({
                required int testId,
                Value<int> id = const Value.absent(),
                Value<String?> image = const Value.absent(),
                required String question,
                required List<String> choices,
                required int correct,
              }) => QuestionTableCompanion.insert(
                testId: testId,
                id: id,
                image: image,
                question: question,
                choices: choices,
                correct: correct,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$QuestionTableTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({testId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                T extends TableManagerState<
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic
                >
              >(state) {
                if (testId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.testId,
                            referencedTable: $$QuestionTableTableReferences
                                ._testIdTable(db),
                            referencedColumn:
                                $$QuestionTableTableReferences
                                    ._testIdTable(db)
                                    .id,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
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
      (QuestionEntity, $$QuestionTableTableReferences),
      QuestionEntity,
      PrefetchHooks Function({bool testId})
    >;
typedef $$ResultTableTableCreateCompanionBuilder =
    ResultTableCompanion Function({
      required int testId,
      required String testName,
      required int testAmount,
      Value<int> id,
      required List<int> answers,
      required int correct,
      required int durationInSeconds,
      required DateTime completedAt,
    });
typedef $$ResultTableTableUpdateCompanionBuilder =
    ResultTableCompanion Function({
      Value<int> testId,
      Value<String> testName,
      Value<int> testAmount,
      Value<int> id,
      Value<List<int>> answers,
      Value<int> correct,
      Value<int> durationInSeconds,
      Value<DateTime> completedAt,
    });

final class $$ResultTableTableReferences
    extends BaseReferences<_$AppDatabase, $ResultTableTable, ResultEntity> {
  $$ResultTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $TestTableTable _testIdTable(_$AppDatabase db) =>
      db.testTable.createAlias(
        $_aliasNameGenerator(db.resultTable.testId, db.testTable.id),
      );

  $$TestTableTableProcessedTableManager get testId {
    final $_column = $_itemColumn<int>('test_id')!;

    final manager = $$TestTableTableTableManager(
      $_db,
      $_db.testTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_testIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $TestTableTable _testNameTable(_$AppDatabase db) =>
      db.testTable.createAlias(
        $_aliasNameGenerator(db.resultTable.testName, db.testTable.name),
      );

  $$TestTableTableProcessedTableManager get testName {
    final $_column = $_itemColumn<String>('test_name')!;

    final manager = $$TestTableTableTableManager(
      $_db,
      $_db.testTable,
    ).filter((f) => f.name.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_testNameTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $TestTableTable _testAmountTable(_$AppDatabase db) =>
      db.testTable.createAlias(
        $_aliasNameGenerator(db.resultTable.testAmount, db.testTable.amount),
      );

  $$TestTableTableProcessedTableManager get testAmount {
    final $_column = $_itemColumn<int>('test_amount')!;

    final manager = $$TestTableTableTableManager(
      $_db,
      $_db.testTable,
    ).filter((f) => f.amount.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_testAmountTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ResultTableTableFilterComposer
    extends Composer<_$AppDatabase, $ResultTableTable> {
  $$ResultTableTableFilterComposer({
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

  ColumnWithTypeConverterFilters<List<int>, List<int>, String> get answers =>
      $composableBuilder(
        column: $table.answers,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<int> get correct => $composableBuilder(
    column: $table.correct,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get durationInSeconds => $composableBuilder(
    column: $table.durationInSeconds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$TestTableTableFilterComposer get testId {
    final $$TestTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.testId,
      referencedTable: $db.testTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TestTableTableFilterComposer(
            $db: $db,
            $table: $db.testTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TestTableTableFilterComposer get testName {
    final $$TestTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.testName,
      referencedTable: $db.testTable,
      getReferencedColumn: (t) => t.name,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TestTableTableFilterComposer(
            $db: $db,
            $table: $db.testTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TestTableTableFilterComposer get testAmount {
    final $$TestTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.testAmount,
      referencedTable: $db.testTable,
      getReferencedColumn: (t) => t.amount,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TestTableTableFilterComposer(
            $db: $db,
            $table: $db.testTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ResultTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ResultTableTable> {
  $$ResultTableTableOrderingComposer({
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

  ColumnOrderings<String> get answers => $composableBuilder(
    column: $table.answers,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get correct => $composableBuilder(
    column: $table.correct,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get durationInSeconds => $composableBuilder(
    column: $table.durationInSeconds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$TestTableTableOrderingComposer get testId {
    final $$TestTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.testId,
      referencedTable: $db.testTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TestTableTableOrderingComposer(
            $db: $db,
            $table: $db.testTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TestTableTableOrderingComposer get testName {
    final $$TestTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.testName,
      referencedTable: $db.testTable,
      getReferencedColumn: (t) => t.name,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TestTableTableOrderingComposer(
            $db: $db,
            $table: $db.testTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TestTableTableOrderingComposer get testAmount {
    final $$TestTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.testAmount,
      referencedTable: $db.testTable,
      getReferencedColumn: (t) => t.amount,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TestTableTableOrderingComposer(
            $db: $db,
            $table: $db.testTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ResultTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ResultTableTable> {
  $$ResultTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<int>, String> get answers =>
      $composableBuilder(column: $table.answers, builder: (column) => column);

  GeneratedColumn<int> get correct =>
      $composableBuilder(column: $table.correct, builder: (column) => column);

  GeneratedColumn<int> get durationInSeconds => $composableBuilder(
    column: $table.durationInSeconds,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => column,
  );

  $$TestTableTableAnnotationComposer get testId {
    final $$TestTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.testId,
      referencedTable: $db.testTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TestTableTableAnnotationComposer(
            $db: $db,
            $table: $db.testTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TestTableTableAnnotationComposer get testName {
    final $$TestTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.testName,
      referencedTable: $db.testTable,
      getReferencedColumn: (t) => t.name,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TestTableTableAnnotationComposer(
            $db: $db,
            $table: $db.testTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TestTableTableAnnotationComposer get testAmount {
    final $$TestTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.testAmount,
      referencedTable: $db.testTable,
      getReferencedColumn: (t) => t.amount,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TestTableTableAnnotationComposer(
            $db: $db,
            $table: $db.testTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ResultTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ResultTableTable,
          ResultEntity,
          $$ResultTableTableFilterComposer,
          $$ResultTableTableOrderingComposer,
          $$ResultTableTableAnnotationComposer,
          $$ResultTableTableCreateCompanionBuilder,
          $$ResultTableTableUpdateCompanionBuilder,
          (ResultEntity, $$ResultTableTableReferences),
          ResultEntity,
          PrefetchHooks Function({bool testId, bool testName, bool testAmount})
        > {
  $$ResultTableTableTableManager(_$AppDatabase db, $ResultTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$ResultTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$ResultTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () =>
                  $$ResultTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> testId = const Value.absent(),
                Value<String> testName = const Value.absent(),
                Value<int> testAmount = const Value.absent(),
                Value<int> id = const Value.absent(),
                Value<List<int>> answers = const Value.absent(),
                Value<int> correct = const Value.absent(),
                Value<int> durationInSeconds = const Value.absent(),
                Value<DateTime> completedAt = const Value.absent(),
              }) => ResultTableCompanion(
                testId: testId,
                testName: testName,
                testAmount: testAmount,
                id: id,
                answers: answers,
                correct: correct,
                durationInSeconds: durationInSeconds,
                completedAt: completedAt,
              ),
          createCompanionCallback:
              ({
                required int testId,
                required String testName,
                required int testAmount,
                Value<int> id = const Value.absent(),
                required List<int> answers,
                required int correct,
                required int durationInSeconds,
                required DateTime completedAt,
              }) => ResultTableCompanion.insert(
                testId: testId,
                testName: testName,
                testAmount: testAmount,
                id: id,
                answers: answers,
                correct: correct,
                durationInSeconds: durationInSeconds,
                completedAt: completedAt,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$ResultTableTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({
            testId = false,
            testName = false,
            testAmount = false,
          }) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                T extends TableManagerState<
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic
                >
              >(state) {
                if (testId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.testId,
                            referencedTable: $$ResultTableTableReferences
                                ._testIdTable(db),
                            referencedColumn:
                                $$ResultTableTableReferences
                                    ._testIdTable(db)
                                    .id,
                          )
                          as T;
                }
                if (testName) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.testName,
                            referencedTable: $$ResultTableTableReferences
                                ._testNameTable(db),
                            referencedColumn:
                                $$ResultTableTableReferences
                                    ._testNameTable(db)
                                    .name,
                          )
                          as T;
                }
                if (testAmount) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.testAmount,
                            referencedTable: $$ResultTableTableReferences
                                ._testAmountTable(db),
                            referencedColumn:
                                $$ResultTableTableReferences
                                    ._testAmountTable(db)
                                    .amount,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ResultTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ResultTableTable,
      ResultEntity,
      $$ResultTableTableFilterComposer,
      $$ResultTableTableOrderingComposer,
      $$ResultTableTableAnnotationComposer,
      $$ResultTableTableCreateCompanionBuilder,
      $$ResultTableTableUpdateCompanionBuilder,
      (ResultEntity, $$ResultTableTableReferences),
      ResultEntity,
      PrefetchHooks Function({bool testId, bool testName, bool testAmount})
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
  $$ResultTableTableTableManager get resultTable =>
      $$ResultTableTableTableManager(_db, _db.resultTable);
  $$SettingsTableTableTableManager get settingsTable =>
      $$SettingsTableTableTableManager(_db, _db.settingsTable);
}
