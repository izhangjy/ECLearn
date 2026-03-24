// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $WordsTable extends Words with TableInfo<$WordsTable, Word> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _wordMeta = const VerificationMeta('word');
  @override
  late final GeneratedColumn<String> word = GeneratedColumn<String>(
      'word', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _phoneticMeta =
      const VerificationMeta('phonetic');
  @override
  late final GeneratedColumn<String> phonetic = GeneratedColumn<String>(
      'phonetic', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _meaningsJsonMeta =
      const VerificationMeta('meaningsJson');
  @override
  late final GeneratedColumn<String> meaningsJson = GeneratedColumn<String>(
      'meanings_json', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _exampleMeta =
      const VerificationMeta('example');
  @override
  late final GeneratedColumn<String> example = GeneratedColumn<String>(
      'example', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _exampleCnMeta =
      const VerificationMeta('exampleCn');
  @override
  late final GeneratedColumn<String> exampleCn = GeneratedColumn<String>(
      'example_cn', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _derivativesJsonMeta =
      const VerificationMeta('derivativesJson');
  @override
  late final GeneratedColumn<String> derivativesJson = GeneratedColumn<String>(
      'derivatives_json', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('[]'));
  static const VerificationMeta _unitIdMeta = const VerificationMeta('unitId');
  @override
  late final GeneratedColumn<String> unitId = GeneratedColumn<String>(
      'unit_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _frequencyMeta =
      const VerificationMeta('frequency');
  @override
  late final GeneratedColumn<String> frequency = GeneratedColumn<String>(
      'frequency', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('中频'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        word,
        phonetic,
        meaningsJson,
        example,
        exampleCn,
        derivativesJson,
        unitId,
        frequency
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'words';
  @override
  VerificationContext validateIntegrity(Insertable<Word> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('word')) {
      context.handle(
          _wordMeta, word.isAcceptableOrUnknown(data['word']!, _wordMeta));
    } else if (isInserting) {
      context.missing(_wordMeta);
    }
    if (data.containsKey('phonetic')) {
      context.handle(_phoneticMeta,
          phonetic.isAcceptableOrUnknown(data['phonetic']!, _phoneticMeta));
    }
    if (data.containsKey('meanings_json')) {
      context.handle(
          _meaningsJsonMeta,
          meaningsJson.isAcceptableOrUnknown(
              data['meanings_json']!, _meaningsJsonMeta));
    } else if (isInserting) {
      context.missing(_meaningsJsonMeta);
    }
    if (data.containsKey('example')) {
      context.handle(_exampleMeta,
          example.isAcceptableOrUnknown(data['example']!, _exampleMeta));
    }
    if (data.containsKey('example_cn')) {
      context.handle(_exampleCnMeta,
          exampleCn.isAcceptableOrUnknown(data['example_cn']!, _exampleCnMeta));
    }
    if (data.containsKey('derivatives_json')) {
      context.handle(
          _derivativesJsonMeta,
          derivativesJson.isAcceptableOrUnknown(
              data['derivatives_json']!, _derivativesJsonMeta));
    }
    if (data.containsKey('unit_id')) {
      context.handle(_unitIdMeta,
          unitId.isAcceptableOrUnknown(data['unit_id']!, _unitIdMeta));
    } else if (isInserting) {
      context.missing(_unitIdMeta);
    }
    if (data.containsKey('frequency')) {
      context.handle(_frequencyMeta,
          frequency.isAcceptableOrUnknown(data['frequency']!, _frequencyMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Word map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Word(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      word: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}word'])!,
      phonetic: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phonetic'])!,
      meaningsJson: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}meanings_json'])!,
      example: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}example']),
      exampleCn: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}example_cn']),
      derivativesJson: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}derivatives_json'])!,
      unitId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}unit_id'])!,
      frequency: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}frequency'])!,
    );
  }

  @override
  $WordsTable createAlias(String alias) {
    return $WordsTable(attachedDatabase, alias);
  }
}

class Word extends DataClass implements Insertable<Word> {
  final String id;
  final String word;
  final String phonetic;
  final String meaningsJson;
  final String? example;
  final String? exampleCn;
  final String derivativesJson;
  final String unitId;
  final String frequency;
  const Word(
      {required this.id,
      required this.word,
      required this.phonetic,
      required this.meaningsJson,
      this.example,
      this.exampleCn,
      required this.derivativesJson,
      required this.unitId,
      required this.frequency});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['word'] = Variable<String>(word);
    map['phonetic'] = Variable<String>(phonetic);
    map['meanings_json'] = Variable<String>(meaningsJson);
    if (!nullToAbsent || example != null) {
      map['example'] = Variable<String>(example);
    }
    if (!nullToAbsent || exampleCn != null) {
      map['example_cn'] = Variable<String>(exampleCn);
    }
    map['derivatives_json'] = Variable<String>(derivativesJson);
    map['unit_id'] = Variable<String>(unitId);
    map['frequency'] = Variable<String>(frequency);
    return map;
  }

  WordsCompanion toCompanion(bool nullToAbsent) {
    return WordsCompanion(
      id: Value(id),
      word: Value(word),
      phonetic: Value(phonetic),
      meaningsJson: Value(meaningsJson),
      example: example == null && nullToAbsent
          ? const Value.absent()
          : Value(example),
      exampleCn: exampleCn == null && nullToAbsent
          ? const Value.absent()
          : Value(exampleCn),
      derivativesJson: Value(derivativesJson),
      unitId: Value(unitId),
      frequency: Value(frequency),
    );
  }

  factory Word.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Word(
      id: serializer.fromJson<String>(json['id']),
      word: serializer.fromJson<String>(json['word']),
      phonetic: serializer.fromJson<String>(json['phonetic']),
      meaningsJson: serializer.fromJson<String>(json['meaningsJson']),
      example: serializer.fromJson<String?>(json['example']),
      exampleCn: serializer.fromJson<String?>(json['exampleCn']),
      derivativesJson: serializer.fromJson<String>(json['derivativesJson']),
      unitId: serializer.fromJson<String>(json['unitId']),
      frequency: serializer.fromJson<String>(json['frequency']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'word': serializer.toJson<String>(word),
      'phonetic': serializer.toJson<String>(phonetic),
      'meaningsJson': serializer.toJson<String>(meaningsJson),
      'example': serializer.toJson<String?>(example),
      'exampleCn': serializer.toJson<String?>(exampleCn),
      'derivativesJson': serializer.toJson<String>(derivativesJson),
      'unitId': serializer.toJson<String>(unitId),
      'frequency': serializer.toJson<String>(frequency),
    };
  }

  Word copyWith(
          {String? id,
          String? word,
          String? phonetic,
          String? meaningsJson,
          Value<String?> example = const Value.absent(),
          Value<String?> exampleCn = const Value.absent(),
          String? derivativesJson,
          String? unitId,
          String? frequency}) =>
      Word(
        id: id ?? this.id,
        word: word ?? this.word,
        phonetic: phonetic ?? this.phonetic,
        meaningsJson: meaningsJson ?? this.meaningsJson,
        example: example.present ? example.value : this.example,
        exampleCn: exampleCn.present ? exampleCn.value : this.exampleCn,
        derivativesJson: derivativesJson ?? this.derivativesJson,
        unitId: unitId ?? this.unitId,
        frequency: frequency ?? this.frequency,
      );
  Word copyWithCompanion(WordsCompanion data) {
    return Word(
      id: data.id.present ? data.id.value : this.id,
      word: data.word.present ? data.word.value : this.word,
      phonetic: data.phonetic.present ? data.phonetic.value : this.phonetic,
      meaningsJson: data.meaningsJson.present
          ? data.meaningsJson.value
          : this.meaningsJson,
      example: data.example.present ? data.example.value : this.example,
      exampleCn: data.exampleCn.present ? data.exampleCn.value : this.exampleCn,
      derivativesJson: data.derivativesJson.present
          ? data.derivativesJson.value
          : this.derivativesJson,
      unitId: data.unitId.present ? data.unitId.value : this.unitId,
      frequency: data.frequency.present ? data.frequency.value : this.frequency,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Word(')
          ..write('id: $id, ')
          ..write('word: $word, ')
          ..write('phonetic: $phonetic, ')
          ..write('meaningsJson: $meaningsJson, ')
          ..write('example: $example, ')
          ..write('exampleCn: $exampleCn, ')
          ..write('derivativesJson: $derivativesJson, ')
          ..write('unitId: $unitId, ')
          ..write('frequency: $frequency')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, word, phonetic, meaningsJson, example,
      exampleCn, derivativesJson, unitId, frequency);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Word &&
          other.id == this.id &&
          other.word == this.word &&
          other.phonetic == this.phonetic &&
          other.meaningsJson == this.meaningsJson &&
          other.example == this.example &&
          other.exampleCn == this.exampleCn &&
          other.derivativesJson == this.derivativesJson &&
          other.unitId == this.unitId &&
          other.frequency == this.frequency);
}

class WordsCompanion extends UpdateCompanion<Word> {
  final Value<String> id;
  final Value<String> word;
  final Value<String> phonetic;
  final Value<String> meaningsJson;
  final Value<String?> example;
  final Value<String?> exampleCn;
  final Value<String> derivativesJson;
  final Value<String> unitId;
  final Value<String> frequency;
  final Value<int> rowid;
  const WordsCompanion({
    this.id = const Value.absent(),
    this.word = const Value.absent(),
    this.phonetic = const Value.absent(),
    this.meaningsJson = const Value.absent(),
    this.example = const Value.absent(),
    this.exampleCn = const Value.absent(),
    this.derivativesJson = const Value.absent(),
    this.unitId = const Value.absent(),
    this.frequency = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WordsCompanion.insert({
    required String id,
    required String word,
    this.phonetic = const Value.absent(),
    required String meaningsJson,
    this.example = const Value.absent(),
    this.exampleCn = const Value.absent(),
    this.derivativesJson = const Value.absent(),
    required String unitId,
    this.frequency = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        word = Value(word),
        meaningsJson = Value(meaningsJson),
        unitId = Value(unitId);
  static Insertable<Word> custom({
    Expression<String>? id,
    Expression<String>? word,
    Expression<String>? phonetic,
    Expression<String>? meaningsJson,
    Expression<String>? example,
    Expression<String>? exampleCn,
    Expression<String>? derivativesJson,
    Expression<String>? unitId,
    Expression<String>? frequency,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (word != null) 'word': word,
      if (phonetic != null) 'phonetic': phonetic,
      if (meaningsJson != null) 'meanings_json': meaningsJson,
      if (example != null) 'example': example,
      if (exampleCn != null) 'example_cn': exampleCn,
      if (derivativesJson != null) 'derivatives_json': derivativesJson,
      if (unitId != null) 'unit_id': unitId,
      if (frequency != null) 'frequency': frequency,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WordsCompanion copyWith(
      {Value<String>? id,
      Value<String>? word,
      Value<String>? phonetic,
      Value<String>? meaningsJson,
      Value<String?>? example,
      Value<String?>? exampleCn,
      Value<String>? derivativesJson,
      Value<String>? unitId,
      Value<String>? frequency,
      Value<int>? rowid}) {
    return WordsCompanion(
      id: id ?? this.id,
      word: word ?? this.word,
      phonetic: phonetic ?? this.phonetic,
      meaningsJson: meaningsJson ?? this.meaningsJson,
      example: example ?? this.example,
      exampleCn: exampleCn ?? this.exampleCn,
      derivativesJson: derivativesJson ?? this.derivativesJson,
      unitId: unitId ?? this.unitId,
      frequency: frequency ?? this.frequency,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (word.present) {
      map['word'] = Variable<String>(word.value);
    }
    if (phonetic.present) {
      map['phonetic'] = Variable<String>(phonetic.value);
    }
    if (meaningsJson.present) {
      map['meanings_json'] = Variable<String>(meaningsJson.value);
    }
    if (example.present) {
      map['example'] = Variable<String>(example.value);
    }
    if (exampleCn.present) {
      map['example_cn'] = Variable<String>(exampleCn.value);
    }
    if (derivativesJson.present) {
      map['derivatives_json'] = Variable<String>(derivativesJson.value);
    }
    if (unitId.present) {
      map['unit_id'] = Variable<String>(unitId.value);
    }
    if (frequency.present) {
      map['frequency'] = Variable<String>(frequency.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WordsCompanion(')
          ..write('id: $id, ')
          ..write('word: $word, ')
          ..write('phonetic: $phonetic, ')
          ..write('meaningsJson: $meaningsJson, ')
          ..write('example: $example, ')
          ..write('exampleCn: $exampleCn, ')
          ..write('derivativesJson: $derivativesJson, ')
          ..write('unitId: $unitId, ')
          ..write('frequency: $frequency, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $UnitsTable extends Units with TableInfo<$UnitsTable, Unit> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UnitsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _subjectMeta =
      const VerificationMeta('subject');
  @override
  late final GeneratedColumn<String> subject = GeneratedColumn<String>(
      'subject', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _gradeMeta = const VerificationMeta('grade');
  @override
  late final GeneratedColumn<String> grade = GeneratedColumn<String>(
      'grade', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _textbookTypeMeta =
      const VerificationMeta('textbookType');
  @override
  late final GeneratedColumn<String> textbookType = GeneratedColumn<String>(
      'textbook_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _bookNumberMeta =
      const VerificationMeta('bookNumber');
  @override
  late final GeneratedColumn<int> bookNumber = GeneratedColumn<int>(
      'book_number', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _unitNumberMeta =
      const VerificationMeta('unitNumber');
  @override
  late final GeneratedColumn<int> unitNumber = GeneratedColumn<int>(
      'unit_number', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        subject,
        grade,
        textbookType,
        bookNumber,
        unitNumber,
        title,
        description
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'units';
  @override
  VerificationContext validateIntegrity(Insertable<Unit> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('subject')) {
      context.handle(_subjectMeta,
          subject.isAcceptableOrUnknown(data['subject']!, _subjectMeta));
    } else if (isInserting) {
      context.missing(_subjectMeta);
    }
    if (data.containsKey('grade')) {
      context.handle(
          _gradeMeta, grade.isAcceptableOrUnknown(data['grade']!, _gradeMeta));
    } else if (isInserting) {
      context.missing(_gradeMeta);
    }
    if (data.containsKey('textbook_type')) {
      context.handle(
          _textbookTypeMeta,
          textbookType.isAcceptableOrUnknown(
              data['textbook_type']!, _textbookTypeMeta));
    } else if (isInserting) {
      context.missing(_textbookTypeMeta);
    }
    if (data.containsKey('book_number')) {
      context.handle(
          _bookNumberMeta,
          bookNumber.isAcceptableOrUnknown(
              data['book_number']!, _bookNumberMeta));
    } else if (isInserting) {
      context.missing(_bookNumberMeta);
    }
    if (data.containsKey('unit_number')) {
      context.handle(
          _unitNumberMeta,
          unitNumber.isAcceptableOrUnknown(
              data['unit_number']!, _unitNumberMeta));
    } else if (isInserting) {
      context.missing(_unitNumberMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Unit map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Unit(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      subject: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}subject'])!,
      grade: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}grade'])!,
      textbookType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}textbook_type'])!,
      bookNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}book_number'])!,
      unitNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}unit_number'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
    );
  }

  @override
  $UnitsTable createAlias(String alias) {
    return $UnitsTable(attachedDatabase, alias);
  }
}

class Unit extends DataClass implements Insertable<Unit> {
  final String id;
  final String subject;
  final String grade;
  final String textbookType;
  final int bookNumber;
  final int unitNumber;
  final String title;
  final String? description;
  const Unit(
      {required this.id,
      required this.subject,
      required this.grade,
      required this.textbookType,
      required this.bookNumber,
      required this.unitNumber,
      required this.title,
      this.description});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['subject'] = Variable<String>(subject);
    map['grade'] = Variable<String>(grade);
    map['textbook_type'] = Variable<String>(textbookType);
    map['book_number'] = Variable<int>(bookNumber);
    map['unit_number'] = Variable<int>(unitNumber);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    return map;
  }

  UnitsCompanion toCompanion(bool nullToAbsent) {
    return UnitsCompanion(
      id: Value(id),
      subject: Value(subject),
      grade: Value(grade),
      textbookType: Value(textbookType),
      bookNumber: Value(bookNumber),
      unitNumber: Value(unitNumber),
      title: Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
    );
  }

  factory Unit.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Unit(
      id: serializer.fromJson<String>(json['id']),
      subject: serializer.fromJson<String>(json['subject']),
      grade: serializer.fromJson<String>(json['grade']),
      textbookType: serializer.fromJson<String>(json['textbookType']),
      bookNumber: serializer.fromJson<int>(json['bookNumber']),
      unitNumber: serializer.fromJson<int>(json['unitNumber']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String?>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'subject': serializer.toJson<String>(subject),
      'grade': serializer.toJson<String>(grade),
      'textbookType': serializer.toJson<String>(textbookType),
      'bookNumber': serializer.toJson<int>(bookNumber),
      'unitNumber': serializer.toJson<int>(unitNumber),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String?>(description),
    };
  }

  Unit copyWith(
          {String? id,
          String? subject,
          String? grade,
          String? textbookType,
          int? bookNumber,
          int? unitNumber,
          String? title,
          Value<String?> description = const Value.absent()}) =>
      Unit(
        id: id ?? this.id,
        subject: subject ?? this.subject,
        grade: grade ?? this.grade,
        textbookType: textbookType ?? this.textbookType,
        bookNumber: bookNumber ?? this.bookNumber,
        unitNumber: unitNumber ?? this.unitNumber,
        title: title ?? this.title,
        description: description.present ? description.value : this.description,
      );
  Unit copyWithCompanion(UnitsCompanion data) {
    return Unit(
      id: data.id.present ? data.id.value : this.id,
      subject: data.subject.present ? data.subject.value : this.subject,
      grade: data.grade.present ? data.grade.value : this.grade,
      textbookType: data.textbookType.present
          ? data.textbookType.value
          : this.textbookType,
      bookNumber:
          data.bookNumber.present ? data.bookNumber.value : this.bookNumber,
      unitNumber:
          data.unitNumber.present ? data.unitNumber.value : this.unitNumber,
      title: data.title.present ? data.title.value : this.title,
      description:
          data.description.present ? data.description.value : this.description,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Unit(')
          ..write('id: $id, ')
          ..write('subject: $subject, ')
          ..write('grade: $grade, ')
          ..write('textbookType: $textbookType, ')
          ..write('bookNumber: $bookNumber, ')
          ..write('unitNumber: $unitNumber, ')
          ..write('title: $title, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, subject, grade, textbookType, bookNumber,
      unitNumber, title, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Unit &&
          other.id == this.id &&
          other.subject == this.subject &&
          other.grade == this.grade &&
          other.textbookType == this.textbookType &&
          other.bookNumber == this.bookNumber &&
          other.unitNumber == this.unitNumber &&
          other.title == this.title &&
          other.description == this.description);
}

class UnitsCompanion extends UpdateCompanion<Unit> {
  final Value<String> id;
  final Value<String> subject;
  final Value<String> grade;
  final Value<String> textbookType;
  final Value<int> bookNumber;
  final Value<int> unitNumber;
  final Value<String> title;
  final Value<String?> description;
  final Value<int> rowid;
  const UnitsCompanion({
    this.id = const Value.absent(),
    this.subject = const Value.absent(),
    this.grade = const Value.absent(),
    this.textbookType = const Value.absent(),
    this.bookNumber = const Value.absent(),
    this.unitNumber = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UnitsCompanion.insert({
    required String id,
    required String subject,
    required String grade,
    required String textbookType,
    required int bookNumber,
    required int unitNumber,
    required String title,
    this.description = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        subject = Value(subject),
        grade = Value(grade),
        textbookType = Value(textbookType),
        bookNumber = Value(bookNumber),
        unitNumber = Value(unitNumber),
        title = Value(title);
  static Insertable<Unit> custom({
    Expression<String>? id,
    Expression<String>? subject,
    Expression<String>? grade,
    Expression<String>? textbookType,
    Expression<int>? bookNumber,
    Expression<int>? unitNumber,
    Expression<String>? title,
    Expression<String>? description,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (subject != null) 'subject': subject,
      if (grade != null) 'grade': grade,
      if (textbookType != null) 'textbook_type': textbookType,
      if (bookNumber != null) 'book_number': bookNumber,
      if (unitNumber != null) 'unit_number': unitNumber,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UnitsCompanion copyWith(
      {Value<String>? id,
      Value<String>? subject,
      Value<String>? grade,
      Value<String>? textbookType,
      Value<int>? bookNumber,
      Value<int>? unitNumber,
      Value<String>? title,
      Value<String?>? description,
      Value<int>? rowid}) {
    return UnitsCompanion(
      id: id ?? this.id,
      subject: subject ?? this.subject,
      grade: grade ?? this.grade,
      textbookType: textbookType ?? this.textbookType,
      bookNumber: bookNumber ?? this.bookNumber,
      unitNumber: unitNumber ?? this.unitNumber,
      title: title ?? this.title,
      description: description ?? this.description,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (subject.present) {
      map['subject'] = Variable<String>(subject.value);
    }
    if (grade.present) {
      map['grade'] = Variable<String>(grade.value);
    }
    if (textbookType.present) {
      map['textbook_type'] = Variable<String>(textbookType.value);
    }
    if (bookNumber.present) {
      map['book_number'] = Variable<int>(bookNumber.value);
    }
    if (unitNumber.present) {
      map['unit_number'] = Variable<int>(unitNumber.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UnitsCompanion(')
          ..write('id: $id, ')
          ..write('subject: $subject, ')
          ..write('grade: $grade, ')
          ..write('textbookType: $textbookType, ')
          ..write('bookNumber: $bookNumber, ')
          ..write('unitNumber: $unitNumber, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PracticeRecordsTable extends PracticeRecords
    with TableInfo<$PracticeRecordsTable, PracticeRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PracticeRecordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _itemIdMeta = const VerificationMeta('itemId');
  @override
  late final GeneratedColumn<String> itemId = GeneratedColumn<String>(
      'item_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _itemTypeMeta =
      const VerificationMeta('itemType');
  @override
  late final GeneratedColumn<String> itemType = GeneratedColumn<String>(
      'item_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isCorrectMeta =
      const VerificationMeta('isCorrect');
  @override
  late final GeneratedColumn<bool> isCorrect = GeneratedColumn<bool>(
      'is_correct', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_correct" IN (0, 1))'));
  static const VerificationMeta _practiceTimeMeta =
      const VerificationMeta('practiceTime');
  @override
  late final GeneratedColumn<DateTime> practiceTime = GeneratedColumn<DateTime>(
      'practice_time', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _responseTimeMsMeta =
      const VerificationMeta('responseTimeMs');
  @override
  late final GeneratedColumn<int> responseTimeMs = GeneratedColumn<int>(
      'response_time_ms', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _userAnswerMeta =
      const VerificationMeta('userAnswer');
  @override
  late final GeneratedColumn<String> userAnswer = GeneratedColumn<String>(
      'user_answer', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _errorReasonMeta =
      const VerificationMeta('errorReason');
  @override
  late final GeneratedColumn<String> errorReason = GeneratedColumn<String>(
      'error_reason', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        itemId,
        itemType,
        isCorrect,
        practiceTime,
        responseTimeMs,
        userAnswer,
        errorReason
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'practice_records';
  @override
  VerificationContext validateIntegrity(Insertable<PracticeRecord> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('item_id')) {
      context.handle(_itemIdMeta,
          itemId.isAcceptableOrUnknown(data['item_id']!, _itemIdMeta));
    } else if (isInserting) {
      context.missing(_itemIdMeta);
    }
    if (data.containsKey('item_type')) {
      context.handle(_itemTypeMeta,
          itemType.isAcceptableOrUnknown(data['item_type']!, _itemTypeMeta));
    } else if (isInserting) {
      context.missing(_itemTypeMeta);
    }
    if (data.containsKey('is_correct')) {
      context.handle(_isCorrectMeta,
          isCorrect.isAcceptableOrUnknown(data['is_correct']!, _isCorrectMeta));
    } else if (isInserting) {
      context.missing(_isCorrectMeta);
    }
    if (data.containsKey('practice_time')) {
      context.handle(
          _practiceTimeMeta,
          practiceTime.isAcceptableOrUnknown(
              data['practice_time']!, _practiceTimeMeta));
    } else if (isInserting) {
      context.missing(_practiceTimeMeta);
    }
    if (data.containsKey('response_time_ms')) {
      context.handle(
          _responseTimeMsMeta,
          responseTimeMs.isAcceptableOrUnknown(
              data['response_time_ms']!, _responseTimeMsMeta));
    }
    if (data.containsKey('user_answer')) {
      context.handle(
          _userAnswerMeta,
          userAnswer.isAcceptableOrUnknown(
              data['user_answer']!, _userAnswerMeta));
    }
    if (data.containsKey('error_reason')) {
      context.handle(
          _errorReasonMeta,
          errorReason.isAcceptableOrUnknown(
              data['error_reason']!, _errorReasonMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PracticeRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PracticeRecord(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      itemId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}item_id'])!,
      itemType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}item_type'])!,
      isCorrect: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_correct'])!,
      practiceTime: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}practice_time'])!,
      responseTimeMs: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}response_time_ms'])!,
      userAnswer: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_answer']),
      errorReason: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}error_reason']),
    );
  }

  @override
  $PracticeRecordsTable createAlias(String alias) {
    return $PracticeRecordsTable(attachedDatabase, alias);
  }
}

class PracticeRecord extends DataClass implements Insertable<PracticeRecord> {
  final String id;
  final String itemId;
  final String itemType;
  final bool isCorrect;
  final DateTime practiceTime;
  final int responseTimeMs;
  final String? userAnswer;
  final String? errorReason;
  const PracticeRecord(
      {required this.id,
      required this.itemId,
      required this.itemType,
      required this.isCorrect,
      required this.practiceTime,
      required this.responseTimeMs,
      this.userAnswer,
      this.errorReason});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['item_id'] = Variable<String>(itemId);
    map['item_type'] = Variable<String>(itemType);
    map['is_correct'] = Variable<bool>(isCorrect);
    map['practice_time'] = Variable<DateTime>(practiceTime);
    map['response_time_ms'] = Variable<int>(responseTimeMs);
    if (!nullToAbsent || userAnswer != null) {
      map['user_answer'] = Variable<String>(userAnswer);
    }
    if (!nullToAbsent || errorReason != null) {
      map['error_reason'] = Variable<String>(errorReason);
    }
    return map;
  }

  PracticeRecordsCompanion toCompanion(bool nullToAbsent) {
    return PracticeRecordsCompanion(
      id: Value(id),
      itemId: Value(itemId),
      itemType: Value(itemType),
      isCorrect: Value(isCorrect),
      practiceTime: Value(practiceTime),
      responseTimeMs: Value(responseTimeMs),
      userAnswer: userAnswer == null && nullToAbsent
          ? const Value.absent()
          : Value(userAnswer),
      errorReason: errorReason == null && nullToAbsent
          ? const Value.absent()
          : Value(errorReason),
    );
  }

  factory PracticeRecord.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PracticeRecord(
      id: serializer.fromJson<String>(json['id']),
      itemId: serializer.fromJson<String>(json['itemId']),
      itemType: serializer.fromJson<String>(json['itemType']),
      isCorrect: serializer.fromJson<bool>(json['isCorrect']),
      practiceTime: serializer.fromJson<DateTime>(json['practiceTime']),
      responseTimeMs: serializer.fromJson<int>(json['responseTimeMs']),
      userAnswer: serializer.fromJson<String?>(json['userAnswer']),
      errorReason: serializer.fromJson<String?>(json['errorReason']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'itemId': serializer.toJson<String>(itemId),
      'itemType': serializer.toJson<String>(itemType),
      'isCorrect': serializer.toJson<bool>(isCorrect),
      'practiceTime': serializer.toJson<DateTime>(practiceTime),
      'responseTimeMs': serializer.toJson<int>(responseTimeMs),
      'userAnswer': serializer.toJson<String?>(userAnswer),
      'errorReason': serializer.toJson<String?>(errorReason),
    };
  }

  PracticeRecord copyWith(
          {String? id,
          String? itemId,
          String? itemType,
          bool? isCorrect,
          DateTime? practiceTime,
          int? responseTimeMs,
          Value<String?> userAnswer = const Value.absent(),
          Value<String?> errorReason = const Value.absent()}) =>
      PracticeRecord(
        id: id ?? this.id,
        itemId: itemId ?? this.itemId,
        itemType: itemType ?? this.itemType,
        isCorrect: isCorrect ?? this.isCorrect,
        practiceTime: practiceTime ?? this.practiceTime,
        responseTimeMs: responseTimeMs ?? this.responseTimeMs,
        userAnswer: userAnswer.present ? userAnswer.value : this.userAnswer,
        errorReason: errorReason.present ? errorReason.value : this.errorReason,
      );
  PracticeRecord copyWithCompanion(PracticeRecordsCompanion data) {
    return PracticeRecord(
      id: data.id.present ? data.id.value : this.id,
      itemId: data.itemId.present ? data.itemId.value : this.itemId,
      itemType: data.itemType.present ? data.itemType.value : this.itemType,
      isCorrect: data.isCorrect.present ? data.isCorrect.value : this.isCorrect,
      practiceTime: data.practiceTime.present
          ? data.practiceTime.value
          : this.practiceTime,
      responseTimeMs: data.responseTimeMs.present
          ? data.responseTimeMs.value
          : this.responseTimeMs,
      userAnswer:
          data.userAnswer.present ? data.userAnswer.value : this.userAnswer,
      errorReason:
          data.errorReason.present ? data.errorReason.value : this.errorReason,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PracticeRecord(')
          ..write('id: $id, ')
          ..write('itemId: $itemId, ')
          ..write('itemType: $itemType, ')
          ..write('isCorrect: $isCorrect, ')
          ..write('practiceTime: $practiceTime, ')
          ..write('responseTimeMs: $responseTimeMs, ')
          ..write('userAnswer: $userAnswer, ')
          ..write('errorReason: $errorReason')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, itemId, itemType, isCorrect, practiceTime,
      responseTimeMs, userAnswer, errorReason);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PracticeRecord &&
          other.id == this.id &&
          other.itemId == this.itemId &&
          other.itemType == this.itemType &&
          other.isCorrect == this.isCorrect &&
          other.practiceTime == this.practiceTime &&
          other.responseTimeMs == this.responseTimeMs &&
          other.userAnswer == this.userAnswer &&
          other.errorReason == this.errorReason);
}

class PracticeRecordsCompanion extends UpdateCompanion<PracticeRecord> {
  final Value<String> id;
  final Value<String> itemId;
  final Value<String> itemType;
  final Value<bool> isCorrect;
  final Value<DateTime> practiceTime;
  final Value<int> responseTimeMs;
  final Value<String?> userAnswer;
  final Value<String?> errorReason;
  final Value<int> rowid;
  const PracticeRecordsCompanion({
    this.id = const Value.absent(),
    this.itemId = const Value.absent(),
    this.itemType = const Value.absent(),
    this.isCorrect = const Value.absent(),
    this.practiceTime = const Value.absent(),
    this.responseTimeMs = const Value.absent(),
    this.userAnswer = const Value.absent(),
    this.errorReason = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PracticeRecordsCompanion.insert({
    required String id,
    required String itemId,
    required String itemType,
    required bool isCorrect,
    required DateTime practiceTime,
    this.responseTimeMs = const Value.absent(),
    this.userAnswer = const Value.absent(),
    this.errorReason = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        itemId = Value(itemId),
        itemType = Value(itemType),
        isCorrect = Value(isCorrect),
        practiceTime = Value(practiceTime);
  static Insertable<PracticeRecord> custom({
    Expression<String>? id,
    Expression<String>? itemId,
    Expression<String>? itemType,
    Expression<bool>? isCorrect,
    Expression<DateTime>? practiceTime,
    Expression<int>? responseTimeMs,
    Expression<String>? userAnswer,
    Expression<String>? errorReason,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (itemId != null) 'item_id': itemId,
      if (itemType != null) 'item_type': itemType,
      if (isCorrect != null) 'is_correct': isCorrect,
      if (practiceTime != null) 'practice_time': practiceTime,
      if (responseTimeMs != null) 'response_time_ms': responseTimeMs,
      if (userAnswer != null) 'user_answer': userAnswer,
      if (errorReason != null) 'error_reason': errorReason,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PracticeRecordsCompanion copyWith(
      {Value<String>? id,
      Value<String>? itemId,
      Value<String>? itemType,
      Value<bool>? isCorrect,
      Value<DateTime>? practiceTime,
      Value<int>? responseTimeMs,
      Value<String?>? userAnswer,
      Value<String?>? errorReason,
      Value<int>? rowid}) {
    return PracticeRecordsCompanion(
      id: id ?? this.id,
      itemId: itemId ?? this.itemId,
      itemType: itemType ?? this.itemType,
      isCorrect: isCorrect ?? this.isCorrect,
      practiceTime: practiceTime ?? this.practiceTime,
      responseTimeMs: responseTimeMs ?? this.responseTimeMs,
      userAnswer: userAnswer ?? this.userAnswer,
      errorReason: errorReason ?? this.errorReason,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (itemId.present) {
      map['item_id'] = Variable<String>(itemId.value);
    }
    if (itemType.present) {
      map['item_type'] = Variable<String>(itemType.value);
    }
    if (isCorrect.present) {
      map['is_correct'] = Variable<bool>(isCorrect.value);
    }
    if (practiceTime.present) {
      map['practice_time'] = Variable<DateTime>(practiceTime.value);
    }
    if (responseTimeMs.present) {
      map['response_time_ms'] = Variable<int>(responseTimeMs.value);
    }
    if (userAnswer.present) {
      map['user_answer'] = Variable<String>(userAnswer.value);
    }
    if (errorReason.present) {
      map['error_reason'] = Variable<String>(errorReason.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PracticeRecordsCompanion(')
          ..write('id: $id, ')
          ..write('itemId: $itemId, ')
          ..write('itemType: $itemType, ')
          ..write('isCorrect: $isCorrect, ')
          ..write('practiceTime: $practiceTime, ')
          ..write('responseTimeMs: $responseTimeMs, ')
          ..write('userAnswer: $userAnswer, ')
          ..write('errorReason: $errorReason, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MasteryStatesTable extends MasteryStates
    with TableInfo<$MasteryStatesTable, MasteryState> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MasteryStatesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _itemIdMeta = const VerificationMeta('itemId');
  @override
  late final GeneratedColumn<String> itemId = GeneratedColumn<String>(
      'item_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _itemTypeMeta =
      const VerificationMeta('itemType');
  @override
  late final GeneratedColumn<String> itemType = GeneratedColumn<String>(
      'item_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('notStarted'));
  static const VerificationMeta _correctStreakMeta =
      const VerificationMeta('correctStreak');
  @override
  late final GeneratedColumn<int> correctStreak = GeneratedColumn<int>(
      'correct_streak', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _totalAttemptsMeta =
      const VerificationMeta('totalAttempts');
  @override
  late final GeneratedColumn<int> totalAttempts = GeneratedColumn<int>(
      'total_attempts', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _correctCountMeta =
      const VerificationMeta('correctCount');
  @override
  late final GeneratedColumn<int> correctCount = GeneratedColumn<int>(
      'correct_count', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _lastPracticeMeta =
      const VerificationMeta('lastPractice');
  @override
  late final GeneratedColumn<DateTime> lastPractice = GeneratedColumn<DateTime>(
      'last_practice', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _nextReviewMeta =
      const VerificationMeta('nextReview');
  @override
  late final GeneratedColumn<DateTime> nextReview = GeneratedColumn<DateTime>(
      'next_review', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        itemId,
        itemType,
        status,
        correctStreak,
        totalAttempts,
        correctCount,
        lastPractice,
        nextReview
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'mastery_states';
  @override
  VerificationContext validateIntegrity(Insertable<MasteryState> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('item_id')) {
      context.handle(_itemIdMeta,
          itemId.isAcceptableOrUnknown(data['item_id']!, _itemIdMeta));
    } else if (isInserting) {
      context.missing(_itemIdMeta);
    }
    if (data.containsKey('item_type')) {
      context.handle(_itemTypeMeta,
          itemType.isAcceptableOrUnknown(data['item_type']!, _itemTypeMeta));
    } else if (isInserting) {
      context.missing(_itemTypeMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('correct_streak')) {
      context.handle(
          _correctStreakMeta,
          correctStreak.isAcceptableOrUnknown(
              data['correct_streak']!, _correctStreakMeta));
    }
    if (data.containsKey('total_attempts')) {
      context.handle(
          _totalAttemptsMeta,
          totalAttempts.isAcceptableOrUnknown(
              data['total_attempts']!, _totalAttemptsMeta));
    }
    if (data.containsKey('correct_count')) {
      context.handle(
          _correctCountMeta,
          correctCount.isAcceptableOrUnknown(
              data['correct_count']!, _correctCountMeta));
    }
    if (data.containsKey('last_practice')) {
      context.handle(
          _lastPracticeMeta,
          lastPractice.isAcceptableOrUnknown(
              data['last_practice']!, _lastPracticeMeta));
    }
    if (data.containsKey('next_review')) {
      context.handle(
          _nextReviewMeta,
          nextReview.isAcceptableOrUnknown(
              data['next_review']!, _nextReviewMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {itemId, itemType};
  @override
  MasteryState map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MasteryState(
      itemId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}item_id'])!,
      itemType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}item_type'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      correctStreak: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}correct_streak'])!,
      totalAttempts: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}total_attempts'])!,
      correctCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}correct_count'])!,
      lastPractice: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}last_practice']),
      nextReview: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}next_review']),
    );
  }

  @override
  $MasteryStatesTable createAlias(String alias) {
    return $MasteryStatesTable(attachedDatabase, alias);
  }
}

class MasteryState extends DataClass implements Insertable<MasteryState> {
  final String itemId;
  final String itemType;
  final String status;
  final int correctStreak;
  final int totalAttempts;
  final int correctCount;
  final DateTime? lastPractice;
  final DateTime? nextReview;
  const MasteryState(
      {required this.itemId,
      required this.itemType,
      required this.status,
      required this.correctStreak,
      required this.totalAttempts,
      required this.correctCount,
      this.lastPractice,
      this.nextReview});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['item_id'] = Variable<String>(itemId);
    map['item_type'] = Variable<String>(itemType);
    map['status'] = Variable<String>(status);
    map['correct_streak'] = Variable<int>(correctStreak);
    map['total_attempts'] = Variable<int>(totalAttempts);
    map['correct_count'] = Variable<int>(correctCount);
    if (!nullToAbsent || lastPractice != null) {
      map['last_practice'] = Variable<DateTime>(lastPractice);
    }
    if (!nullToAbsent || nextReview != null) {
      map['next_review'] = Variable<DateTime>(nextReview);
    }
    return map;
  }

  MasteryStatesCompanion toCompanion(bool nullToAbsent) {
    return MasteryStatesCompanion(
      itemId: Value(itemId),
      itemType: Value(itemType),
      status: Value(status),
      correctStreak: Value(correctStreak),
      totalAttempts: Value(totalAttempts),
      correctCount: Value(correctCount),
      lastPractice: lastPractice == null && nullToAbsent
          ? const Value.absent()
          : Value(lastPractice),
      nextReview: nextReview == null && nullToAbsent
          ? const Value.absent()
          : Value(nextReview),
    );
  }

  factory MasteryState.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MasteryState(
      itemId: serializer.fromJson<String>(json['itemId']),
      itemType: serializer.fromJson<String>(json['itemType']),
      status: serializer.fromJson<String>(json['status']),
      correctStreak: serializer.fromJson<int>(json['correctStreak']),
      totalAttempts: serializer.fromJson<int>(json['totalAttempts']),
      correctCount: serializer.fromJson<int>(json['correctCount']),
      lastPractice: serializer.fromJson<DateTime?>(json['lastPractice']),
      nextReview: serializer.fromJson<DateTime?>(json['nextReview']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'itemId': serializer.toJson<String>(itemId),
      'itemType': serializer.toJson<String>(itemType),
      'status': serializer.toJson<String>(status),
      'correctStreak': serializer.toJson<int>(correctStreak),
      'totalAttempts': serializer.toJson<int>(totalAttempts),
      'correctCount': serializer.toJson<int>(correctCount),
      'lastPractice': serializer.toJson<DateTime?>(lastPractice),
      'nextReview': serializer.toJson<DateTime?>(nextReview),
    };
  }

  MasteryState copyWith(
          {String? itemId,
          String? itemType,
          String? status,
          int? correctStreak,
          int? totalAttempts,
          int? correctCount,
          Value<DateTime?> lastPractice = const Value.absent(),
          Value<DateTime?> nextReview = const Value.absent()}) =>
      MasteryState(
        itemId: itemId ?? this.itemId,
        itemType: itemType ?? this.itemType,
        status: status ?? this.status,
        correctStreak: correctStreak ?? this.correctStreak,
        totalAttempts: totalAttempts ?? this.totalAttempts,
        correctCount: correctCount ?? this.correctCount,
        lastPractice:
            lastPractice.present ? lastPractice.value : this.lastPractice,
        nextReview: nextReview.present ? nextReview.value : this.nextReview,
      );
  MasteryState copyWithCompanion(MasteryStatesCompanion data) {
    return MasteryState(
      itemId: data.itemId.present ? data.itemId.value : this.itemId,
      itemType: data.itemType.present ? data.itemType.value : this.itemType,
      status: data.status.present ? data.status.value : this.status,
      correctStreak: data.correctStreak.present
          ? data.correctStreak.value
          : this.correctStreak,
      totalAttempts: data.totalAttempts.present
          ? data.totalAttempts.value
          : this.totalAttempts,
      correctCount: data.correctCount.present
          ? data.correctCount.value
          : this.correctCount,
      lastPractice: data.lastPractice.present
          ? data.lastPractice.value
          : this.lastPractice,
      nextReview:
          data.nextReview.present ? data.nextReview.value : this.nextReview,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MasteryState(')
          ..write('itemId: $itemId, ')
          ..write('itemType: $itemType, ')
          ..write('status: $status, ')
          ..write('correctStreak: $correctStreak, ')
          ..write('totalAttempts: $totalAttempts, ')
          ..write('correctCount: $correctCount, ')
          ..write('lastPractice: $lastPractice, ')
          ..write('nextReview: $nextReview')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(itemId, itemType, status, correctStreak,
      totalAttempts, correctCount, lastPractice, nextReview);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MasteryState &&
          other.itemId == this.itemId &&
          other.itemType == this.itemType &&
          other.status == this.status &&
          other.correctStreak == this.correctStreak &&
          other.totalAttempts == this.totalAttempts &&
          other.correctCount == this.correctCount &&
          other.lastPractice == this.lastPractice &&
          other.nextReview == this.nextReview);
}

class MasteryStatesCompanion extends UpdateCompanion<MasteryState> {
  final Value<String> itemId;
  final Value<String> itemType;
  final Value<String> status;
  final Value<int> correctStreak;
  final Value<int> totalAttempts;
  final Value<int> correctCount;
  final Value<DateTime?> lastPractice;
  final Value<DateTime?> nextReview;
  final Value<int> rowid;
  const MasteryStatesCompanion({
    this.itemId = const Value.absent(),
    this.itemType = const Value.absent(),
    this.status = const Value.absent(),
    this.correctStreak = const Value.absent(),
    this.totalAttempts = const Value.absent(),
    this.correctCount = const Value.absent(),
    this.lastPractice = const Value.absent(),
    this.nextReview = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MasteryStatesCompanion.insert({
    required String itemId,
    required String itemType,
    this.status = const Value.absent(),
    this.correctStreak = const Value.absent(),
    this.totalAttempts = const Value.absent(),
    this.correctCount = const Value.absent(),
    this.lastPractice = const Value.absent(),
    this.nextReview = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : itemId = Value(itemId),
        itemType = Value(itemType);
  static Insertable<MasteryState> custom({
    Expression<String>? itemId,
    Expression<String>? itemType,
    Expression<String>? status,
    Expression<int>? correctStreak,
    Expression<int>? totalAttempts,
    Expression<int>? correctCount,
    Expression<DateTime>? lastPractice,
    Expression<DateTime>? nextReview,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (itemId != null) 'item_id': itemId,
      if (itemType != null) 'item_type': itemType,
      if (status != null) 'status': status,
      if (correctStreak != null) 'correct_streak': correctStreak,
      if (totalAttempts != null) 'total_attempts': totalAttempts,
      if (correctCount != null) 'correct_count': correctCount,
      if (lastPractice != null) 'last_practice': lastPractice,
      if (nextReview != null) 'next_review': nextReview,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MasteryStatesCompanion copyWith(
      {Value<String>? itemId,
      Value<String>? itemType,
      Value<String>? status,
      Value<int>? correctStreak,
      Value<int>? totalAttempts,
      Value<int>? correctCount,
      Value<DateTime?>? lastPractice,
      Value<DateTime?>? nextReview,
      Value<int>? rowid}) {
    return MasteryStatesCompanion(
      itemId: itemId ?? this.itemId,
      itemType: itemType ?? this.itemType,
      status: status ?? this.status,
      correctStreak: correctStreak ?? this.correctStreak,
      totalAttempts: totalAttempts ?? this.totalAttempts,
      correctCount: correctCount ?? this.correctCount,
      lastPractice: lastPractice ?? this.lastPractice,
      nextReview: nextReview ?? this.nextReview,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (itemId.present) {
      map['item_id'] = Variable<String>(itemId.value);
    }
    if (itemType.present) {
      map['item_type'] = Variable<String>(itemType.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (correctStreak.present) {
      map['correct_streak'] = Variable<int>(correctStreak.value);
    }
    if (totalAttempts.present) {
      map['total_attempts'] = Variable<int>(totalAttempts.value);
    }
    if (correctCount.present) {
      map['correct_count'] = Variable<int>(correctCount.value);
    }
    if (lastPractice.present) {
      map['last_practice'] = Variable<DateTime>(lastPractice.value);
    }
    if (nextReview.present) {
      map['next_review'] = Variable<DateTime>(nextReview.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MasteryStatesCompanion(')
          ..write('itemId: $itemId, ')
          ..write('itemType: $itemType, ')
          ..write('status: $status, ')
          ..write('correctStreak: $correctStreak, ')
          ..write('totalAttempts: $totalAttempts, ')
          ..write('correctCount: $correctCount, ')
          ..write('lastPractice: $lastPractice, ')
          ..write('nextReview: $nextReview, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $WrongItemsTable extends WrongItems
    with TableInfo<$WrongItemsTable, WrongItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WrongItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _itemIdMeta = const VerificationMeta('itemId');
  @override
  late final GeneratedColumn<String> itemId = GeneratedColumn<String>(
      'item_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _itemTypeMeta =
      const VerificationMeta('itemType');
  @override
  late final GeneratedColumn<String> itemType = GeneratedColumn<String>(
      'item_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _unitIdMeta = const VerificationMeta('unitId');
  @override
  late final GeneratedColumn<String> unitId = GeneratedColumn<String>(
      'unit_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _errorReasonMeta =
      const VerificationMeta('errorReason');
  @override
  late final GeneratedColumn<String> errorReason = GeneratedColumn<String>(
      'error_reason', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _addedTimeMeta =
      const VerificationMeta('addedTime');
  @override
  late final GeneratedColumn<DateTime> addedTime = GeneratedColumn<DateTime>(
      'added_time', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _isResolvedMeta =
      const VerificationMeta('isResolved');
  @override
  late final GeneratedColumn<bool> isResolved = GeneratedColumn<bool>(
      'is_resolved', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_resolved" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _resolvedTimeMeta =
      const VerificationMeta('resolvedTime');
  @override
  late final GeneratedColumn<DateTime> resolvedTime = GeneratedColumn<DateTime>(
      'resolved_time', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        itemId,
        itemType,
        unitId,
        errorReason,
        addedTime,
        isResolved,
        resolvedTime
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'wrong_items';
  @override
  VerificationContext validateIntegrity(Insertable<WrongItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('item_id')) {
      context.handle(_itemIdMeta,
          itemId.isAcceptableOrUnknown(data['item_id']!, _itemIdMeta));
    } else if (isInserting) {
      context.missing(_itemIdMeta);
    }
    if (data.containsKey('item_type')) {
      context.handle(_itemTypeMeta,
          itemType.isAcceptableOrUnknown(data['item_type']!, _itemTypeMeta));
    } else if (isInserting) {
      context.missing(_itemTypeMeta);
    }
    if (data.containsKey('unit_id')) {
      context.handle(_unitIdMeta,
          unitId.isAcceptableOrUnknown(data['unit_id']!, _unitIdMeta));
    } else if (isInserting) {
      context.missing(_unitIdMeta);
    }
    if (data.containsKey('error_reason')) {
      context.handle(
          _errorReasonMeta,
          errorReason.isAcceptableOrUnknown(
              data['error_reason']!, _errorReasonMeta));
    }
    if (data.containsKey('added_time')) {
      context.handle(_addedTimeMeta,
          addedTime.isAcceptableOrUnknown(data['added_time']!, _addedTimeMeta));
    } else if (isInserting) {
      context.missing(_addedTimeMeta);
    }
    if (data.containsKey('is_resolved')) {
      context.handle(
          _isResolvedMeta,
          isResolved.isAcceptableOrUnknown(
              data['is_resolved']!, _isResolvedMeta));
    }
    if (data.containsKey('resolved_time')) {
      context.handle(
          _resolvedTimeMeta,
          resolvedTime.isAcceptableOrUnknown(
              data['resolved_time']!, _resolvedTimeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WrongItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WrongItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      itemId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}item_id'])!,
      itemType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}item_type'])!,
      unitId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}unit_id'])!,
      errorReason: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}error_reason']),
      addedTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}added_time'])!,
      isResolved: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_resolved'])!,
      resolvedTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}resolved_time']),
    );
  }

  @override
  $WrongItemsTable createAlias(String alias) {
    return $WrongItemsTable(attachedDatabase, alias);
  }
}

class WrongItem extends DataClass implements Insertable<WrongItem> {
  final String id;
  final String itemId;
  final String itemType;
  final String unitId;
  final String? errorReason;
  final DateTime addedTime;
  final bool isResolved;
  final DateTime? resolvedTime;
  const WrongItem(
      {required this.id,
      required this.itemId,
      required this.itemType,
      required this.unitId,
      this.errorReason,
      required this.addedTime,
      required this.isResolved,
      this.resolvedTime});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['item_id'] = Variable<String>(itemId);
    map['item_type'] = Variable<String>(itemType);
    map['unit_id'] = Variable<String>(unitId);
    if (!nullToAbsent || errorReason != null) {
      map['error_reason'] = Variable<String>(errorReason);
    }
    map['added_time'] = Variable<DateTime>(addedTime);
    map['is_resolved'] = Variable<bool>(isResolved);
    if (!nullToAbsent || resolvedTime != null) {
      map['resolved_time'] = Variable<DateTime>(resolvedTime);
    }
    return map;
  }

  WrongItemsCompanion toCompanion(bool nullToAbsent) {
    return WrongItemsCompanion(
      id: Value(id),
      itemId: Value(itemId),
      itemType: Value(itemType),
      unitId: Value(unitId),
      errorReason: errorReason == null && nullToAbsent
          ? const Value.absent()
          : Value(errorReason),
      addedTime: Value(addedTime),
      isResolved: Value(isResolved),
      resolvedTime: resolvedTime == null && nullToAbsent
          ? const Value.absent()
          : Value(resolvedTime),
    );
  }

  factory WrongItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WrongItem(
      id: serializer.fromJson<String>(json['id']),
      itemId: serializer.fromJson<String>(json['itemId']),
      itemType: serializer.fromJson<String>(json['itemType']),
      unitId: serializer.fromJson<String>(json['unitId']),
      errorReason: serializer.fromJson<String?>(json['errorReason']),
      addedTime: serializer.fromJson<DateTime>(json['addedTime']),
      isResolved: serializer.fromJson<bool>(json['isResolved']),
      resolvedTime: serializer.fromJson<DateTime?>(json['resolvedTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'itemId': serializer.toJson<String>(itemId),
      'itemType': serializer.toJson<String>(itemType),
      'unitId': serializer.toJson<String>(unitId),
      'errorReason': serializer.toJson<String?>(errorReason),
      'addedTime': serializer.toJson<DateTime>(addedTime),
      'isResolved': serializer.toJson<bool>(isResolved),
      'resolvedTime': serializer.toJson<DateTime?>(resolvedTime),
    };
  }

  WrongItem copyWith(
          {String? id,
          String? itemId,
          String? itemType,
          String? unitId,
          Value<String?> errorReason = const Value.absent(),
          DateTime? addedTime,
          bool? isResolved,
          Value<DateTime?> resolvedTime = const Value.absent()}) =>
      WrongItem(
        id: id ?? this.id,
        itemId: itemId ?? this.itemId,
        itemType: itemType ?? this.itemType,
        unitId: unitId ?? this.unitId,
        errorReason: errorReason.present ? errorReason.value : this.errorReason,
        addedTime: addedTime ?? this.addedTime,
        isResolved: isResolved ?? this.isResolved,
        resolvedTime:
            resolvedTime.present ? resolvedTime.value : this.resolvedTime,
      );
  WrongItem copyWithCompanion(WrongItemsCompanion data) {
    return WrongItem(
      id: data.id.present ? data.id.value : this.id,
      itemId: data.itemId.present ? data.itemId.value : this.itemId,
      itemType: data.itemType.present ? data.itemType.value : this.itemType,
      unitId: data.unitId.present ? data.unitId.value : this.unitId,
      errorReason:
          data.errorReason.present ? data.errorReason.value : this.errorReason,
      addedTime: data.addedTime.present ? data.addedTime.value : this.addedTime,
      isResolved:
          data.isResolved.present ? data.isResolved.value : this.isResolved,
      resolvedTime: data.resolvedTime.present
          ? data.resolvedTime.value
          : this.resolvedTime,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WrongItem(')
          ..write('id: $id, ')
          ..write('itemId: $itemId, ')
          ..write('itemType: $itemType, ')
          ..write('unitId: $unitId, ')
          ..write('errorReason: $errorReason, ')
          ..write('addedTime: $addedTime, ')
          ..write('isResolved: $isResolved, ')
          ..write('resolvedTime: $resolvedTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, itemId, itemType, unitId, errorReason,
      addedTime, isResolved, resolvedTime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WrongItem &&
          other.id == this.id &&
          other.itemId == this.itemId &&
          other.itemType == this.itemType &&
          other.unitId == this.unitId &&
          other.errorReason == this.errorReason &&
          other.addedTime == this.addedTime &&
          other.isResolved == this.isResolved &&
          other.resolvedTime == this.resolvedTime);
}

class WrongItemsCompanion extends UpdateCompanion<WrongItem> {
  final Value<String> id;
  final Value<String> itemId;
  final Value<String> itemType;
  final Value<String> unitId;
  final Value<String?> errorReason;
  final Value<DateTime> addedTime;
  final Value<bool> isResolved;
  final Value<DateTime?> resolvedTime;
  final Value<int> rowid;
  const WrongItemsCompanion({
    this.id = const Value.absent(),
    this.itemId = const Value.absent(),
    this.itemType = const Value.absent(),
    this.unitId = const Value.absent(),
    this.errorReason = const Value.absent(),
    this.addedTime = const Value.absent(),
    this.isResolved = const Value.absent(),
    this.resolvedTime = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WrongItemsCompanion.insert({
    required String id,
    required String itemId,
    required String itemType,
    required String unitId,
    this.errorReason = const Value.absent(),
    required DateTime addedTime,
    this.isResolved = const Value.absent(),
    this.resolvedTime = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        itemId = Value(itemId),
        itemType = Value(itemType),
        unitId = Value(unitId),
        addedTime = Value(addedTime);
  static Insertable<WrongItem> custom({
    Expression<String>? id,
    Expression<String>? itemId,
    Expression<String>? itemType,
    Expression<String>? unitId,
    Expression<String>? errorReason,
    Expression<DateTime>? addedTime,
    Expression<bool>? isResolved,
    Expression<DateTime>? resolvedTime,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (itemId != null) 'item_id': itemId,
      if (itemType != null) 'item_type': itemType,
      if (unitId != null) 'unit_id': unitId,
      if (errorReason != null) 'error_reason': errorReason,
      if (addedTime != null) 'added_time': addedTime,
      if (isResolved != null) 'is_resolved': isResolved,
      if (resolvedTime != null) 'resolved_time': resolvedTime,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WrongItemsCompanion copyWith(
      {Value<String>? id,
      Value<String>? itemId,
      Value<String>? itemType,
      Value<String>? unitId,
      Value<String?>? errorReason,
      Value<DateTime>? addedTime,
      Value<bool>? isResolved,
      Value<DateTime?>? resolvedTime,
      Value<int>? rowid}) {
    return WrongItemsCompanion(
      id: id ?? this.id,
      itemId: itemId ?? this.itemId,
      itemType: itemType ?? this.itemType,
      unitId: unitId ?? this.unitId,
      errorReason: errorReason ?? this.errorReason,
      addedTime: addedTime ?? this.addedTime,
      isResolved: isResolved ?? this.isResolved,
      resolvedTime: resolvedTime ?? this.resolvedTime,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (itemId.present) {
      map['item_id'] = Variable<String>(itemId.value);
    }
    if (itemType.present) {
      map['item_type'] = Variable<String>(itemType.value);
    }
    if (unitId.present) {
      map['unit_id'] = Variable<String>(unitId.value);
    }
    if (errorReason.present) {
      map['error_reason'] = Variable<String>(errorReason.value);
    }
    if (addedTime.present) {
      map['added_time'] = Variable<DateTime>(addedTime.value);
    }
    if (isResolved.present) {
      map['is_resolved'] = Variable<bool>(isResolved.value);
    }
    if (resolvedTime.present) {
      map['resolved_time'] = Variable<DateTime>(resolvedTime.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WrongItemsCompanion(')
          ..write('id: $id, ')
          ..write('itemId: $itemId, ')
          ..write('itemType: $itemType, ')
          ..write('unitId: $unitId, ')
          ..write('errorReason: $errorReason, ')
          ..write('addedTime: $addedTime, ')
          ..write('isResolved: $isResolved, ')
          ..write('resolvedTime: $resolvedTime, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DailyStatsTable extends DailyStats
    with TableInfo<$DailyStatsTable, DailyStat> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DailyStatsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<String> date = GeneratedColumn<String>(
      'date', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _subjectMeta =
      const VerificationMeta('subject');
  @override
  late final GeneratedColumn<String> subject = GeneratedColumn<String>(
      'subject', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _studyMinutesMeta =
      const VerificationMeta('studyMinutes');
  @override
  late final GeneratedColumn<int> studyMinutes = GeneratedColumn<int>(
      'study_minutes', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _wordsLearnedMeta =
      const VerificationMeta('wordsLearned');
  @override
  late final GeneratedColumn<int> wordsLearned = GeneratedColumn<int>(
      'words_learned', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _wordsMasteredMeta =
      const VerificationMeta('wordsMastered');
  @override
  late final GeneratedColumn<int> wordsMastered = GeneratedColumn<int>(
      'words_mastered', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _questionsAnsweredMeta =
      const VerificationMeta('questionsAnswered');
  @override
  late final GeneratedColumn<int> questionsAnswered = GeneratedColumn<int>(
      'questions_answered', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _correctAnswersMeta =
      const VerificationMeta('correctAnswers');
  @override
  late final GeneratedColumn<int> correctAnswers = GeneratedColumn<int>(
      'correct_answers', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  @override
  List<GeneratedColumn> get $columns => [
        date,
        subject,
        studyMinutes,
        wordsLearned,
        wordsMastered,
        questionsAnswered,
        correctAnswers
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'daily_stats';
  @override
  VerificationContext validateIntegrity(Insertable<DailyStat> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('subject')) {
      context.handle(_subjectMeta,
          subject.isAcceptableOrUnknown(data['subject']!, _subjectMeta));
    } else if (isInserting) {
      context.missing(_subjectMeta);
    }
    if (data.containsKey('study_minutes')) {
      context.handle(
          _studyMinutesMeta,
          studyMinutes.isAcceptableOrUnknown(
              data['study_minutes']!, _studyMinutesMeta));
    }
    if (data.containsKey('words_learned')) {
      context.handle(
          _wordsLearnedMeta,
          wordsLearned.isAcceptableOrUnknown(
              data['words_learned']!, _wordsLearnedMeta));
    }
    if (data.containsKey('words_mastered')) {
      context.handle(
          _wordsMasteredMeta,
          wordsMastered.isAcceptableOrUnknown(
              data['words_mastered']!, _wordsMasteredMeta));
    }
    if (data.containsKey('questions_answered')) {
      context.handle(
          _questionsAnsweredMeta,
          questionsAnswered.isAcceptableOrUnknown(
              data['questions_answered']!, _questionsAnsweredMeta));
    }
    if (data.containsKey('correct_answers')) {
      context.handle(
          _correctAnswersMeta,
          correctAnswers.isAcceptableOrUnknown(
              data['correct_answers']!, _correctAnswersMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {date, subject};
  @override
  DailyStat map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DailyStat(
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}date'])!,
      subject: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}subject'])!,
      studyMinutes: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}study_minutes'])!,
      wordsLearned: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}words_learned'])!,
      wordsMastered: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}words_mastered'])!,
      questionsAnswered: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}questions_answered'])!,
      correctAnswers: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}correct_answers'])!,
    );
  }

  @override
  $DailyStatsTable createAlias(String alias) {
    return $DailyStatsTable(attachedDatabase, alias);
  }
}

class DailyStat extends DataClass implements Insertable<DailyStat> {
  final String date;
  final String subject;
  final int studyMinutes;
  final int wordsLearned;
  final int wordsMastered;
  final int questionsAnswered;
  final int correctAnswers;
  const DailyStat(
      {required this.date,
      required this.subject,
      required this.studyMinutes,
      required this.wordsLearned,
      required this.wordsMastered,
      required this.questionsAnswered,
      required this.correctAnswers});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['date'] = Variable<String>(date);
    map['subject'] = Variable<String>(subject);
    map['study_minutes'] = Variable<int>(studyMinutes);
    map['words_learned'] = Variable<int>(wordsLearned);
    map['words_mastered'] = Variable<int>(wordsMastered);
    map['questions_answered'] = Variable<int>(questionsAnswered);
    map['correct_answers'] = Variable<int>(correctAnswers);
    return map;
  }

  DailyStatsCompanion toCompanion(bool nullToAbsent) {
    return DailyStatsCompanion(
      date: Value(date),
      subject: Value(subject),
      studyMinutes: Value(studyMinutes),
      wordsLearned: Value(wordsLearned),
      wordsMastered: Value(wordsMastered),
      questionsAnswered: Value(questionsAnswered),
      correctAnswers: Value(correctAnswers),
    );
  }

  factory DailyStat.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DailyStat(
      date: serializer.fromJson<String>(json['date']),
      subject: serializer.fromJson<String>(json['subject']),
      studyMinutes: serializer.fromJson<int>(json['studyMinutes']),
      wordsLearned: serializer.fromJson<int>(json['wordsLearned']),
      wordsMastered: serializer.fromJson<int>(json['wordsMastered']),
      questionsAnswered: serializer.fromJson<int>(json['questionsAnswered']),
      correctAnswers: serializer.fromJson<int>(json['correctAnswers']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'date': serializer.toJson<String>(date),
      'subject': serializer.toJson<String>(subject),
      'studyMinutes': serializer.toJson<int>(studyMinutes),
      'wordsLearned': serializer.toJson<int>(wordsLearned),
      'wordsMastered': serializer.toJson<int>(wordsMastered),
      'questionsAnswered': serializer.toJson<int>(questionsAnswered),
      'correctAnswers': serializer.toJson<int>(correctAnswers),
    };
  }

  DailyStat copyWith(
          {String? date,
          String? subject,
          int? studyMinutes,
          int? wordsLearned,
          int? wordsMastered,
          int? questionsAnswered,
          int? correctAnswers}) =>
      DailyStat(
        date: date ?? this.date,
        subject: subject ?? this.subject,
        studyMinutes: studyMinutes ?? this.studyMinutes,
        wordsLearned: wordsLearned ?? this.wordsLearned,
        wordsMastered: wordsMastered ?? this.wordsMastered,
        questionsAnswered: questionsAnswered ?? this.questionsAnswered,
        correctAnswers: correctAnswers ?? this.correctAnswers,
      );
  DailyStat copyWithCompanion(DailyStatsCompanion data) {
    return DailyStat(
      date: data.date.present ? data.date.value : this.date,
      subject: data.subject.present ? data.subject.value : this.subject,
      studyMinutes: data.studyMinutes.present
          ? data.studyMinutes.value
          : this.studyMinutes,
      wordsLearned: data.wordsLearned.present
          ? data.wordsLearned.value
          : this.wordsLearned,
      wordsMastered: data.wordsMastered.present
          ? data.wordsMastered.value
          : this.wordsMastered,
      questionsAnswered: data.questionsAnswered.present
          ? data.questionsAnswered.value
          : this.questionsAnswered,
      correctAnswers: data.correctAnswers.present
          ? data.correctAnswers.value
          : this.correctAnswers,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DailyStat(')
          ..write('date: $date, ')
          ..write('subject: $subject, ')
          ..write('studyMinutes: $studyMinutes, ')
          ..write('wordsLearned: $wordsLearned, ')
          ..write('wordsMastered: $wordsMastered, ')
          ..write('questionsAnswered: $questionsAnswered, ')
          ..write('correctAnswers: $correctAnswers')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(date, subject, studyMinutes, wordsLearned,
      wordsMastered, questionsAnswered, correctAnswers);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DailyStat &&
          other.date == this.date &&
          other.subject == this.subject &&
          other.studyMinutes == this.studyMinutes &&
          other.wordsLearned == this.wordsLearned &&
          other.wordsMastered == this.wordsMastered &&
          other.questionsAnswered == this.questionsAnswered &&
          other.correctAnswers == this.correctAnswers);
}

class DailyStatsCompanion extends UpdateCompanion<DailyStat> {
  final Value<String> date;
  final Value<String> subject;
  final Value<int> studyMinutes;
  final Value<int> wordsLearned;
  final Value<int> wordsMastered;
  final Value<int> questionsAnswered;
  final Value<int> correctAnswers;
  final Value<int> rowid;
  const DailyStatsCompanion({
    this.date = const Value.absent(),
    this.subject = const Value.absent(),
    this.studyMinutes = const Value.absent(),
    this.wordsLearned = const Value.absent(),
    this.wordsMastered = const Value.absent(),
    this.questionsAnswered = const Value.absent(),
    this.correctAnswers = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DailyStatsCompanion.insert({
    required String date,
    required String subject,
    this.studyMinutes = const Value.absent(),
    this.wordsLearned = const Value.absent(),
    this.wordsMastered = const Value.absent(),
    this.questionsAnswered = const Value.absent(),
    this.correctAnswers = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : date = Value(date),
        subject = Value(subject);
  static Insertable<DailyStat> custom({
    Expression<String>? date,
    Expression<String>? subject,
    Expression<int>? studyMinutes,
    Expression<int>? wordsLearned,
    Expression<int>? wordsMastered,
    Expression<int>? questionsAnswered,
    Expression<int>? correctAnswers,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (date != null) 'date': date,
      if (subject != null) 'subject': subject,
      if (studyMinutes != null) 'study_minutes': studyMinutes,
      if (wordsLearned != null) 'words_learned': wordsLearned,
      if (wordsMastered != null) 'words_mastered': wordsMastered,
      if (questionsAnswered != null) 'questions_answered': questionsAnswered,
      if (correctAnswers != null) 'correct_answers': correctAnswers,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DailyStatsCompanion copyWith(
      {Value<String>? date,
      Value<String>? subject,
      Value<int>? studyMinutes,
      Value<int>? wordsLearned,
      Value<int>? wordsMastered,
      Value<int>? questionsAnswered,
      Value<int>? correctAnswers,
      Value<int>? rowid}) {
    return DailyStatsCompanion(
      date: date ?? this.date,
      subject: subject ?? this.subject,
      studyMinutes: studyMinutes ?? this.studyMinutes,
      wordsLearned: wordsLearned ?? this.wordsLearned,
      wordsMastered: wordsMastered ?? this.wordsMastered,
      questionsAnswered: questionsAnswered ?? this.questionsAnswered,
      correctAnswers: correctAnswers ?? this.correctAnswers,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (date.present) {
      map['date'] = Variable<String>(date.value);
    }
    if (subject.present) {
      map['subject'] = Variable<String>(subject.value);
    }
    if (studyMinutes.present) {
      map['study_minutes'] = Variable<int>(studyMinutes.value);
    }
    if (wordsLearned.present) {
      map['words_learned'] = Variable<int>(wordsLearned.value);
    }
    if (wordsMastered.present) {
      map['words_mastered'] = Variable<int>(wordsMastered.value);
    }
    if (questionsAnswered.present) {
      map['questions_answered'] = Variable<int>(questionsAnswered.value);
    }
    if (correctAnswers.present) {
      map['correct_answers'] = Variable<int>(correctAnswers.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DailyStatsCompanion(')
          ..write('date: $date, ')
          ..write('subject: $subject, ')
          ..write('studyMinutes: $studyMinutes, ')
          ..write('wordsLearned: $wordsLearned, ')
          ..write('wordsMastered: $wordsMastered, ')
          ..write('questionsAnswered: $questionsAnswered, ')
          ..write('correctAnswers: $correctAnswers, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $GrammarQuestionsTable extends GrammarQuestions
    with TableInfo<$GrammarQuestionsTable, GrammarQuestionData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GrammarQuestionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _topicMeta = const VerificationMeta('topic');
  @override
  late final GeneratedColumn<String> topic = GeneratedColumn<String>(
      'topic', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _subtopicMeta =
      const VerificationMeta('subtopic');
  @override
  late final GeneratedColumn<String> subtopic = GeneratedColumn<String>(
      'subtopic', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _questionMeta =
      const VerificationMeta('question');
  @override
  late final GeneratedColumn<String> question = GeneratedColumn<String>(
      'question', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _optionsMeta =
      const VerificationMeta('options');
  @override
  late final GeneratedColumn<String> options = GeneratedColumn<String>(
      'options', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _answerMeta = const VerificationMeta('answer');
  @override
  late final GeneratedColumn<String> answer = GeneratedColumn<String>(
      'answer', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _explanationMeta =
      const VerificationMeta('explanation');
  @override
  late final GeneratedColumn<String> explanation = GeneratedColumn<String>(
      'explanation', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _difficultyMeta =
      const VerificationMeta('difficulty');
  @override
  late final GeneratedColumn<int> difficulty = GeneratedColumn<int>(
      'difficulty', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<String> source = GeneratedColumn<String>(
      'source', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        type,
        topic,
        subtopic,
        question,
        options,
        answer,
        explanation,
        difficulty,
        source
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'grammar_questions';
  @override
  VerificationContext validateIntegrity(
      Insertable<GrammarQuestionData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('topic')) {
      context.handle(
          _topicMeta, topic.isAcceptableOrUnknown(data['topic']!, _topicMeta));
    } else if (isInserting) {
      context.missing(_topicMeta);
    }
    if (data.containsKey('subtopic')) {
      context.handle(_subtopicMeta,
          subtopic.isAcceptableOrUnknown(data['subtopic']!, _subtopicMeta));
    }
    if (data.containsKey('question')) {
      context.handle(_questionMeta,
          question.isAcceptableOrUnknown(data['question']!, _questionMeta));
    } else if (isInserting) {
      context.missing(_questionMeta);
    }
    if (data.containsKey('options')) {
      context.handle(_optionsMeta,
          options.isAcceptableOrUnknown(data['options']!, _optionsMeta));
    } else if (isInserting) {
      context.missing(_optionsMeta);
    }
    if (data.containsKey('answer')) {
      context.handle(_answerMeta,
          answer.isAcceptableOrUnknown(data['answer']!, _answerMeta));
    } else if (isInserting) {
      context.missing(_answerMeta);
    }
    if (data.containsKey('explanation')) {
      context.handle(
          _explanationMeta,
          explanation.isAcceptableOrUnknown(
              data['explanation']!, _explanationMeta));
    }
    if (data.containsKey('difficulty')) {
      context.handle(
          _difficultyMeta,
          difficulty.isAcceptableOrUnknown(
              data['difficulty']!, _difficultyMeta));
    }
    if (data.containsKey('source')) {
      context.handle(_sourceMeta,
          source.isAcceptableOrUnknown(data['source']!, _sourceMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GrammarQuestionData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GrammarQuestionData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      topic: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}topic'])!,
      subtopic: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}subtopic']),
      question: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}question'])!,
      options: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}options'])!,
      answer: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}answer'])!,
      explanation: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}explanation']),
      difficulty: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}difficulty'])!,
      source: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}source']),
    );
  }

  @override
  $GrammarQuestionsTable createAlias(String alias) {
    return $GrammarQuestionsTable(attachedDatabase, alias);
  }
}

class GrammarQuestionData extends DataClass
    implements Insertable<GrammarQuestionData> {
  final String id;
  final String type;
  final String topic;
  final String? subtopic;
  final String question;
  final String options;
  final String answer;
  final String? explanation;
  final int difficulty;
  final String? source;
  const GrammarQuestionData(
      {required this.id,
      required this.type,
      required this.topic,
      this.subtopic,
      required this.question,
      required this.options,
      required this.answer,
      this.explanation,
      required this.difficulty,
      this.source});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['type'] = Variable<String>(type);
    map['topic'] = Variable<String>(topic);
    if (!nullToAbsent || subtopic != null) {
      map['subtopic'] = Variable<String>(subtopic);
    }
    map['question'] = Variable<String>(question);
    map['options'] = Variable<String>(options);
    map['answer'] = Variable<String>(answer);
    if (!nullToAbsent || explanation != null) {
      map['explanation'] = Variable<String>(explanation);
    }
    map['difficulty'] = Variable<int>(difficulty);
    if (!nullToAbsent || source != null) {
      map['source'] = Variable<String>(source);
    }
    return map;
  }

  GrammarQuestionsCompanion toCompanion(bool nullToAbsent) {
    return GrammarQuestionsCompanion(
      id: Value(id),
      type: Value(type),
      topic: Value(topic),
      subtopic: subtopic == null && nullToAbsent
          ? const Value.absent()
          : Value(subtopic),
      question: Value(question),
      options: Value(options),
      answer: Value(answer),
      explanation: explanation == null && nullToAbsent
          ? const Value.absent()
          : Value(explanation),
      difficulty: Value(difficulty),
      source:
          source == null && nullToAbsent ? const Value.absent() : Value(source),
    );
  }

  factory GrammarQuestionData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GrammarQuestionData(
      id: serializer.fromJson<String>(json['id']),
      type: serializer.fromJson<String>(json['type']),
      topic: serializer.fromJson<String>(json['topic']),
      subtopic: serializer.fromJson<String?>(json['subtopic']),
      question: serializer.fromJson<String>(json['question']),
      options: serializer.fromJson<String>(json['options']),
      answer: serializer.fromJson<String>(json['answer']),
      explanation: serializer.fromJson<String?>(json['explanation']),
      difficulty: serializer.fromJson<int>(json['difficulty']),
      source: serializer.fromJson<String?>(json['source']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'type': serializer.toJson<String>(type),
      'topic': serializer.toJson<String>(topic),
      'subtopic': serializer.toJson<String?>(subtopic),
      'question': serializer.toJson<String>(question),
      'options': serializer.toJson<String>(options),
      'answer': serializer.toJson<String>(answer),
      'explanation': serializer.toJson<String?>(explanation),
      'difficulty': serializer.toJson<int>(difficulty),
      'source': serializer.toJson<String?>(source),
    };
  }

  GrammarQuestionData copyWith(
          {String? id,
          String? type,
          String? topic,
          Value<String?> subtopic = const Value.absent(),
          String? question,
          String? options,
          String? answer,
          Value<String?> explanation = const Value.absent(),
          int? difficulty,
          Value<String?> source = const Value.absent()}) =>
      GrammarQuestionData(
        id: id ?? this.id,
        type: type ?? this.type,
        topic: topic ?? this.topic,
        subtopic: subtopic.present ? subtopic.value : this.subtopic,
        question: question ?? this.question,
        options: options ?? this.options,
        answer: answer ?? this.answer,
        explanation: explanation.present ? explanation.value : this.explanation,
        difficulty: difficulty ?? this.difficulty,
        source: source.present ? source.value : this.source,
      );
  GrammarQuestionData copyWithCompanion(GrammarQuestionsCompanion data) {
    return GrammarQuestionData(
      id: data.id.present ? data.id.value : this.id,
      type: data.type.present ? data.type.value : this.type,
      topic: data.topic.present ? data.topic.value : this.topic,
      subtopic: data.subtopic.present ? data.subtopic.value : this.subtopic,
      question: data.question.present ? data.question.value : this.question,
      options: data.options.present ? data.options.value : this.options,
      answer: data.answer.present ? data.answer.value : this.answer,
      explanation:
          data.explanation.present ? data.explanation.value : this.explanation,
      difficulty:
          data.difficulty.present ? data.difficulty.value : this.difficulty,
      source: data.source.present ? data.source.value : this.source,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GrammarQuestionData(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('topic: $topic, ')
          ..write('subtopic: $subtopic, ')
          ..write('question: $question, ')
          ..write('options: $options, ')
          ..write('answer: $answer, ')
          ..write('explanation: $explanation, ')
          ..write('difficulty: $difficulty, ')
          ..write('source: $source')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, type, topic, subtopic, question, options,
      answer, explanation, difficulty, source);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GrammarQuestionData &&
          other.id == this.id &&
          other.type == this.type &&
          other.topic == this.topic &&
          other.subtopic == this.subtopic &&
          other.question == this.question &&
          other.options == this.options &&
          other.answer == this.answer &&
          other.explanation == this.explanation &&
          other.difficulty == this.difficulty &&
          other.source == this.source);
}

class GrammarQuestionsCompanion extends UpdateCompanion<GrammarQuestionData> {
  final Value<String> id;
  final Value<String> type;
  final Value<String> topic;
  final Value<String?> subtopic;
  final Value<String> question;
  final Value<String> options;
  final Value<String> answer;
  final Value<String?> explanation;
  final Value<int> difficulty;
  final Value<String?> source;
  final Value<int> rowid;
  const GrammarQuestionsCompanion({
    this.id = const Value.absent(),
    this.type = const Value.absent(),
    this.topic = const Value.absent(),
    this.subtopic = const Value.absent(),
    this.question = const Value.absent(),
    this.options = const Value.absent(),
    this.answer = const Value.absent(),
    this.explanation = const Value.absent(),
    this.difficulty = const Value.absent(),
    this.source = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  GrammarQuestionsCompanion.insert({
    required String id,
    required String type,
    required String topic,
    this.subtopic = const Value.absent(),
    required String question,
    required String options,
    required String answer,
    this.explanation = const Value.absent(),
    this.difficulty = const Value.absent(),
    this.source = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        type = Value(type),
        topic = Value(topic),
        question = Value(question),
        options = Value(options),
        answer = Value(answer);
  static Insertable<GrammarQuestionData> custom({
    Expression<String>? id,
    Expression<String>? type,
    Expression<String>? topic,
    Expression<String>? subtopic,
    Expression<String>? question,
    Expression<String>? options,
    Expression<String>? answer,
    Expression<String>? explanation,
    Expression<int>? difficulty,
    Expression<String>? source,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (type != null) 'type': type,
      if (topic != null) 'topic': topic,
      if (subtopic != null) 'subtopic': subtopic,
      if (question != null) 'question': question,
      if (options != null) 'options': options,
      if (answer != null) 'answer': answer,
      if (explanation != null) 'explanation': explanation,
      if (difficulty != null) 'difficulty': difficulty,
      if (source != null) 'source': source,
      if (rowid != null) 'rowid': rowid,
    });
  }

  GrammarQuestionsCompanion copyWith(
      {Value<String>? id,
      Value<String>? type,
      Value<String>? topic,
      Value<String?>? subtopic,
      Value<String>? question,
      Value<String>? options,
      Value<String>? answer,
      Value<String?>? explanation,
      Value<int>? difficulty,
      Value<String?>? source,
      Value<int>? rowid}) {
    return GrammarQuestionsCompanion(
      id: id ?? this.id,
      type: type ?? this.type,
      topic: topic ?? this.topic,
      subtopic: subtopic ?? this.subtopic,
      question: question ?? this.question,
      options: options ?? this.options,
      answer: answer ?? this.answer,
      explanation: explanation ?? this.explanation,
      difficulty: difficulty ?? this.difficulty,
      source: source ?? this.source,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (topic.present) {
      map['topic'] = Variable<String>(topic.value);
    }
    if (subtopic.present) {
      map['subtopic'] = Variable<String>(subtopic.value);
    }
    if (question.present) {
      map['question'] = Variable<String>(question.value);
    }
    if (options.present) {
      map['options'] = Variable<String>(options.value);
    }
    if (answer.present) {
      map['answer'] = Variable<String>(answer.value);
    }
    if (explanation.present) {
      map['explanation'] = Variable<String>(explanation.value);
    }
    if (difficulty.present) {
      map['difficulty'] = Variable<int>(difficulty.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GrammarQuestionsCompanion(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('topic: $topic, ')
          ..write('subtopic: $subtopic, ')
          ..write('question: $question, ')
          ..write('options: $options, ')
          ..write('answer: $answer, ')
          ..write('explanation: $explanation, ')
          ..write('difficulty: $difficulty, ')
          ..write('source: $source, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $WordsTable words = $WordsTable(this);
  late final $UnitsTable units = $UnitsTable(this);
  late final $PracticeRecordsTable practiceRecords =
      $PracticeRecordsTable(this);
  late final $MasteryStatesTable masteryStates = $MasteryStatesTable(this);
  late final $WrongItemsTable wrongItems = $WrongItemsTable(this);
  late final $DailyStatsTable dailyStats = $DailyStatsTable(this);
  late final $GrammarQuestionsTable grammarQuestions =
      $GrammarQuestionsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        words,
        units,
        practiceRecords,
        masteryStates,
        wrongItems,
        dailyStats,
        grammarQuestions
      ];
}

typedef $$WordsTableCreateCompanionBuilder = WordsCompanion Function({
  required String id,
  required String word,
  Value<String> phonetic,
  required String meaningsJson,
  Value<String?> example,
  Value<String?> exampleCn,
  Value<String> derivativesJson,
  required String unitId,
  Value<String> frequency,
  Value<int> rowid,
});
typedef $$WordsTableUpdateCompanionBuilder = WordsCompanion Function({
  Value<String> id,
  Value<String> word,
  Value<String> phonetic,
  Value<String> meaningsJson,
  Value<String?> example,
  Value<String?> exampleCn,
  Value<String> derivativesJson,
  Value<String> unitId,
  Value<String> frequency,
  Value<int> rowid,
});

class $$WordsTableFilterComposer extends Composer<_$AppDatabase, $WordsTable> {
  $$WordsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get word => $composableBuilder(
      column: $table.word, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get phonetic => $composableBuilder(
      column: $table.phonetic, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get meaningsJson => $composableBuilder(
      column: $table.meaningsJson, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get example => $composableBuilder(
      column: $table.example, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get exampleCn => $composableBuilder(
      column: $table.exampleCn, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get derivativesJson => $composableBuilder(
      column: $table.derivativesJson,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get unitId => $composableBuilder(
      column: $table.unitId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get frequency => $composableBuilder(
      column: $table.frequency, builder: (column) => ColumnFilters(column));
}

class $$WordsTableOrderingComposer
    extends Composer<_$AppDatabase, $WordsTable> {
  $$WordsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get word => $composableBuilder(
      column: $table.word, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get phonetic => $composableBuilder(
      column: $table.phonetic, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get meaningsJson => $composableBuilder(
      column: $table.meaningsJson,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get example => $composableBuilder(
      column: $table.example, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get exampleCn => $composableBuilder(
      column: $table.exampleCn, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get derivativesJson => $composableBuilder(
      column: $table.derivativesJson,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get unitId => $composableBuilder(
      column: $table.unitId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get frequency => $composableBuilder(
      column: $table.frequency, builder: (column) => ColumnOrderings(column));
}

class $$WordsTableAnnotationComposer
    extends Composer<_$AppDatabase, $WordsTable> {
  $$WordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get word =>
      $composableBuilder(column: $table.word, builder: (column) => column);

  GeneratedColumn<String> get phonetic =>
      $composableBuilder(column: $table.phonetic, builder: (column) => column);

  GeneratedColumn<String> get meaningsJson => $composableBuilder(
      column: $table.meaningsJson, builder: (column) => column);

  GeneratedColumn<String> get example =>
      $composableBuilder(column: $table.example, builder: (column) => column);

  GeneratedColumn<String> get exampleCn =>
      $composableBuilder(column: $table.exampleCn, builder: (column) => column);

  GeneratedColumn<String> get derivativesJson => $composableBuilder(
      column: $table.derivativesJson, builder: (column) => column);

  GeneratedColumn<String> get unitId =>
      $composableBuilder(column: $table.unitId, builder: (column) => column);

  GeneratedColumn<String> get frequency =>
      $composableBuilder(column: $table.frequency, builder: (column) => column);
}

class $$WordsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $WordsTable,
    Word,
    $$WordsTableFilterComposer,
    $$WordsTableOrderingComposer,
    $$WordsTableAnnotationComposer,
    $$WordsTableCreateCompanionBuilder,
    $$WordsTableUpdateCompanionBuilder,
    (Word, BaseReferences<_$AppDatabase, $WordsTable, Word>),
    Word,
    PrefetchHooks Function()> {
  $$WordsTableTableManager(_$AppDatabase db, $WordsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WordsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WordsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WordsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> word = const Value.absent(),
            Value<String> phonetic = const Value.absent(),
            Value<String> meaningsJson = const Value.absent(),
            Value<String?> example = const Value.absent(),
            Value<String?> exampleCn = const Value.absent(),
            Value<String> derivativesJson = const Value.absent(),
            Value<String> unitId = const Value.absent(),
            Value<String> frequency = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              WordsCompanion(
            id: id,
            word: word,
            phonetic: phonetic,
            meaningsJson: meaningsJson,
            example: example,
            exampleCn: exampleCn,
            derivativesJson: derivativesJson,
            unitId: unitId,
            frequency: frequency,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String word,
            Value<String> phonetic = const Value.absent(),
            required String meaningsJson,
            Value<String?> example = const Value.absent(),
            Value<String?> exampleCn = const Value.absent(),
            Value<String> derivativesJson = const Value.absent(),
            required String unitId,
            Value<String> frequency = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              WordsCompanion.insert(
            id: id,
            word: word,
            phonetic: phonetic,
            meaningsJson: meaningsJson,
            example: example,
            exampleCn: exampleCn,
            derivativesJson: derivativesJson,
            unitId: unitId,
            frequency: frequency,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$WordsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $WordsTable,
    Word,
    $$WordsTableFilterComposer,
    $$WordsTableOrderingComposer,
    $$WordsTableAnnotationComposer,
    $$WordsTableCreateCompanionBuilder,
    $$WordsTableUpdateCompanionBuilder,
    (Word, BaseReferences<_$AppDatabase, $WordsTable, Word>),
    Word,
    PrefetchHooks Function()>;
typedef $$UnitsTableCreateCompanionBuilder = UnitsCompanion Function({
  required String id,
  required String subject,
  required String grade,
  required String textbookType,
  required int bookNumber,
  required int unitNumber,
  required String title,
  Value<String?> description,
  Value<int> rowid,
});
typedef $$UnitsTableUpdateCompanionBuilder = UnitsCompanion Function({
  Value<String> id,
  Value<String> subject,
  Value<String> grade,
  Value<String> textbookType,
  Value<int> bookNumber,
  Value<int> unitNumber,
  Value<String> title,
  Value<String?> description,
  Value<int> rowid,
});

class $$UnitsTableFilterComposer extends Composer<_$AppDatabase, $UnitsTable> {
  $$UnitsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get subject => $composableBuilder(
      column: $table.subject, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get grade => $composableBuilder(
      column: $table.grade, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get textbookType => $composableBuilder(
      column: $table.textbookType, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get bookNumber => $composableBuilder(
      column: $table.bookNumber, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get unitNumber => $composableBuilder(
      column: $table.unitNumber, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));
}

class $$UnitsTableOrderingComposer
    extends Composer<_$AppDatabase, $UnitsTable> {
  $$UnitsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get subject => $composableBuilder(
      column: $table.subject, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get grade => $composableBuilder(
      column: $table.grade, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get textbookType => $composableBuilder(
      column: $table.textbookType,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get bookNumber => $composableBuilder(
      column: $table.bookNumber, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get unitNumber => $composableBuilder(
      column: $table.unitNumber, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));
}

class $$UnitsTableAnnotationComposer
    extends Composer<_$AppDatabase, $UnitsTable> {
  $$UnitsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get subject =>
      $composableBuilder(column: $table.subject, builder: (column) => column);

  GeneratedColumn<String> get grade =>
      $composableBuilder(column: $table.grade, builder: (column) => column);

  GeneratedColumn<String> get textbookType => $composableBuilder(
      column: $table.textbookType, builder: (column) => column);

  GeneratedColumn<int> get bookNumber => $composableBuilder(
      column: $table.bookNumber, builder: (column) => column);

  GeneratedColumn<int> get unitNumber => $composableBuilder(
      column: $table.unitNumber, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);
}

class $$UnitsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $UnitsTable,
    Unit,
    $$UnitsTableFilterComposer,
    $$UnitsTableOrderingComposer,
    $$UnitsTableAnnotationComposer,
    $$UnitsTableCreateCompanionBuilder,
    $$UnitsTableUpdateCompanionBuilder,
    (Unit, BaseReferences<_$AppDatabase, $UnitsTable, Unit>),
    Unit,
    PrefetchHooks Function()> {
  $$UnitsTableTableManager(_$AppDatabase db, $UnitsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UnitsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UnitsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UnitsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> subject = const Value.absent(),
            Value<String> grade = const Value.absent(),
            Value<String> textbookType = const Value.absent(),
            Value<int> bookNumber = const Value.absent(),
            Value<int> unitNumber = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UnitsCompanion(
            id: id,
            subject: subject,
            grade: grade,
            textbookType: textbookType,
            bookNumber: bookNumber,
            unitNumber: unitNumber,
            title: title,
            description: description,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String subject,
            required String grade,
            required String textbookType,
            required int bookNumber,
            required int unitNumber,
            required String title,
            Value<String?> description = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UnitsCompanion.insert(
            id: id,
            subject: subject,
            grade: grade,
            textbookType: textbookType,
            bookNumber: bookNumber,
            unitNumber: unitNumber,
            title: title,
            description: description,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$UnitsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $UnitsTable,
    Unit,
    $$UnitsTableFilterComposer,
    $$UnitsTableOrderingComposer,
    $$UnitsTableAnnotationComposer,
    $$UnitsTableCreateCompanionBuilder,
    $$UnitsTableUpdateCompanionBuilder,
    (Unit, BaseReferences<_$AppDatabase, $UnitsTable, Unit>),
    Unit,
    PrefetchHooks Function()>;
typedef $$PracticeRecordsTableCreateCompanionBuilder = PracticeRecordsCompanion
    Function({
  required String id,
  required String itemId,
  required String itemType,
  required bool isCorrect,
  required DateTime practiceTime,
  Value<int> responseTimeMs,
  Value<String?> userAnswer,
  Value<String?> errorReason,
  Value<int> rowid,
});
typedef $$PracticeRecordsTableUpdateCompanionBuilder = PracticeRecordsCompanion
    Function({
  Value<String> id,
  Value<String> itemId,
  Value<String> itemType,
  Value<bool> isCorrect,
  Value<DateTime> practiceTime,
  Value<int> responseTimeMs,
  Value<String?> userAnswer,
  Value<String?> errorReason,
  Value<int> rowid,
});

class $$PracticeRecordsTableFilterComposer
    extends Composer<_$AppDatabase, $PracticeRecordsTable> {
  $$PracticeRecordsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get itemId => $composableBuilder(
      column: $table.itemId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get itemType => $composableBuilder(
      column: $table.itemType, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isCorrect => $composableBuilder(
      column: $table.isCorrect, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get practiceTime => $composableBuilder(
      column: $table.practiceTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get responseTimeMs => $composableBuilder(
      column: $table.responseTimeMs,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get userAnswer => $composableBuilder(
      column: $table.userAnswer, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get errorReason => $composableBuilder(
      column: $table.errorReason, builder: (column) => ColumnFilters(column));
}

class $$PracticeRecordsTableOrderingComposer
    extends Composer<_$AppDatabase, $PracticeRecordsTable> {
  $$PracticeRecordsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get itemId => $composableBuilder(
      column: $table.itemId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get itemType => $composableBuilder(
      column: $table.itemType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isCorrect => $composableBuilder(
      column: $table.isCorrect, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get practiceTime => $composableBuilder(
      column: $table.practiceTime,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get responseTimeMs => $composableBuilder(
      column: $table.responseTimeMs,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get userAnswer => $composableBuilder(
      column: $table.userAnswer, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get errorReason => $composableBuilder(
      column: $table.errorReason, builder: (column) => ColumnOrderings(column));
}

class $$PracticeRecordsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PracticeRecordsTable> {
  $$PracticeRecordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get itemId =>
      $composableBuilder(column: $table.itemId, builder: (column) => column);

  GeneratedColumn<String> get itemType =>
      $composableBuilder(column: $table.itemType, builder: (column) => column);

  GeneratedColumn<bool> get isCorrect =>
      $composableBuilder(column: $table.isCorrect, builder: (column) => column);

  GeneratedColumn<DateTime> get practiceTime => $composableBuilder(
      column: $table.practiceTime, builder: (column) => column);

  GeneratedColumn<int> get responseTimeMs => $composableBuilder(
      column: $table.responseTimeMs, builder: (column) => column);

  GeneratedColumn<String> get userAnswer => $composableBuilder(
      column: $table.userAnswer, builder: (column) => column);

  GeneratedColumn<String> get errorReason => $composableBuilder(
      column: $table.errorReason, builder: (column) => column);
}

class $$PracticeRecordsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PracticeRecordsTable,
    PracticeRecord,
    $$PracticeRecordsTableFilterComposer,
    $$PracticeRecordsTableOrderingComposer,
    $$PracticeRecordsTableAnnotationComposer,
    $$PracticeRecordsTableCreateCompanionBuilder,
    $$PracticeRecordsTableUpdateCompanionBuilder,
    (
      PracticeRecord,
      BaseReferences<_$AppDatabase, $PracticeRecordsTable, PracticeRecord>
    ),
    PracticeRecord,
    PrefetchHooks Function()> {
  $$PracticeRecordsTableTableManager(
      _$AppDatabase db, $PracticeRecordsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PracticeRecordsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PracticeRecordsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PracticeRecordsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> itemId = const Value.absent(),
            Value<String> itemType = const Value.absent(),
            Value<bool> isCorrect = const Value.absent(),
            Value<DateTime> practiceTime = const Value.absent(),
            Value<int> responseTimeMs = const Value.absent(),
            Value<String?> userAnswer = const Value.absent(),
            Value<String?> errorReason = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PracticeRecordsCompanion(
            id: id,
            itemId: itemId,
            itemType: itemType,
            isCorrect: isCorrect,
            practiceTime: practiceTime,
            responseTimeMs: responseTimeMs,
            userAnswer: userAnswer,
            errorReason: errorReason,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String itemId,
            required String itemType,
            required bool isCorrect,
            required DateTime practiceTime,
            Value<int> responseTimeMs = const Value.absent(),
            Value<String?> userAnswer = const Value.absent(),
            Value<String?> errorReason = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PracticeRecordsCompanion.insert(
            id: id,
            itemId: itemId,
            itemType: itemType,
            isCorrect: isCorrect,
            practiceTime: practiceTime,
            responseTimeMs: responseTimeMs,
            userAnswer: userAnswer,
            errorReason: errorReason,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$PracticeRecordsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PracticeRecordsTable,
    PracticeRecord,
    $$PracticeRecordsTableFilterComposer,
    $$PracticeRecordsTableOrderingComposer,
    $$PracticeRecordsTableAnnotationComposer,
    $$PracticeRecordsTableCreateCompanionBuilder,
    $$PracticeRecordsTableUpdateCompanionBuilder,
    (
      PracticeRecord,
      BaseReferences<_$AppDatabase, $PracticeRecordsTable, PracticeRecord>
    ),
    PracticeRecord,
    PrefetchHooks Function()>;
typedef $$MasteryStatesTableCreateCompanionBuilder = MasteryStatesCompanion
    Function({
  required String itemId,
  required String itemType,
  Value<String> status,
  Value<int> correctStreak,
  Value<int> totalAttempts,
  Value<int> correctCount,
  Value<DateTime?> lastPractice,
  Value<DateTime?> nextReview,
  Value<int> rowid,
});
typedef $$MasteryStatesTableUpdateCompanionBuilder = MasteryStatesCompanion
    Function({
  Value<String> itemId,
  Value<String> itemType,
  Value<String> status,
  Value<int> correctStreak,
  Value<int> totalAttempts,
  Value<int> correctCount,
  Value<DateTime?> lastPractice,
  Value<DateTime?> nextReview,
  Value<int> rowid,
});

class $$MasteryStatesTableFilterComposer
    extends Composer<_$AppDatabase, $MasteryStatesTable> {
  $$MasteryStatesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get itemId => $composableBuilder(
      column: $table.itemId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get itemType => $composableBuilder(
      column: $table.itemType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get correctStreak => $composableBuilder(
      column: $table.correctStreak, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get totalAttempts => $composableBuilder(
      column: $table.totalAttempts, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get correctCount => $composableBuilder(
      column: $table.correctCount, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastPractice => $composableBuilder(
      column: $table.lastPractice, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get nextReview => $composableBuilder(
      column: $table.nextReview, builder: (column) => ColumnFilters(column));
}

class $$MasteryStatesTableOrderingComposer
    extends Composer<_$AppDatabase, $MasteryStatesTable> {
  $$MasteryStatesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get itemId => $composableBuilder(
      column: $table.itemId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get itemType => $composableBuilder(
      column: $table.itemType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get correctStreak => $composableBuilder(
      column: $table.correctStreak,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get totalAttempts => $composableBuilder(
      column: $table.totalAttempts,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get correctCount => $composableBuilder(
      column: $table.correctCount,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastPractice => $composableBuilder(
      column: $table.lastPractice,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get nextReview => $composableBuilder(
      column: $table.nextReview, builder: (column) => ColumnOrderings(column));
}

class $$MasteryStatesTableAnnotationComposer
    extends Composer<_$AppDatabase, $MasteryStatesTable> {
  $$MasteryStatesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get itemId =>
      $composableBuilder(column: $table.itemId, builder: (column) => column);

  GeneratedColumn<String> get itemType =>
      $composableBuilder(column: $table.itemType, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<int> get correctStreak => $composableBuilder(
      column: $table.correctStreak, builder: (column) => column);

  GeneratedColumn<int> get totalAttempts => $composableBuilder(
      column: $table.totalAttempts, builder: (column) => column);

  GeneratedColumn<int> get correctCount => $composableBuilder(
      column: $table.correctCount, builder: (column) => column);

  GeneratedColumn<DateTime> get lastPractice => $composableBuilder(
      column: $table.lastPractice, builder: (column) => column);

  GeneratedColumn<DateTime> get nextReview => $composableBuilder(
      column: $table.nextReview, builder: (column) => column);
}

class $$MasteryStatesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MasteryStatesTable,
    MasteryState,
    $$MasteryStatesTableFilterComposer,
    $$MasteryStatesTableOrderingComposer,
    $$MasteryStatesTableAnnotationComposer,
    $$MasteryStatesTableCreateCompanionBuilder,
    $$MasteryStatesTableUpdateCompanionBuilder,
    (
      MasteryState,
      BaseReferences<_$AppDatabase, $MasteryStatesTable, MasteryState>
    ),
    MasteryState,
    PrefetchHooks Function()> {
  $$MasteryStatesTableTableManager(_$AppDatabase db, $MasteryStatesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MasteryStatesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MasteryStatesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MasteryStatesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> itemId = const Value.absent(),
            Value<String> itemType = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<int> correctStreak = const Value.absent(),
            Value<int> totalAttempts = const Value.absent(),
            Value<int> correctCount = const Value.absent(),
            Value<DateTime?> lastPractice = const Value.absent(),
            Value<DateTime?> nextReview = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MasteryStatesCompanion(
            itemId: itemId,
            itemType: itemType,
            status: status,
            correctStreak: correctStreak,
            totalAttempts: totalAttempts,
            correctCount: correctCount,
            lastPractice: lastPractice,
            nextReview: nextReview,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String itemId,
            required String itemType,
            Value<String> status = const Value.absent(),
            Value<int> correctStreak = const Value.absent(),
            Value<int> totalAttempts = const Value.absent(),
            Value<int> correctCount = const Value.absent(),
            Value<DateTime?> lastPractice = const Value.absent(),
            Value<DateTime?> nextReview = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MasteryStatesCompanion.insert(
            itemId: itemId,
            itemType: itemType,
            status: status,
            correctStreak: correctStreak,
            totalAttempts: totalAttempts,
            correctCount: correctCount,
            lastPractice: lastPractice,
            nextReview: nextReview,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$MasteryStatesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $MasteryStatesTable,
    MasteryState,
    $$MasteryStatesTableFilterComposer,
    $$MasteryStatesTableOrderingComposer,
    $$MasteryStatesTableAnnotationComposer,
    $$MasteryStatesTableCreateCompanionBuilder,
    $$MasteryStatesTableUpdateCompanionBuilder,
    (
      MasteryState,
      BaseReferences<_$AppDatabase, $MasteryStatesTable, MasteryState>
    ),
    MasteryState,
    PrefetchHooks Function()>;
typedef $$WrongItemsTableCreateCompanionBuilder = WrongItemsCompanion Function({
  required String id,
  required String itemId,
  required String itemType,
  required String unitId,
  Value<String?> errorReason,
  required DateTime addedTime,
  Value<bool> isResolved,
  Value<DateTime?> resolvedTime,
  Value<int> rowid,
});
typedef $$WrongItemsTableUpdateCompanionBuilder = WrongItemsCompanion Function({
  Value<String> id,
  Value<String> itemId,
  Value<String> itemType,
  Value<String> unitId,
  Value<String?> errorReason,
  Value<DateTime> addedTime,
  Value<bool> isResolved,
  Value<DateTime?> resolvedTime,
  Value<int> rowid,
});

class $$WrongItemsTableFilterComposer
    extends Composer<_$AppDatabase, $WrongItemsTable> {
  $$WrongItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get itemId => $composableBuilder(
      column: $table.itemId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get itemType => $composableBuilder(
      column: $table.itemType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get unitId => $composableBuilder(
      column: $table.unitId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get errorReason => $composableBuilder(
      column: $table.errorReason, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get addedTime => $composableBuilder(
      column: $table.addedTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isResolved => $composableBuilder(
      column: $table.isResolved, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get resolvedTime => $composableBuilder(
      column: $table.resolvedTime, builder: (column) => ColumnFilters(column));
}

class $$WrongItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $WrongItemsTable> {
  $$WrongItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get itemId => $composableBuilder(
      column: $table.itemId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get itemType => $composableBuilder(
      column: $table.itemType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get unitId => $composableBuilder(
      column: $table.unitId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get errorReason => $composableBuilder(
      column: $table.errorReason, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get addedTime => $composableBuilder(
      column: $table.addedTime, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isResolved => $composableBuilder(
      column: $table.isResolved, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get resolvedTime => $composableBuilder(
      column: $table.resolvedTime,
      builder: (column) => ColumnOrderings(column));
}

class $$WrongItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $WrongItemsTable> {
  $$WrongItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get itemId =>
      $composableBuilder(column: $table.itemId, builder: (column) => column);

  GeneratedColumn<String> get itemType =>
      $composableBuilder(column: $table.itemType, builder: (column) => column);

  GeneratedColumn<String> get unitId =>
      $composableBuilder(column: $table.unitId, builder: (column) => column);

  GeneratedColumn<String> get errorReason => $composableBuilder(
      column: $table.errorReason, builder: (column) => column);

  GeneratedColumn<DateTime> get addedTime =>
      $composableBuilder(column: $table.addedTime, builder: (column) => column);

  GeneratedColumn<bool> get isResolved => $composableBuilder(
      column: $table.isResolved, builder: (column) => column);

  GeneratedColumn<DateTime> get resolvedTime => $composableBuilder(
      column: $table.resolvedTime, builder: (column) => column);
}

class $$WrongItemsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $WrongItemsTable,
    WrongItem,
    $$WrongItemsTableFilterComposer,
    $$WrongItemsTableOrderingComposer,
    $$WrongItemsTableAnnotationComposer,
    $$WrongItemsTableCreateCompanionBuilder,
    $$WrongItemsTableUpdateCompanionBuilder,
    (WrongItem, BaseReferences<_$AppDatabase, $WrongItemsTable, WrongItem>),
    WrongItem,
    PrefetchHooks Function()> {
  $$WrongItemsTableTableManager(_$AppDatabase db, $WrongItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WrongItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WrongItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WrongItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> itemId = const Value.absent(),
            Value<String> itemType = const Value.absent(),
            Value<String> unitId = const Value.absent(),
            Value<String?> errorReason = const Value.absent(),
            Value<DateTime> addedTime = const Value.absent(),
            Value<bool> isResolved = const Value.absent(),
            Value<DateTime?> resolvedTime = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              WrongItemsCompanion(
            id: id,
            itemId: itemId,
            itemType: itemType,
            unitId: unitId,
            errorReason: errorReason,
            addedTime: addedTime,
            isResolved: isResolved,
            resolvedTime: resolvedTime,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String itemId,
            required String itemType,
            required String unitId,
            Value<String?> errorReason = const Value.absent(),
            required DateTime addedTime,
            Value<bool> isResolved = const Value.absent(),
            Value<DateTime?> resolvedTime = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              WrongItemsCompanion.insert(
            id: id,
            itemId: itemId,
            itemType: itemType,
            unitId: unitId,
            errorReason: errorReason,
            addedTime: addedTime,
            isResolved: isResolved,
            resolvedTime: resolvedTime,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$WrongItemsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $WrongItemsTable,
    WrongItem,
    $$WrongItemsTableFilterComposer,
    $$WrongItemsTableOrderingComposer,
    $$WrongItemsTableAnnotationComposer,
    $$WrongItemsTableCreateCompanionBuilder,
    $$WrongItemsTableUpdateCompanionBuilder,
    (WrongItem, BaseReferences<_$AppDatabase, $WrongItemsTable, WrongItem>),
    WrongItem,
    PrefetchHooks Function()>;
typedef $$DailyStatsTableCreateCompanionBuilder = DailyStatsCompanion Function({
  required String date,
  required String subject,
  Value<int> studyMinutes,
  Value<int> wordsLearned,
  Value<int> wordsMastered,
  Value<int> questionsAnswered,
  Value<int> correctAnswers,
  Value<int> rowid,
});
typedef $$DailyStatsTableUpdateCompanionBuilder = DailyStatsCompanion Function({
  Value<String> date,
  Value<String> subject,
  Value<int> studyMinutes,
  Value<int> wordsLearned,
  Value<int> wordsMastered,
  Value<int> questionsAnswered,
  Value<int> correctAnswers,
  Value<int> rowid,
});

class $$DailyStatsTableFilterComposer
    extends Composer<_$AppDatabase, $DailyStatsTable> {
  $$DailyStatsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get subject => $composableBuilder(
      column: $table.subject, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get studyMinutes => $composableBuilder(
      column: $table.studyMinutes, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get wordsLearned => $composableBuilder(
      column: $table.wordsLearned, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get wordsMastered => $composableBuilder(
      column: $table.wordsMastered, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get questionsAnswered => $composableBuilder(
      column: $table.questionsAnswered,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get correctAnswers => $composableBuilder(
      column: $table.correctAnswers,
      builder: (column) => ColumnFilters(column));
}

class $$DailyStatsTableOrderingComposer
    extends Composer<_$AppDatabase, $DailyStatsTable> {
  $$DailyStatsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get subject => $composableBuilder(
      column: $table.subject, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get studyMinutes => $composableBuilder(
      column: $table.studyMinutes,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get wordsLearned => $composableBuilder(
      column: $table.wordsLearned,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get wordsMastered => $composableBuilder(
      column: $table.wordsMastered,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get questionsAnswered => $composableBuilder(
      column: $table.questionsAnswered,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get correctAnswers => $composableBuilder(
      column: $table.correctAnswers,
      builder: (column) => ColumnOrderings(column));
}

class $$DailyStatsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DailyStatsTable> {
  $$DailyStatsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get subject =>
      $composableBuilder(column: $table.subject, builder: (column) => column);

  GeneratedColumn<int> get studyMinutes => $composableBuilder(
      column: $table.studyMinutes, builder: (column) => column);

  GeneratedColumn<int> get wordsLearned => $composableBuilder(
      column: $table.wordsLearned, builder: (column) => column);

  GeneratedColumn<int> get wordsMastered => $composableBuilder(
      column: $table.wordsMastered, builder: (column) => column);

  GeneratedColumn<int> get questionsAnswered => $composableBuilder(
      column: $table.questionsAnswered, builder: (column) => column);

  GeneratedColumn<int> get correctAnswers => $composableBuilder(
      column: $table.correctAnswers, builder: (column) => column);
}

class $$DailyStatsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $DailyStatsTable,
    DailyStat,
    $$DailyStatsTableFilterComposer,
    $$DailyStatsTableOrderingComposer,
    $$DailyStatsTableAnnotationComposer,
    $$DailyStatsTableCreateCompanionBuilder,
    $$DailyStatsTableUpdateCompanionBuilder,
    (DailyStat, BaseReferences<_$AppDatabase, $DailyStatsTable, DailyStat>),
    DailyStat,
    PrefetchHooks Function()> {
  $$DailyStatsTableTableManager(_$AppDatabase db, $DailyStatsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DailyStatsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DailyStatsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DailyStatsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> date = const Value.absent(),
            Value<String> subject = const Value.absent(),
            Value<int> studyMinutes = const Value.absent(),
            Value<int> wordsLearned = const Value.absent(),
            Value<int> wordsMastered = const Value.absent(),
            Value<int> questionsAnswered = const Value.absent(),
            Value<int> correctAnswers = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DailyStatsCompanion(
            date: date,
            subject: subject,
            studyMinutes: studyMinutes,
            wordsLearned: wordsLearned,
            wordsMastered: wordsMastered,
            questionsAnswered: questionsAnswered,
            correctAnswers: correctAnswers,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String date,
            required String subject,
            Value<int> studyMinutes = const Value.absent(),
            Value<int> wordsLearned = const Value.absent(),
            Value<int> wordsMastered = const Value.absent(),
            Value<int> questionsAnswered = const Value.absent(),
            Value<int> correctAnswers = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DailyStatsCompanion.insert(
            date: date,
            subject: subject,
            studyMinutes: studyMinutes,
            wordsLearned: wordsLearned,
            wordsMastered: wordsMastered,
            questionsAnswered: questionsAnswered,
            correctAnswers: correctAnswers,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$DailyStatsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $DailyStatsTable,
    DailyStat,
    $$DailyStatsTableFilterComposer,
    $$DailyStatsTableOrderingComposer,
    $$DailyStatsTableAnnotationComposer,
    $$DailyStatsTableCreateCompanionBuilder,
    $$DailyStatsTableUpdateCompanionBuilder,
    (DailyStat, BaseReferences<_$AppDatabase, $DailyStatsTable, DailyStat>),
    DailyStat,
    PrefetchHooks Function()>;
typedef $$GrammarQuestionsTableCreateCompanionBuilder
    = GrammarQuestionsCompanion Function({
  required String id,
  required String type,
  required String topic,
  Value<String?> subtopic,
  required String question,
  required String options,
  required String answer,
  Value<String?> explanation,
  Value<int> difficulty,
  Value<String?> source,
  Value<int> rowid,
});
typedef $$GrammarQuestionsTableUpdateCompanionBuilder
    = GrammarQuestionsCompanion Function({
  Value<String> id,
  Value<String> type,
  Value<String> topic,
  Value<String?> subtopic,
  Value<String> question,
  Value<String> options,
  Value<String> answer,
  Value<String?> explanation,
  Value<int> difficulty,
  Value<String?> source,
  Value<int> rowid,
});

class $$GrammarQuestionsTableFilterComposer
    extends Composer<_$AppDatabase, $GrammarQuestionsTable> {
  $$GrammarQuestionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get topic => $composableBuilder(
      column: $table.topic, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get subtopic => $composableBuilder(
      column: $table.subtopic, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get question => $composableBuilder(
      column: $table.question, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get options => $composableBuilder(
      column: $table.options, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get answer => $composableBuilder(
      column: $table.answer, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get explanation => $composableBuilder(
      column: $table.explanation, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get difficulty => $composableBuilder(
      column: $table.difficulty, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get source => $composableBuilder(
      column: $table.source, builder: (column) => ColumnFilters(column));
}

class $$GrammarQuestionsTableOrderingComposer
    extends Composer<_$AppDatabase, $GrammarQuestionsTable> {
  $$GrammarQuestionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get topic => $composableBuilder(
      column: $table.topic, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get subtopic => $composableBuilder(
      column: $table.subtopic, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get question => $composableBuilder(
      column: $table.question, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get options => $composableBuilder(
      column: $table.options, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get answer => $composableBuilder(
      column: $table.answer, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get explanation => $composableBuilder(
      column: $table.explanation, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get difficulty => $composableBuilder(
      column: $table.difficulty, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get source => $composableBuilder(
      column: $table.source, builder: (column) => ColumnOrderings(column));
}

class $$GrammarQuestionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $GrammarQuestionsTable> {
  $$GrammarQuestionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get topic =>
      $composableBuilder(column: $table.topic, builder: (column) => column);

  GeneratedColumn<String> get subtopic =>
      $composableBuilder(column: $table.subtopic, builder: (column) => column);

  GeneratedColumn<String> get question =>
      $composableBuilder(column: $table.question, builder: (column) => column);

  GeneratedColumn<String> get options =>
      $composableBuilder(column: $table.options, builder: (column) => column);

  GeneratedColumn<String> get answer =>
      $composableBuilder(column: $table.answer, builder: (column) => column);

  GeneratedColumn<String> get explanation => $composableBuilder(
      column: $table.explanation, builder: (column) => column);

  GeneratedColumn<int> get difficulty => $composableBuilder(
      column: $table.difficulty, builder: (column) => column);

  GeneratedColumn<String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);
}

class $$GrammarQuestionsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $GrammarQuestionsTable,
    GrammarQuestionData,
    $$GrammarQuestionsTableFilterComposer,
    $$GrammarQuestionsTableOrderingComposer,
    $$GrammarQuestionsTableAnnotationComposer,
    $$GrammarQuestionsTableCreateCompanionBuilder,
    $$GrammarQuestionsTableUpdateCompanionBuilder,
    (
      GrammarQuestionData,
      BaseReferences<_$AppDatabase, $GrammarQuestionsTable, GrammarQuestionData>
    ),
    GrammarQuestionData,
    PrefetchHooks Function()> {
  $$GrammarQuestionsTableTableManager(
      _$AppDatabase db, $GrammarQuestionsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GrammarQuestionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GrammarQuestionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GrammarQuestionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<String> topic = const Value.absent(),
            Value<String?> subtopic = const Value.absent(),
            Value<String> question = const Value.absent(),
            Value<String> options = const Value.absent(),
            Value<String> answer = const Value.absent(),
            Value<String?> explanation = const Value.absent(),
            Value<int> difficulty = const Value.absent(),
            Value<String?> source = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              GrammarQuestionsCompanion(
            id: id,
            type: type,
            topic: topic,
            subtopic: subtopic,
            question: question,
            options: options,
            answer: answer,
            explanation: explanation,
            difficulty: difficulty,
            source: source,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String type,
            required String topic,
            Value<String?> subtopic = const Value.absent(),
            required String question,
            required String options,
            required String answer,
            Value<String?> explanation = const Value.absent(),
            Value<int> difficulty = const Value.absent(),
            Value<String?> source = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              GrammarQuestionsCompanion.insert(
            id: id,
            type: type,
            topic: topic,
            subtopic: subtopic,
            question: question,
            options: options,
            answer: answer,
            explanation: explanation,
            difficulty: difficulty,
            source: source,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$GrammarQuestionsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $GrammarQuestionsTable,
    GrammarQuestionData,
    $$GrammarQuestionsTableFilterComposer,
    $$GrammarQuestionsTableOrderingComposer,
    $$GrammarQuestionsTableAnnotationComposer,
    $$GrammarQuestionsTableCreateCompanionBuilder,
    $$GrammarQuestionsTableUpdateCompanionBuilder,
    (
      GrammarQuestionData,
      BaseReferences<_$AppDatabase, $GrammarQuestionsTable, GrammarQuestionData>
    ),
    GrammarQuestionData,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$WordsTableTableManager get words =>
      $$WordsTableTableManager(_db, _db.words);
  $$UnitsTableTableManager get units =>
      $$UnitsTableTableManager(_db, _db.units);
  $$PracticeRecordsTableTableManager get practiceRecords =>
      $$PracticeRecordsTableTableManager(_db, _db.practiceRecords);
  $$MasteryStatesTableTableManager get masteryStates =>
      $$MasteryStatesTableTableManager(_db, _db.masteryStates);
  $$WrongItemsTableTableManager get wrongItems =>
      $$WrongItemsTableTableManager(_db, _db.wrongItems);
  $$DailyStatsTableTableManager get dailyStats =>
      $$DailyStatsTableTableManager(_db, _db.dailyStats);
  $$GrammarQuestionsTableTableManager get grammarQuestions =>
      $$GrammarQuestionsTableTableManager(_db, _db.grammarQuestions);
}
