// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $TestsTable extends Tests with TableInfo<$TestsTable, TestEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TestsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _stateMeta = const VerificationMeta('state');
  @override
  late final GeneratedColumn<String> state = GeneratedColumn<String>(
    'state',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
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
  static const VerificationMeta _isExamMeta = const VerificationMeta('isExam');
  @override
  late final GeneratedColumn<bool> isExam = GeneratedColumn<bool>(
    'is_exam',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_exam" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  late final GeneratedColumnWithTypeConverter<List<int>, String> questionIds =
      GeneratedColumn<String>(
        'question_ids',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<List<int>>($TestsTable.$converterquestionIds);
  static const VerificationMeta _minPassRatioMeta = const VerificationMeta(
    'minPassRatio',
  );
  @override
  late final GeneratedColumn<double> minPassRatio = GeneratedColumn<double>(
    'min_pass_ratio',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    state,
    id,
    isExam,
    questionIds,
    minPassRatio,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tests';
  @override
  VerificationContext validateIntegrity(
    Insertable<TestEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('state')) {
      context.handle(
        _stateMeta,
        state.isAcceptableOrUnknown(data['state']!, _stateMeta),
      );
    } else if (isInserting) {
      context.missing(_stateMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('is_exam')) {
      context.handle(
        _isExamMeta,
        isExam.isAcceptableOrUnknown(data['is_exam']!, _isExamMeta),
      );
    }
    if (data.containsKey('min_pass_ratio')) {
      context.handle(
        _minPassRatioMeta,
        minPassRatio.isAcceptableOrUnknown(
          data['min_pass_ratio']!,
          _minPassRatioMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_minPassRatioMeta);
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
      state:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}state'],
          )!,
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      isExam:
          attachedDatabase.typeMapping.read(
            DriftSqlType.bool,
            data['${effectivePrefix}is_exam'],
          )!,
      questionIds: $TestsTable.$converterquestionIds.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}question_ids'],
        )!,
      ),
      minPassRatio:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}min_pass_ratio'],
          )!,
    );
  }

  @override
  $TestsTable createAlias(String alias) {
    return $TestsTable(attachedDatabase, alias);
  }

  static TypeConverter<List<int>, String> $converterquestionIds = intConverter;
}

class TestsCompanion extends UpdateCompanion<TestEntity> {
  final Value<String> state;
  final Value<int> id;
  final Value<bool> isExam;
  final Value<List<int>> questionIds;
  final Value<double> minPassRatio;
  const TestsCompanion({
    this.state = const Value.absent(),
    this.id = const Value.absent(),
    this.isExam = const Value.absent(),
    this.questionIds = const Value.absent(),
    this.minPassRatio = const Value.absent(),
  });
  TestsCompanion.insert({
    required String state,
    this.id = const Value.absent(),
    this.isExam = const Value.absent(),
    required List<int> questionIds,
    required double minPassRatio,
  }) : state = Value(state),
       questionIds = Value(questionIds),
       minPassRatio = Value(minPassRatio);
  static Insertable<TestEntity> custom({
    Expression<String>? state,
    Expression<int>? id,
    Expression<bool>? isExam,
    Expression<String>? questionIds,
    Expression<double>? minPassRatio,
  }) {
    return RawValuesInsertable({
      if (state != null) 'state': state,
      if (id != null) 'id': id,
      if (isExam != null) 'is_exam': isExam,
      if (questionIds != null) 'question_ids': questionIds,
      if (minPassRatio != null) 'min_pass_ratio': minPassRatio,
    });
  }

