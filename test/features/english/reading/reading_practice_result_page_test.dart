import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:eclearn/core/database/database.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AppDatabase database;

  setUp(() async {
    // 使用内存数据库进行测试
    database = AppDatabase.forTest(
        DatabaseConnection.fromExecutor(NativeDatabase.memory()));
  });

  test('练习结果统计数据正确性验证', () async {
    // 插入测试文章
    await database.insertReadingPassage(ReadingPassagesCompanion(
      id: Value('result_test_passage'),
      title: Value('结果统计测试文章'),
      content: Value('测试内容'),
      category: Value('测试'),
      difficulty: Value(1),
      wordCount: Value(100),
      source: Value.absent(),
    ));

    final questionOptions = jsonEncode(['选项A', '选项B', '选项C', '选项D']);

    // 插入3道测试题目
    for (int i = 1; i <= 3; i++) {
      await database.insertReadingQuestion(ReadingQuestionsCompanion(
        id: Value('result_q$i'),
        passageId: Value('result_test_passage'),
        questionNumber: Value(i),
        type: Value('细节理解'),
        question: Value('测试题目$i？'),
        options: Value(questionOptions),
        answer: Value('选项B'),
        explanation: Value('题目$i的解析'),
      ));
    }

    // 插入模拟练习记录：2道正确，1道错误
    final now = DateTime.now();
    await database.into(database.practiceRecords).insert(
        PracticeRecordsCompanion(
          id: Value('record_1'),
          itemId: Value('result_q1'),
          itemType: Value('reading'),
          isCorrect: Value(true),
          userAnswer: Value('选项B'),
          practiceTime: Value(now.subtract(Duration(minutes: 3))),
        ));

    await database.into(database.practiceRecords).insert(
        PracticeRecordsCompanion(
          id: Value('record_2'),
          itemId: Value('result_q2'),
          itemType: Value('reading'),
          isCorrect: Value(false),
          userAnswer: Value('选项A'),
          practiceTime: Value(now.subtract(Duration(minutes: 2))),
        ));

    await database.into(database.practiceRecords).insert(
        PracticeRecordsCompanion(
          id: Value('record_3'),
          itemId: Value('result_q3'),
          itemType: Value('reading'),
          isCorrect: Value(true),
          userAnswer: Value('选项B'),
          practiceTime: Value(now.subtract(Duration(minutes: 1))),
        ));

    // 验证练习记录
    final records = await database.getRecentRecords('reading', limit: 1000);
    expect(records.length, 3);

    final correct = records.where((r) => r.isCorrect).length;
    expect(correct, 2);

    final accuracy = (correct / records.length * 100).toStringAsFixed(1);
    expect(accuracy, '66.7');
  });
}
