import 'dart:convert';

import 'package:drift/drift.dart';
import '../database/database.dart';

class GrammarQuestionService {
  final AppDatabase _db;

  GrammarQuestionService(this._db);

  Future<void> addQuestion({
    required String id,
    required String type,
    required String topic,
    String? subtopic,
    required String question,
    required List<String> options,
    required String answer,
    String? explanation,
    int difficulty = 1,
    String? source,
  }) async {
    final entry = GrammarQuestionsCompanion(
      id: Value(id),
      type: Value(type),
      topic: Value(topic),
      subtopic: Value(subtopic),
      question: Value(question),
      options: Value(jsonEncode(options)),
      answer: Value(answer),
      explanation: Value(explanation),
      difficulty: Value(difficulty),
      source: Value(source),
    );
    await _db.insertGrammarQuestion(entry);
  }

  Future<List<GrammarQuestionData>> getQuestionsByTopic(String topic) {
    return _db.getQuestionsByTopic(topic);
  }

  Future<int> deleteQuestion(String id) {
    return _db.deleteGrammarQuestion(id);
  }

  Future<List<GrammarQuestionData>> getAllQuestions() {
    return _db.getAllQuestions();
  }
}
