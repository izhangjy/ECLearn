import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'database.g.dart';

// 单词表
class Words extends Table {
  TextColumn get id => text()();
  TextColumn get word => text()();
  TextColumn get phonetic => text().withDefault(const Constant(''))();
  TextColumn get meaningsJson => text()(); // JSON存储释义
  TextColumn get example => text().nullable()();
  TextColumn get exampleCn => text().nullable()();
  TextColumn get derivativesJson => text().withDefault(const Constant('[]'))();
  TextColumn get unitId => text()();
  TextColumn get frequency => text().withDefault(const Constant('中频'))();

  @override
  Set<Column> get primaryKey => {id};
}

// 单元表
class Units extends Table {
  TextColumn get id => text()();
  TextColumn get subject => text()(); // english, chinese
  TextColumn get grade => text()();
  TextColumn get textbookType => text()();
  IntColumn get bookNumber => integer()();
  IntColumn get unitNumber => integer()();
  TextColumn get title => text()();
  TextColumn get description => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

// 练习记录表
class PracticeRecords extends Table {
  TextColumn get id => text()();
  TextColumn get itemId => text()();
  TextColumn get itemType => text()(); // word, grammar, reading
  BoolColumn get isCorrect => boolean()();
  DateTimeColumn get practiceTime => dateTime()();
  IntColumn get responseTimeMs => integer().withDefault(const Constant(0))();
  TextColumn get userAnswer => text().nullable()();
  TextColumn get errorReason => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

// 掌握状态表
class MasteryStates extends Table {
  TextColumn get itemId => text()();
  TextColumn get itemType => text()();
  TextColumn get status => text().withDefault(const Constant('notStarted'))();
  IntColumn get correctStreak => integer().withDefault(const Constant(0))();
  IntColumn get totalAttempts => integer().withDefault(const Constant(0))();
  IntColumn get correctCount => integer().withDefault(const Constant(0))();
  DateTimeColumn get lastPractice => dateTime().nullable()();
  DateTimeColumn get nextReview => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {itemId, itemType};
}

// 错题表
class WrongItems extends Table {
  TextColumn get id => text()();
  TextColumn get itemId => text()();
  TextColumn get itemType => text()();
  TextColumn get unitId => text()();
  TextColumn get errorReason => text().nullable()();
  DateTimeColumn get addedTime => dateTime()();
  BoolColumn get isResolved => boolean().withDefault(const Constant(false))();
  DateTimeColumn get resolvedTime => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

// 学习统计表
class DailyStats extends Table {
  TextColumn get date => text()(); // yyyy-MM-dd
  TextColumn get subject => text()();
  IntColumn get studyMinutes => integer().withDefault(const Constant(0))();
  IntColumn get wordsLearned => integer().withDefault(const Constant(0))();
  IntColumn get wordsMastered => integer().withDefault(const Constant(0))();
  IntColumn get questionsAnswered => integer().withDefault(const Constant(0))();
  IntColumn get correctAnswers => integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {date, subject};
}

// 语法题表
@DataClassName('GrammarQuestionData')
class GrammarQuestions extends Table {
  TextColumn get id => text()();
  TextColumn get type => text()(); // 题型，如单选、多选
  TextColumn get topic => text()(); // 语法专题
  TextColumn get subtopic => text().nullable()(); // 子专题
  TextColumn get question => text()(); // 题干
  TextColumn get options => text()(); // JSON格式字符串的选项列表
  TextColumn get answer => text()(); // 标准答案
  TextColumn get explanation => text().nullable()(); // 答案解析
  IntColumn get difficulty => integer().withDefault(const Constant(1))(); // 难度等级
  TextColumn get source => text().nullable()(); // 题目来源

  @override
  Set<Column> get primaryKey => {id};
}

// 阅读文章表
@DataClassName('ReadingPassageData')
class ReadingPassages extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()(); // 文章标题
  TextColumn get content => text()(); // 文章内容
  TextColumn get category => text()(); // 分类：记叙文、说明文、议论文、应用文
  IntColumn get difficulty => integer().withDefault(const Constant(1))(); // 难度1-5
  IntColumn get wordCount => integer().withDefault(const Constant(0))(); // 词数
  TextColumn get source => text().nullable()(); // 来源

  @override
  Set<Column> get primaryKey => {id};
}

// 阅读题目表
@DataClassName('ReadingQuestionData')
class ReadingQuestions extends Table {
  TextColumn get id => text()();
  TextColumn get passageId => text()(); // 关联文章ID
  IntColumn get questionNumber => integer()(); // 题号
  TextColumn get type => text()(); // 题型：细节理解、推理判断、主旨大意、词义猜测
  TextColumn get question => text()(); // 题干
  TextColumn get options => text()(); // JSON格式选项
  TextColumn get answer => text()(); // 答案
  TextColumn get explanation => text().nullable()(); // 解析

  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(tables: [
  Words,
  Units,
  PracticeRecords,
  MasteryStates,
  WrongItems,
  DailyStats,
  GrammarQuestions,
  ReadingPassages,
  ReadingQuestions,
])
class AppDatabase extends _$AppDatabase {
  static AppDatabase? _instance;

