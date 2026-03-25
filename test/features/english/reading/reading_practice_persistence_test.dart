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

  test('错题收藏状态在数据库中正确保存和恢复', () async {
    // 插入测试文章
    await database.insertReadingPassage(ReadingPassagesCompanion(
      id: Value('persist_test_passage'),
      title: Value('持久化测试文章'),
      content: Value('测试内容'),
      category: Value('测试'),
      difficulty: Value(1),
      wordCount: Value(100),
      source: Value.absent(),
    ));

    final questionOptions = jsonEncode(['选项A', '选项B', '选项C', '选项D']);
    await database.insertReadingQuestion(ReadingQuestionsCompanion(
      id: Value('persist_q1'),
      passageId: Value('persist_test_passage'),
      questionNumber: Value(1),
      type: Value('细节理解'),
      question: Value('持久化测试题目？'),
      options: Value(questionOptions),
      answer: Value('选项B'),
      explanation: Value('这是正确答案解析'),
    ));

    // 添加错题记录
    await database.addWrongItem(WrongItemsCompanion(
      id: Value('persist_q1'),
      itemId: Value('persist_q1'),
      itemType: Value('reading'),
      unitId: Value(''),
      errorReason: Value('选项A'),
      addedTime: Value(DateTime.now()),
      isResolved: Value(false),
      resolvedTime: Value.absent(),
    ));

    // 验证错题已保存
    final wrongItems = await database.getUnresolvedWrongItems('reading');
    expect(wrongItems.length, 1);
    expect(wrongItems.first.itemId, 'persist_q1');

    // 标记错题已解决
    await database.addWrongItem(WrongItemsCompanion(
      id: Value('persist_q1'),
      itemId: Value('persist_q1'),
      itemType: Value('reading'),
      unitId: Value(''),
      errorReason: Value('选项A'),
      addedTime: Value(wrongItems.first.addedTime),
      isResolved: Value(true),
      resolvedTime: Value(DateTime.now()),
    ));

    // 验证错题已移除
    final resolvedItems = await database.getUnresolvedWrongItems('reading');
    expect(resolvedItems.length, 0);
  });
}
