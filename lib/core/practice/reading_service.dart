import 'package:drift/drift.dart';
import '../database/database.dart';

/// 阅读理解服务层
class ReadingService {
  final AppDatabase _db;

  ReadingService(this._db);

  // 文章操作
  Future<void> insertPassage({
    required String id,
    required String title,
    required String content,
    required String category,
    int difficulty = 1,
    int wordCount = 0,
    String? source,
  }) async {
    await _db.insertReadingPassage(ReadingPassagesCompanion(
      id: Value(id),
      title: Value(title),
      content: Value(content),
      category: Value(category),
      difficulty: Value(difficulty),
      wordCount: Value(wordCount),
      source: Value(source),
    ));
  }

  Future<List<ReadingPassageData>> getAllPassages() {
    return _db.getAllPassages();
  }

  Future<List<ReadingPassageData>> getPassagesByCategory(String category) {
    return _db.getPassagesByCategory(category);
  }

  Future<ReadingPassageData?> getPassageById(String id) {
    return _db.getPassageById(id);
  }

  // 题目操作
  Future<void> insertQuestion({
    required String id,
    required String passageId,
    required int questionNumber,
    required String type,
    required String question,
    required String options,
    required String answer,
    String? explanation,
  }) async {
    await _db.insertReadingQuestion(ReadingQuestionsCompanion(
      id: Value(id),
      passageId: Value(passageId),
      questionNumber: Value(questionNumber),
      type: Value(type),
      question: Value(question),
      options: Value(options),
      answer: Value(answer),
      explanation: Value(explanation),
    ));
  }

  Future<List<ReadingQuestionData>> getQuestionsByPassageId(String passageId) {
    return _db.getQuestionsByPassageId(passageId);
  }
}