  AppDatabase._() : super(_openConnection());

  static AppDatabase get instance {
    _instance ??= AppDatabase._();
    return _instance!;
  }

  @override
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onUpgrade: (migrator, from, to) async {
      if (from < 2) {
        await migrator.createTable(grammarQuestions);
      }
      if (from < 3) {
        await migrator.createTable(readingPassages);
        await migrator.createTable(readingQuestions);
      }
    },
  );

  Future<void> initialize() async {
    // 数据库初始化逻辑
    await customStatement('PRAGMA foreign_keys = ON');
  }

  // 单词相关操作
  Future<List<Word>> getWordsByUnit(String unitId) {
    return (select(words)..where((w) => w.unitId.equals(unitId))).get();
  }

  Future<void> insertWord(WordsCompanion word) {
    return into(words).insert(word, mode: InsertMode.insertOrReplace);
  }

  Future<void> insertWords(List<WordsCompanion> wordList) async {
    await batch((batch) {
      batch.insertAll(words, wordList, mode: InsertMode.insertOrReplace);
    });
  }

  // 单元相关操作
  Future<List<Unit>> getUnitsBySubject(String subject) {
    return (select(units)..where((u) => u.subject.equals(subject))).get();
  }

  Future<void> insertUnit(UnitsCompanion unit) {
    return into(units).insert(unit, mode: InsertMode.insertOrReplace);
  }

  // 掌握状态操作
  Future<MasteryState?> getMasteryState(String itemId, String itemType) {
    return (select(masteryStates)
      ..where((m) => m.itemId.equals(itemId) & m.itemType.equals(itemType)))
        .getSingleOrNull();
  }

  Future<void> updateMasteryState(MasteryStatesCompanion state) {
    return into(masteryStates).insert(state, mode: InsertMode.insertOrReplace);
  }

  // 练习记录操作
  Future<void> insertPracticeRecord(PracticeRecordsCompanion record) {
    return into(practiceRecords).insert(record);
  }

  Future<List<PracticeRecord>> getRecentRecords(String itemType, {int limit = 100}) {
    return (select(practiceRecords)
      ..where((r) => r.itemType.equals(itemType))
      ..orderBy([(r) => OrderingTerm.desc(r.practiceTime)])
      ..limit(limit))
        .get();
  }

  // 错题操作
  Future<void> addWrongItem(WrongItemsCompanion item) {
    return into(wrongItems).insert(item, mode: InsertMode.insertOrReplace);
  }

  Future<List<WrongItem>> getUnresolvedWrongItems(String itemType) {
    return (select(wrongItems)
      ..where((w) => w.itemType.equals(itemType) & w.isResolved.equals(false)))
        .get();
  }

  // 统计操作
  Future<void> updateDailyStats(DailyStatsCompanion stats) {
    return into(dailyStats).insert(stats, mode: InsertMode.insertOrReplace);
  }

  Future<DailyStat?> getDailyStats(String date, String subject) {
    return (select(dailyStats)
      ..where((s) => s.date.equals(date) & s.subject.equals(subject)))
        .getSingleOrNull();
  }

  // 语法题操作
  Future<void> insertGrammarQuestion(GrammarQuestionsCompanion question) {
    return into(grammarQuestions).insert(question, mode: InsertMode.insertOrReplace);
  }

  Future<List<GrammarQuestionData>> getQuestionsByTopic(String topic) {
    return (select(grammarQuestions)..where((q) => q.topic.equals(topic))).get();
  }

  Future<int> deleteGrammarQuestion(String id) {
    return (delete(grammarQuestions)..where((q) => q.id.equals(id))).go();
  }

  Future<List<GrammarQuestionData>> getAllQuestions() {
    return select(grammarQuestions).get();
  }

  // 阅读文章操作
  Future<void> insertReadingPassage(ReadingPassagesCompanion passage) {
    return into(readingPassages).insert(passage, mode: InsertMode.insertOrReplace);
  }

  Future<List<ReadingPassageData>> getAllPassages() {
    return select(readingPassages).get();
  }

  Future<List<ReadingPassageData>> getPassagesByCategory(String category) {
    return (select(readingPassages)..where((p) => p.category.equals(category))).get();
  }

  Future<ReadingPassageData?> getPassageById(String id) {
    return (select(readingPassages)..where((p) => p.id.equals(id))).getSingleOrNull();
  }

  // 阅读题目操作
  Future<void> insertReadingQuestion(ReadingQuestionsCompanion question) {
    return into(readingQuestions).insert(question, mode: InsertMode.insertOrReplace);
  }

  Future<List<ReadingQuestionData>> getQuestionsByPassageId(String passageId) {
    return (select(readingQuestions)
      ..where((q) => q.passageId.equals(passageId))
      ..orderBy([(q) => OrderingTerm.asc(q.questionNumber)]))
        .get();
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'eclearn.db'));
    return NativeDatabase.createInBackground(file);
  });
}