  TestsCompanion copyWith({
    Value<String>? state,
    Value<int>? id,
    Value<bool>? isExam,
    Value<List<int>>? questionIds,
    Value<double>? minPassRatio,
  }) {
    return TestsCompanion(
      state: state ?? this.state,
      id: id ?? this.id,
      isExam: isExam ?? this.isExam,
      questionIds: questionIds ?? this.questionIds,
      minPassRatio: minPassRatio ?? this.minPassRatio,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (state.present) {
      map['state'] = Variable<String>(state.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (isExam.present) {
      map['is_exam'] = Variable<bool>(isExam.value);
    }
    if (questionIds.present) {
      map['question_ids'] = Variable<String>(
        $TestsTable.$converterquestionIds.toSql(questionIds.value),
      );
    }
    if (minPassRatio.present) {
      map['min_pass_ratio'] = Variable<double>(minPassRatio.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TestsCompanion(')
          ..write('state: $state, ')
          ..write('id: $id, ')
          ..write('isExam: $isExam, ')
          ..write('questionIds: $questionIds, ')
          ..write('minPassRatio: $minPassRatio')
          ..write(')'))
        .toString();
  }
}

class $QuestionsTable extends Questions
    with TableInfo<$QuestionsTable, QuestionEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $QuestionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _stateMeta = const VerificationMeta('state');
  @override
  late final GeneratedColumn<String> state = GeneratedColumn<String>(
    'state',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
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
      ).withConverter<List<String>>($QuestionsTable.$converterchoices);
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
    state,
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
  static const String $name = 'questions';
  @override
  VerificationContext validateIntegrity(
    Insertable<QuestionEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('state')) {
      context.handle(
        _stateMeta,
        state.isAcceptableOrUnknown(data['state']!, _stateMeta),
      );
    } else if (isInserting) {
      context.missing(_stateMeta);
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
    {state, id},
  ];
  @override
  QuestionEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return QuestionEntity.fromRow(
      state:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}state'],
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
      choices: $QuestionsTable.$converterchoices.fromSql(
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
  $QuestionsTable createAlias(String alias) {
    return $QuestionsTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $converterchoices =
      stringConverter;
}

class QuestionsCompanion extends UpdateCompanion<QuestionEntity> {
  final Value<String> state;
  final Value<int> id;
  final Value<String?> image;
  final Value<String> question;
  final Value<List<String>> choices;
  final Value<int> correct;
  const QuestionsCompanion({
    this.state = const Value.absent(),
    this.id = const Value.absent(),
    this.image = const Value.absent(),
    this.question = const Value.absent(),
    this.choices = const Value.absent(),
    this.correct = const Value.absent(),
  });
  QuestionsCompanion.insert({
    required String state,
    this.id = const Value.absent(),
    this.image = const Value.absent(),
    required String question,
    required List<String> choices,
    required int correct,
  }) : state = Value(state),
       question = Value(question),
       choices = Value(choices),
       correct = Value(correct);
  static Insertable<QuestionEntity> custom({
    Expression<String>? state,
    Expression<int>? id,
    Expression<String>? image,
    Expression<String>? question,
    Expression<String>? choices,
    Expression<int>? correct,
  }) {
    return RawValuesInsertable({
      if (state != null) 'state': state,
      if (id != null) 'id': id,
      if (image != null) 'image': image,
      if (question != null) 'question': question,
      if (choices != null) 'choices': choices,
      if (correct != null) 'correct': correct,
    });
  }

  QuestionsCompanion copyWith({
    Value<String>? state,
    Value<int>? id,
    Value<String?>? image,
    Value<String>? question,
    Value<List<String>>? choices,
    Value<int>? correct,
  }) {
    return QuestionsCompanion(
      state: state ?? this.state,
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
    if (state.present) {
      map['state'] = Variable<String>(state.value);
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
        $QuestionsTable.$converterchoices.toSql(choices.value),
      );
    }
    if (correct.present) {
      map['correct'] = Variable<int>(correct.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('QuestionsCompanion(')
          ..write('state: $state, ')
          ..write('id: $id, ')
          ..write('image: $image, ')
          ..write('question: $question, ')
          ..write('choices: $choices, ')
          ..write('correct: $correct')
          ..write(')'))
        .toString();
  }
}

class $ResultsTable extends Results
    with TableInfo<$ResultsTable, ResultEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ResultsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _testIdMeta = const VerificationMeta('testId');
  @override
  late final GeneratedColumn<int> testId = GeneratedColumn<int>(
    'test_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES tests (id)',
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
      ).withConverter<List<int>>($ResultsTable.$converteranswers);
  static const VerificationMeta _correctAnswerAmountMeta =
      const VerificationMeta('correctAnswerAmount');
  @override
  late final GeneratedColumn<int> correctAnswerAmount = GeneratedColumn<int>(
    'correct_answer_amount',
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
    id,
    answers,
    correctAnswerAmount,
    durationInSeconds,
    completedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'results';
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
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('correct_answer_amount')) {
      context.handle(
        _correctAnswerAmountMeta,
        correctAnswerAmount.isAcceptableOrUnknown(
          data['correct_answer_amount']!,
          _correctAnswerAmountMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_correctAnswerAmountMeta);
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
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      answers: $ResultsTable.$converteranswers.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}answers'],
        )!,
      ),
      correctAnswerAmount:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}correct_answer_amount'],
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
  $ResultsTable createAlias(String alias) {
    return $ResultsTable(attachedDatabase, alias);
  }

  static TypeConverter<List<int>, String> $converteranswers = intConverter;
}

class ResultsCompanion extends UpdateCompanion<ResultEntity> {
  final Value<int> testId;
  final Value<int> id;
  final Value<List<int>> answers;
  final Value<int> correctAnswerAmount;
  final Value<int> durationInSeconds;
  final Value<DateTime> completedAt;
  const ResultsCompanion({
    this.testId = const Value.absent(),
    this.id = const Value.absent(),
    this.answers = const Value.absent(),
    this.correctAnswerAmount = const Value.absent(),
    this.durationInSeconds = const Value.absent(),
    this.completedAt = const Value.absent(),
  });
  ResultsCompanion.insert({
    required int testId,
    this.id = const Value.absent(),
    required List<int> answers,
    required int correctAnswerAmount,
    required int durationInSeconds,
    required DateTime completedAt,
  }) : testId = Value(testId),
       answers = Value(answers),
       correctAnswerAmount = Value(correctAnswerAmount),
       durationInSeconds = Value(durationInSeconds),
       completedAt = Value(completedAt);
  static Insertable<ResultEntity> custom({
    Expression<int>? testId,
    Expression<int>? id,
    Expression<String>? answers,
    Expression<int>? correctAnswerAmount,
    Expression<int>? durationInSeconds,
    Expression<DateTime>? completedAt,
  }) {
    return RawValuesInsertable({
      if (testId != null) 'test_id': testId,
      if (id != null) 'id': id,
      if (answers != null) 'answers': answers,
      if (correctAnswerAmount != null)
        'correct_answer_amount': correctAnswerAmount,
      if (durationInSeconds != null) 'duration_in_seconds': durationInSeconds,
      if (completedAt != null) 'completed_at': completedAt,
    });
  }

  ResultsCompanion copyWith({
    Value<int>? testId,
    Value<int>? id,
    Value<List<int>>? answers,
    Value<int>? correctAnswerAmount,
    Value<int>? durationInSeconds,
    Value<DateTime>? completedAt,
  }) {
    return ResultsCompanion(
      testId: testId ?? this.testId,
      id: id ?? this.id,
      answers: answers ?? this.answers,
      correctAnswerAmount: correctAnswerAmount ?? this.correctAnswerAmount,
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
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (answers.present) {
      map['answers'] = Variable<String>(
        $ResultsTable.$converteranswers.toSql(answers.value),
      );
    }
    if (correctAnswerAmount.present) {
      map['correct_answer_amount'] = Variable<int>(correctAnswerAmount.value);
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
    return (StringBuffer('ResultsCompanion(')
          ..write('testId: $testId, ')
          ..write('id: $id, ')
          ..write('answers: $answers, ')
          ..write('correctAnswerAmount: $correctAnswerAmount, ')
          ..write('durationInSeconds: $durationInSeconds, ')
          ..write('completedAt: $completedAt')
          ..write(')'))
        .toString();
  }
}

class $SettingsTable extends Settings
    with TableInfo<$SettingsTable, SettingsEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SettingsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _isOnboardingCompleteMeta =
      const VerificationMeta('isOnboardingComplete');
  @override
  late final GeneratedColumn<bool> isOnboardingComplete = GeneratedColumn<bool>(
    'is_onboarding_complete',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_onboarding_complete" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    isPushEnabled,
    state,
    license,
    isOnboardingComplete,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'settings';
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
    if (data.containsKey('is_onboarding_complete')) {
      context.handle(
        _isOnboardingCompleteMeta,
        isOnboardingComplete.isAcceptableOrUnknown(
          data['is_onboarding_complete']!,
          _isOnboardingCompleteMeta,
        ),
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
      isOnboardingComplete:
          attachedDatabase.typeMapping.read(
            DriftSqlType.bool,
            data['${effectivePrefix}is_onboarding_complete'],
          )!,
    );
  }

  @override
  $SettingsTable createAlias(String alias) {
    return $SettingsTable(attachedDatabase, alias);
  }
}

class SettingsCompanion extends UpdateCompanion<SettingsEntity> {
  final Value<int> id;
  final Value<bool?> isPushEnabled;
  final Value<String?> state;
  final Value<String?> license;
  final Value<bool> isOnboardingComplete;
  const SettingsCompanion({
    this.id = const Value.absent(),
    this.isPushEnabled = const Value.absent(),
    this.state = const Value.absent(),
    this.license = const Value.absent(),
    this.isOnboardingComplete = const Value.absent(),
  });
  SettingsCompanion.insert({
    this.id = const Value.absent(),
    this.isPushEnabled = const Value.absent(),
    this.state = const Value.absent(),
    this.license = const Value.absent(),
    this.isOnboardingComplete = const Value.absent(),
  });
  static Insertable<SettingsEntity> custom({
    Expression<int>? id,
    Expression<bool>? isPushEnabled,
    Expression<String>? state,
    Expression<String>? license,
    Expression<bool>? isOnboardingComplete,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (isPushEnabled != null) 'is_push_enabled': isPushEnabled,
      if (state != null) 'state': state,
      if (license != null) 'license': license,
      if (isOnboardingComplete != null)
        'is_onboarding_complete': isOnboardingComplete,
    });
  }

  SettingsCompanion copyWith({
    Value<int>? id,
    Value<bool?>? isPushEnabled,
    Value<String?>? state,
    Value<String?>? license,
    Value<bool>? isOnboardingComplete,
  }) {
    return SettingsCompanion(
      id: id ?? this.id,
      isPushEnabled: isPushEnabled ?? this.isPushEnabled,
      state: state ?? this.state,
      license: license ?? this.license,
      isOnboardingComplete: isOnboardingComplete ?? this.isOnboardingComplete,
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
    if (isOnboardingComplete.present) {
      map['is_onboarding_complete'] = Variable<bool>(
        isOnboardingComplete.value,
      );
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SettingsCompanion(')
          ..write('id: $id, ')
          ..write('isPushEnabled: $isPushEnabled, ')
          ..write('state: $state, ')
          ..write('license: $license, ')
          ..write('isOnboardingComplete: $isOnboardingComplete')
          ..write(')'))
        .toString();
  }
}

class $PracticeRemindersTable extends PracticeReminders
    with TableInfo<$PracticeRemindersTable, PracticeReminderEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PracticeRemindersTable(this.attachedDatabase, [this._alias]);
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
  @override
  late final GeneratedColumnWithTypeConverter<List<int>, String> daysOfWeek =
      GeneratedColumn<String>(
        'days_of_week',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<List<int>>($PracticeRemindersTable.$converterdaysOfWeek);
  static const VerificationMeta _hourMeta = const VerificationMeta('hour');
  @override
  late final GeneratedColumn<int> hour = GeneratedColumn<int>(
    'hour',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _minuteMeta = const VerificationMeta('minute');
  @override
  late final GeneratedColumn<int> minute = GeneratedColumn<int>(
    'minute',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, daysOfWeek, hour, minute];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'practice_reminders';
  @override
  VerificationContext validateIntegrity(
    Insertable<PracticeReminderEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('hour')) {
      context.handle(
        _hourMeta,
        hour.isAcceptableOrUnknown(data['hour']!, _hourMeta),
      );
    } else if (isInserting) {
      context.missing(_hourMeta);
    }
    if (data.containsKey('minute')) {
      context.handle(
        _minuteMeta,
        minute.isAcceptableOrUnknown(data['minute']!, _minuteMeta),
      );
    } else if (isInserting) {
      context.missing(_minuteMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PracticeReminderEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PracticeReminderEntity.fromRow(
      daysOfWeek: $PracticeRemindersTable.$converterdaysOfWeek.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}days_of_week'],
        )!,
      ),
      hour:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}hour'],
          )!,
      minute:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}minute'],
          )!,
    );
  }

  @override
  $PracticeRemindersTable createAlias(String alias) {
    return $PracticeRemindersTable(attachedDatabase, alias);
  }

  static TypeConverter<List<int>, String> $converterdaysOfWeek = intConverter;
}

class PracticeRemindersCompanion
    extends UpdateCompanion<PracticeReminderEntity> {
  final Value<int> id;
  final Value<List<int>> daysOfWeek;
  final Value<int> hour;
  final Value<int> minute;
  const PracticeRemindersCompanion({
    this.id = const Value.absent(),
    this.daysOfWeek = const Value.absent(),
    this.hour = const Value.absent(),
    this.minute = const Value.absent(),
  });
  PracticeRemindersCompanion.insert({
    this.id = const Value.absent(),
    required List<int> daysOfWeek,
    required int hour,
    required int minute,
  }) : daysOfWeek = Value(daysOfWeek),
       hour = Value(hour),
       minute = Value(minute);
  static Insertable<PracticeReminderEntity> custom({
    Expression<int>? id,
    Expression<String>? daysOfWeek,
    Expression<int>? hour,
    Expression<int>? minute,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (daysOfWeek != null) 'days_of_week': daysOfWeek,
      if (hour != null) 'hour': hour,
      if (minute != null) 'minute': minute,
    });
  }

  PracticeRemindersCompanion copyWith({
    Value<int>? id,
    Value<List<int>>? daysOfWeek,
    Value<int>? hour,
    Value<int>? minute,
  }) {
    return PracticeRemindersCompanion(
      id: id ?? this.id,
      daysOfWeek: daysOfWeek ?? this.daysOfWeek,
      hour: hour ?? this.hour,
      minute: minute ?? this.minute,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (daysOfWeek.present) {
      map['days_of_week'] = Variable<String>(
        $PracticeRemindersTable.$converterdaysOfWeek.toSql(daysOfWeek.value),
      );
    }
    if (hour.present) {
      map['hour'] = Variable<int>(hour.value);
    }
    if (minute.present) {
      map['minute'] = Variable<int>(minute.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PracticeRemindersCompanion(')
          ..write('id: $id, ')
          ..write('daysOfWeek: $daysOfWeek, ')
          ..write('hour: $hour, ')
          ..write('minute: $minute')
          ..write(')'))
        .toString();
  }
}

class $ExamRemindersTable extends ExamReminders
    with TableInfo<$ExamRemindersTable, ExamReminderEnity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExamRemindersTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _daysUntilRemindMeta = const VerificationMeta(
    'daysUntilRemind',
  );
  @override
  late final GeneratedColumn<int> daysUntilRemind = GeneratedColumn<int>(
    'days_until_remind',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, date, daysUntilRemind];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'exam_reminders';
  @override
  VerificationContext validateIntegrity(
    Insertable<ExamReminderEnity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('days_until_remind')) {
      context.handle(
        _daysUntilRemindMeta,
        daysUntilRemind.isAcceptableOrUnknown(
          data['days_until_remind']!,
          _daysUntilRemindMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ExamReminderEnity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExamReminderEnity.fromRow(
      date:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}date'],
          )!,
      daysUntilRemind: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}days_until_remind'],
      ),
    );
  }

  @override
  $ExamRemindersTable createAlias(String alias) {
    return $ExamRemindersTable(attachedDatabase, alias);
  }
}

class ExamRemindersCompanion extends UpdateCompanion<ExamReminderEnity> {
  final Value<int> id;
  final Value<DateTime> date;
  final Value<int?> daysUntilRemind;
  const ExamRemindersCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.daysUntilRemind = const Value.absent(),
  });
  ExamRemindersCompanion.insert({
    this.id = const Value.absent(),
    required DateTime date,
    this.daysUntilRemind = const Value.absent(),
  }) : date = Value(date);
  static Insertable<ExamReminderEnity> custom({
    Expression<int>? id,
    Expression<DateTime>? date,
    Expression<int>? daysUntilRemind,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (daysUntilRemind != null) 'days_until_remind': daysUntilRemind,
    });
  }

  ExamRemindersCompanion copyWith({
    Value<int>? id,
    Value<DateTime>? date,
    Value<int?>? daysUntilRemind,
  }) {
    return ExamRemindersCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      daysUntilRemind: daysUntilRemind ?? this.daysUntilRemind,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (daysUntilRemind.present) {
      map['days_until_remind'] = Variable<int>(daysUntilRemind.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExamRemindersCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('daysUntilRemind: $daysUntilRemind')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $TestsTable tests = $TestsTable(this);
  late final $QuestionsTable questions = $QuestionsTable(this);
  late final $ResultsTable results = $ResultsTable(this);
  late final $SettingsTable settings = $SettingsTable(this);
  late final $PracticeRemindersTable practiceReminders =
      $PracticeRemindersTable(this);
  late final $ExamRemindersTable examReminders = $ExamRemindersTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    tests,
    questions,
    results,
    settings,
    practiceReminders,
    examReminders,
  ];
}

typedef $$TestsTableCreateCompanionBuilder =
    TestsCompanion Function({
      required String state,
      Value<int> id,
      Value<bool> isExam,
      required List<int> questionIds,
      required double minPassRatio,
    });
typedef $$TestsTableUpdateCompanionBuilder =
    TestsCompanion Function({
      Value<String> state,
      Value<int> id,
      Value<bool> isExam,
      Value<List<int>> questionIds,
      Value<double> minPassRatio,
    });

final class $$TestsTableReferences
    extends BaseReferences<_$AppDatabase, $TestsTable, TestEntity> {
  $$TestsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ResultsTable, List<ResultEntity>>
  _test_result_idTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.results,
    aliasName: $_aliasNameGenerator(db.tests.id, db.results.testId),
  );

  $$ResultsTableProcessedTableManager get test_result_id {
    final manager = $$ResultsTableTableManager(
      $_db,
      $_db.results,
    ).filter((f) => f.testId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_test_result_idTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$TestsTableFilterComposer extends Composer<_$AppDatabase, $TestsTable> {
  $$TestsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get state => $composableBuilder(
    column: $table.state,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isExam => $composableBuilder(
    column: $table.isExam,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<List<int>, List<int>, String>
  get questionIds => $composableBuilder(
    column: $table.questionIds,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<double> get minPassRatio => $composableBuilder(
    column: $table.minPassRatio,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> test_result_id(
    Expression<bool> Function($$ResultsTableFilterComposer f) f,
  ) {
    final $$ResultsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.results,
      getReferencedColumn: (t) => t.testId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ResultsTableFilterComposer(
            $db: $db,
            $table: $db.results,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TestsTableOrderingComposer
    extends Composer<_$AppDatabase, $TestsTable> {
  $$TestsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get state => $composableBuilder(
    column: $table.state,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isExam => $composableBuilder(
    column: $table.isExam,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get questionIds => $composableBuilder(
    column: $table.questionIds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get minPassRatio => $composableBuilder(
    column: $table.minPassRatio,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TestsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TestsTable> {
  $$TestsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get state =>
      $composableBuilder(column: $table.state, builder: (column) => column);

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<bool> get isExam =>
      $composableBuilder(column: $table.isExam, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<int>, String> get questionIds =>
      $composableBuilder(
        column: $table.questionIds,
        builder: (column) => column,
      );

  GeneratedColumn<double> get minPassRatio => $composableBuilder(
    column: $table.minPassRatio,
    builder: (column) => column,
  );

  Expression<T> test_result_id<T extends Object>(
    Expression<T> Function($$ResultsTableAnnotationComposer a) f,
  ) {
    final $$ResultsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.results,
      getReferencedColumn: (t) => t.testId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ResultsTableAnnotationComposer(
            $db: $db,
            $table: $db.results,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TestsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TestsTable,
          TestEntity,
          $$TestsTableFilterComposer,
          $$TestsTableOrderingComposer,
          $$TestsTableAnnotationComposer,
          $$TestsTableCreateCompanionBuilder,
          $$TestsTableUpdateCompanionBuilder,
          (TestEntity, $$TestsTableReferences),
          TestEntity,
          PrefetchHooks Function({bool test_result_id})
        > {
  $$TestsTableTableManager(_$AppDatabase db, $TestsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$TestsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$TestsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$TestsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> state = const Value.absent(),
                Value<int> id = const Value.absent(),
                Value<bool> isExam = const Value.absent(),
                Value<List<int>> questionIds = const Value.absent(),
                Value<double> minPassRatio = const Value.absent(),
              }) => TestsCompanion(
                state: state,
                id: id,
                isExam: isExam,
                questionIds: questionIds,
                minPassRatio: minPassRatio,
              ),
          createCompanionCallback:
              ({
                required String state,
                Value<int> id = const Value.absent(),
                Value<bool> isExam = const Value.absent(),
                required List<int> questionIds,
                required double minPassRatio,
              }) => TestsCompanion.insert(
                state: state,
                id: id,
                isExam: isExam,
                questionIds: questionIds,
                minPassRatio: minPassRatio,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$TestsTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({test_result_id = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (test_result_id) db.results],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (test_result_id)
                    await $_getPrefetchedData<
                      TestEntity,
                      $TestsTable,
                      ResultEntity
                    >(
                      currentTable: table,
                      referencedTable: $$TestsTableReferences
                          ._test_result_idTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$TestsTableReferences(
                                db,
                                table,
                                p0,
                              ).test_result_id,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) =>
                              referencedItems.where((e) => e.testId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$TestsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TestsTable,
      TestEntity,
      $$TestsTableFilterComposer,
      $$TestsTableOrderingComposer,
      $$TestsTableAnnotationComposer,
      $$TestsTableCreateCompanionBuilder,
      $$TestsTableUpdateCompanionBuilder,
      (TestEntity, $$TestsTableReferences),
      TestEntity,
      PrefetchHooks Function({bool test_result_id})
    >;
typedef $$QuestionsTableCreateCompanionBuilder =
    QuestionsCompanion Function({
      required String state,
      Value<int> id,
      Value<String?> image,
      required String question,
      required List<String> choices,
      required int correct,
    });
typedef $$QuestionsTableUpdateCompanionBuilder =
    QuestionsCompanion Function({
      Value<String> state,
      Value<int> id,
      Value<String?> image,
      Value<String> question,
      Value<List<String>> choices,
      Value<int> correct,
    });

class $$QuestionsTableFilterComposer
    extends Composer<_$AppDatabase, $QuestionsTable> {
  $$QuestionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get state => $composableBuilder(
    column: $table.state,
    builder: (column) => ColumnFilters(column),
  );

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
}

class $$QuestionsTableOrderingComposer
    extends Composer<_$AppDatabase, $QuestionsTable> {
  $$QuestionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get state => $composableBuilder(
    column: $table.state,
    builder: (column) => ColumnOrderings(column),
  );

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
}

class $$QuestionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $QuestionsTable> {
  $$QuestionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get state =>
      $composableBuilder(column: $table.state, builder: (column) => column);

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
}

class $$QuestionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $QuestionsTable,
          QuestionEntity,
          $$QuestionsTableFilterComposer,
          $$QuestionsTableOrderingComposer,
          $$QuestionsTableAnnotationComposer,
          $$QuestionsTableCreateCompanionBuilder,
          $$QuestionsTableUpdateCompanionBuilder,
          (
            QuestionEntity,
            BaseReferences<_$AppDatabase, $QuestionsTable, QuestionEntity>,
          ),
          QuestionEntity,
          PrefetchHooks Function()
        > {
  $$QuestionsTableTableManager(_$AppDatabase db, $QuestionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$QuestionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$QuestionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$QuestionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> state = const Value.absent(),
                Value<int> id = const Value.absent(),
                Value<String?> image = const Value.absent(),
                Value<String> question = const Value.absent(),
                Value<List<String>> choices = const Value.absent(),
                Value<int> correct = const Value.absent(),
              }) => QuestionsCompanion(
                state: state,
                id: id,
                image: image,
                question: question,
                choices: choices,
                correct: correct,
              ),
          createCompanionCallback:
              ({
                required String state,
                Value<int> id = const Value.absent(),
                Value<String?> image = const Value.absent(),
                required String question,
                required List<String> choices,
                required int correct,
              }) => QuestionsCompanion.insert(
                state: state,
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
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$QuestionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $QuestionsTable,
      QuestionEntity,
      $$QuestionsTableFilterComposer,
      $$QuestionsTableOrderingComposer,
      $$QuestionsTableAnnotationComposer,
      $$QuestionsTableCreateCompanionBuilder,
      $$QuestionsTableUpdateCompanionBuilder,
      (
        QuestionEntity,
        BaseReferences<_$AppDatabase, $QuestionsTable, QuestionEntity>,
      ),
      QuestionEntity,
      PrefetchHooks Function()
    >;
typedef $$ResultsTableCreateCompanionBuilder =
    ResultsCompanion Function({
      required int testId,
      Value<int> id,
      required List<int> answers,
      required int correctAnswerAmount,
      required int durationInSeconds,
      required DateTime completedAt,
    });
typedef $$ResultsTableUpdateCompanionBuilder =
    ResultsCompanion Function({
      Value<int> testId,
      Value<int> id,
      Value<List<int>> answers,
      Value<int> correctAnswerAmount,
      Value<int> durationInSeconds,
      Value<DateTime> completedAt,
    });

final class $$ResultsTableReferences
    extends BaseReferences<_$AppDatabase, $ResultsTable, ResultEntity> {
  $$ResultsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $TestsTable _testIdTable(_$AppDatabase db) => db.tests.createAlias(
    $_aliasNameGenerator(db.results.testId, db.tests.id),
  );

  $$TestsTableProcessedTableManager get testId {
    final $_column = $_itemColumn<int>('test_id')!;

    final manager = $$TestsTableTableManager(
      $_db,
      $_db.tests,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_testIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ResultsTableFilterComposer
    extends Composer<_$AppDatabase, $ResultsTable> {
  $$ResultsTableFilterComposer({
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

  ColumnFilters<int> get correctAnswerAmount => $composableBuilder(
    column: $table.correctAnswerAmount,
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

  $$TestsTableFilterComposer get testId {
    final $$TestsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.testId,
      referencedTable: $db.tests,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TestsTableFilterComposer(
            $db: $db,
            $table: $db.tests,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ResultsTableOrderingComposer
    extends Composer<_$AppDatabase, $ResultsTable> {
  $$ResultsTableOrderingComposer({
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

  ColumnOrderings<int> get correctAnswerAmount => $composableBuilder(
    column: $table.correctAnswerAmount,
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

  $$TestsTableOrderingComposer get testId {
    final $$TestsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.testId,
      referencedTable: $db.tests,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TestsTableOrderingComposer(
            $db: $db,
            $table: $db.tests,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ResultsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ResultsTable> {
  $$ResultsTableAnnotationComposer({
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

  GeneratedColumn<int> get correctAnswerAmount => $composableBuilder(
    column: $table.correctAnswerAmount,
    builder: (column) => column,
  );

  GeneratedColumn<int> get durationInSeconds => $composableBuilder(
    column: $table.durationInSeconds,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => column,
  );

  $$TestsTableAnnotationComposer get testId {
    final $$TestsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.testId,
      referencedTable: $db.tests,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TestsTableAnnotationComposer(
            $db: $db,
            $table: $db.tests,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ResultsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ResultsTable,
          ResultEntity,
          $$ResultsTableFilterComposer,
          $$ResultsTableOrderingComposer,
          $$ResultsTableAnnotationComposer,
          $$ResultsTableCreateCompanionBuilder,
          $$ResultsTableUpdateCompanionBuilder,
          (ResultEntity, $$ResultsTableReferences),
          ResultEntity,
          PrefetchHooks Function({bool testId})
        > {
  $$ResultsTableTableManager(_$AppDatabase db, $ResultsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$ResultsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$ResultsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$ResultsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> testId = const Value.absent(),
                Value<int> id = const Value.absent(),
                Value<List<int>> answers = const Value.absent(),
                Value<int> correctAnswerAmount = const Value.absent(),
                Value<int> durationInSeconds = const Value.absent(),
                Value<DateTime> completedAt = const Value.absent(),
              }) => ResultsCompanion(
                testId: testId,
                id: id,
                answers: answers,
                correctAnswerAmount: correctAnswerAmount,
                durationInSeconds: durationInSeconds,
                completedAt: completedAt,
              ),
          createCompanionCallback:
              ({
                required int testId,
                Value<int> id = const Value.absent(),
                required List<int> answers,
                required int correctAnswerAmount,
                required int durationInSeconds,
                required DateTime completedAt,
              }) => ResultsCompanion.insert(
                testId: testId,
                id: id,
                answers: answers,
                correctAnswerAmount: correctAnswerAmount,
                durationInSeconds: durationInSeconds,
                completedAt: completedAt,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$ResultsTableReferences(db, table, e),
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
                            referencedTable: $$ResultsTableReferences
                                ._testIdTable(db),
                            referencedColumn:
                                $$ResultsTableReferences._testIdTable(db).id,
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

typedef $$ResultsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ResultsTable,
      ResultEntity,
      $$ResultsTableFilterComposer,
      $$ResultsTableOrderingComposer,
      $$ResultsTableAnnotationComposer,
      $$ResultsTableCreateCompanionBuilder,
      $$ResultsTableUpdateCompanionBuilder,
      (ResultEntity, $$ResultsTableReferences),
      ResultEntity,
      PrefetchHooks Function({bool testId})
    >;
typedef $$SettingsTableCreateCompanionBuilder =
    SettingsCompanion Function({
      Value<int> id,
      Value<bool?> isPushEnabled,
      Value<String?> state,
      Value<String?> license,
      Value<bool> isOnboardingComplete,
    });
typedef $$SettingsTableUpdateCompanionBuilder =
    SettingsCompanion Function({
      Value<int> id,
      Value<bool?> isPushEnabled,
      Value<String?> state,
      Value<String?> license,
      Value<bool> isOnboardingComplete,
    });

class $$SettingsTableFilterComposer
    extends Composer<_$AppDatabase, $SettingsTable> {
  $$SettingsTableFilterComposer({
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

  ColumnFilters<bool> get isOnboardingComplete => $composableBuilder(
    column: $table.isOnboardingComplete,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SettingsTableOrderingComposer
    extends Composer<_$AppDatabase, $SettingsTable> {
  $$SettingsTableOrderingComposer({
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

  ColumnOrderings<bool> get isOnboardingComplete => $composableBuilder(
    column: $table.isOnboardingComplete,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SettingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SettingsTable> {
  $$SettingsTableAnnotationComposer({
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

  GeneratedColumn<bool> get isOnboardingComplete => $composableBuilder(
    column: $table.isOnboardingComplete,
    builder: (column) => column,
  );
}

class $$SettingsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SettingsTable,
          SettingsEntity,
          $$SettingsTableFilterComposer,
          $$SettingsTableOrderingComposer,
          $$SettingsTableAnnotationComposer,
          $$SettingsTableCreateCompanionBuilder,
          $$SettingsTableUpdateCompanionBuilder,
          (
            SettingsEntity,
            BaseReferences<_$AppDatabase, $SettingsTable, SettingsEntity>,
          ),
          SettingsEntity,
          PrefetchHooks Function()
        > {
  $$SettingsTableTableManager(_$AppDatabase db, $SettingsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$SettingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$SettingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$SettingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<bool?> isPushEnabled = const Value.absent(),
                Value<String?> state = const Value.absent(),
                Value<String?> license = const Value.absent(),
                Value<bool> isOnboardingComplete = const Value.absent(),
              }) => SettingsCompanion(
                id: id,
                isPushEnabled: isPushEnabled,
                state: state,
                license: license,
                isOnboardingComplete: isOnboardingComplete,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<bool?> isPushEnabled = const Value.absent(),
                Value<String?> state = const Value.absent(),
                Value<String?> license = const Value.absent(),
                Value<bool> isOnboardingComplete = const Value.absent(),
              }) => SettingsCompanion.insert(
                id: id,
                isPushEnabled: isPushEnabled,
                state: state,
                license: license,
                isOnboardingComplete: isOnboardingComplete,
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

typedef $$SettingsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SettingsTable,
      SettingsEntity,
      $$SettingsTableFilterComposer,
      $$SettingsTableOrderingComposer,
      $$SettingsTableAnnotationComposer,
      $$SettingsTableCreateCompanionBuilder,
      $$SettingsTableUpdateCompanionBuilder,
      (
        SettingsEntity,
        BaseReferences<_$AppDatabase, $SettingsTable, SettingsEntity>,
      ),
      SettingsEntity,
      PrefetchHooks Function()
    >;
typedef $$PracticeRemindersTableCreateCompanionBuilder =
    PracticeRemindersCompanion Function({
      Value<int> id,
      required List<int> daysOfWeek,
      required int hour,
      required int minute,
    });
typedef $$PracticeRemindersTableUpdateCompanionBuilder =
    PracticeRemindersCompanion Function({
      Value<int> id,
      Value<List<int>> daysOfWeek,
      Value<int> hour,
      Value<int> minute,
    });

class $$PracticeRemindersTableFilterComposer
    extends Composer<_$AppDatabase, $PracticeRemindersTable> {
  $$PracticeRemindersTableFilterComposer({
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

  ColumnWithTypeConverterFilters<List<int>, List<int>, String> get daysOfWeek =>
      $composableBuilder(
        column: $table.daysOfWeek,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<int> get hour => $composableBuilder(
    column: $table.hour,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get minute => $composableBuilder(
    column: $table.minute,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PracticeRemindersTableOrderingComposer
    extends Composer<_$AppDatabase, $PracticeRemindersTable> {
  $$PracticeRemindersTableOrderingComposer({
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

  ColumnOrderings<String> get daysOfWeek => $composableBuilder(
    column: $table.daysOfWeek,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get hour => $composableBuilder(
    column: $table.hour,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get minute => $composableBuilder(
    column: $table.minute,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PracticeRemindersTableAnnotationComposer
    extends Composer<_$AppDatabase, $PracticeRemindersTable> {
  $$PracticeRemindersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<int>, String> get daysOfWeek =>
      $composableBuilder(
        column: $table.daysOfWeek,
        builder: (column) => column,
      );

  GeneratedColumn<int> get hour =>
      $composableBuilder(column: $table.hour, builder: (column) => column);

  GeneratedColumn<int> get minute =>
      $composableBuilder(column: $table.minute, builder: (column) => column);
}

class $$PracticeRemindersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PracticeRemindersTable,
          PracticeReminderEntity,
          $$PracticeRemindersTableFilterComposer,
          $$PracticeRemindersTableOrderingComposer,
          $$PracticeRemindersTableAnnotationComposer,
          $$PracticeRemindersTableCreateCompanionBuilder,
          $$PracticeRemindersTableUpdateCompanionBuilder,
          (
            PracticeReminderEntity,
            BaseReferences<
              _$AppDatabase,
              $PracticeRemindersTable,
              PracticeReminderEntity
            >,
          ),
          PracticeReminderEntity,
          PrefetchHooks Function()
        > {
  $$PracticeRemindersTableTableManager(
    _$AppDatabase db,
    $PracticeRemindersTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$PracticeRemindersTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer:
              () => $$PracticeRemindersTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$PracticeRemindersTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<List<int>> daysOfWeek = const Value.absent(),
                Value<int> hour = const Value.absent(),
                Value<int> minute = const Value.absent(),
              }) => PracticeRemindersCompanion(
                id: id,
                daysOfWeek: daysOfWeek,
                hour: hour,
                minute: minute,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required List<int> daysOfWeek,
                required int hour,
                required int minute,
              }) => PracticeRemindersCompanion.insert(
                id: id,
                daysOfWeek: daysOfWeek,
                hour: hour,
                minute: minute,
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

typedef $$PracticeRemindersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PracticeRemindersTable,
      PracticeReminderEntity,
      $$PracticeRemindersTableFilterComposer,
      $$PracticeRemindersTableOrderingComposer,
      $$PracticeRemindersTableAnnotationComposer,
      $$PracticeRemindersTableCreateCompanionBuilder,
      $$PracticeRemindersTableUpdateCompanionBuilder,
      (
        PracticeReminderEntity,
        BaseReferences<
          _$AppDatabase,
          $PracticeRemindersTable,
          PracticeReminderEntity
        >,
      ),
      PracticeReminderEntity,
      PrefetchHooks Function()
    >;
typedef $$ExamRemindersTableCreateCompanionBuilder =
    ExamRemindersCompanion Function({
      Value<int> id,
      required DateTime date,
      Value<int?> daysUntilRemind,
    });
typedef $$ExamRemindersTableUpdateCompanionBuilder =
    ExamRemindersCompanion Function({
      Value<int> id,
      Value<DateTime> date,
      Value<int?> daysUntilRemind,
    });

class $$ExamRemindersTableFilterComposer
    extends Composer<_$AppDatabase, $ExamRemindersTable> {
  $$ExamRemindersTableFilterComposer({
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

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get daysUntilRemind => $composableBuilder(
    column: $table.daysUntilRemind,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ExamRemindersTableOrderingComposer
    extends Composer<_$AppDatabase, $ExamRemindersTable> {
  $$ExamRemindersTableOrderingComposer({
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

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get daysUntilRemind => $composableBuilder(
    column: $table.daysUntilRemind,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ExamRemindersTableAnnotationComposer
    extends Composer<_$AppDatabase, $ExamRemindersTable> {
  $$ExamRemindersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<int> get daysUntilRemind => $composableBuilder(
    column: $table.daysUntilRemind,
    builder: (column) => column,
  );
}

class $$ExamRemindersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ExamRemindersTable,
          ExamReminderEnity,
          $$ExamRemindersTableFilterComposer,
          $$ExamRemindersTableOrderingComposer,
          $$ExamRemindersTableAnnotationComposer,
          $$ExamRemindersTableCreateCompanionBuilder,
          $$ExamRemindersTableUpdateCompanionBuilder,
          (
            ExamReminderEnity,
            BaseReferences<
              _$AppDatabase,
              $ExamRemindersTable,
              ExamReminderEnity
            >,
          ),
          ExamReminderEnity,
          PrefetchHooks Function()
        > {
  $$ExamRemindersTableTableManager(_$AppDatabase db, $ExamRemindersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$ExamRemindersTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () =>
                  $$ExamRemindersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$ExamRemindersTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<int?> daysUntilRemind = const Value.absent(),
              }) => ExamRemindersCompanion(
                id: id,
                date: date,
                daysUntilRemind: daysUntilRemind,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required DateTime date,
                Value<int?> daysUntilRemind = const Value.absent(),
              }) => ExamRemindersCompanion.insert(
                id: id,
                date: date,
                daysUntilRemind: daysUntilRemind,
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

typedef $$ExamRemindersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ExamRemindersTable,
      ExamReminderEnity,
      $$ExamRemindersTableFilterComposer,
      $$ExamRemindersTableOrderingComposer,
      $$ExamRemindersTableAnnotationComposer,
      $$ExamRemindersTableCreateCompanionBuilder,
      $$ExamRemindersTableUpdateCompanionBuilder,
      (
        ExamReminderEnity,
        BaseReferences<_$AppDatabase, $ExamRemindersTable, ExamReminderEnity>,
      ),
      ExamReminderEnity,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$TestsTableTableManager get tests =>
      $$TestsTableTableManager(_db, _db.tests);
  $$QuestionsTableTableManager get questions =>
      $$QuestionsTableTableManager(_db, _db.questions);
  $$ResultsTableTableManager get results =>
      $$ResultsTableTableManager(_db, _db.results);
  $$SettingsTableTableManager get settings =>
      $$SettingsTableTableManager(_db, _db.settings);
  $$PracticeRemindersTableTableManager get practiceReminders =>
      $$PracticeRemindersTableTableManager(_db, _db.practiceReminders);
  $$ExamRemindersTableTableManager get examReminders =>
      $$ExamRemindersTableTableManager(_db, _db.examReminders);
}
