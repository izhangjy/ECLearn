import 'package:uuid/uuid.dart';
import '../practice/grammar_question_service.dart';
import 'database.dart';

class TestDataInitializer {
  final AppDatabase _db;
  final GrammarQuestionService _grammarService;
  final _uuid = const Uuid();

  TestDataInitializer(this._db) : _grammarService = GrammarQuestionService(_db);

  // 初始化所有测试数据
  Future<void> initializeAll() async {
    await initializeGrammarQuestions();
  }

  // 初始化语法题测试数据
  Future<void> initializeGrammarQuestions() async {
    // 检查是否已有数据
    final existing = await _grammarService.getAllQuestions();
    if (existing.isNotEmpty) {
      print('语法题数据已存在，跳过初始化');
      return;
    }

    print('开始初始化语法题测试数据...');

    // 定语从句题目
    await _addGrammarQuestion(
      topic: '定语从句',
      subtopic: '关系代词which',
      question: 'This is the book ___ I bought yesterday.',
      options: ['which', 'who', 'whom', 'whose'],
      answer: 'which',
      explanation: '先行词是book（物），在从句中作宾语，用关系代词which。',
      difficulty: 2,
    );

    await _addGrammarQuestion(
      topic: '定语从句',
      subtopic: '关系代词who',
      question: 'The man ___ is standing there is my teacher.',
      options: ['who', 'which', 'whose', 'whom'],
      answer: 'who',
      explanation: '先行词是man（人），在从句中作主语，用关系代词who。',
      difficulty: 1,
    );

    await _addGrammarQuestion(
      topic: '定语从句',
      subtopic: '关系代词whose',
      question: 'I know a girl ___ father is a famous scientist.',
      options: ['who', 'which', 'whose', 'whom'],
      answer: 'whose',
      explanation: '先行词是girl，在从句中表示所属关系（她的父亲），用whose。',
      difficulty: 3,
    );

    // 名词性从句题目
    await _addGrammarQuestion(
      topic: '名词性从句',
      subtopic: '主语从句',
      question: '___ he said at the meeting surprised everyone.',
      options: ['That', 'What', 'Which', 'Whether'],
      answer: 'What',
      explanation: '主语从句中缺少宾语，what既引导从句又在从句中作said的宾语。',
      difficulty: 3,
    );

    await _addGrammarQuestion(
      topic: '名词性从句',
      subtopic: '宾语从句',
      question: 'I wonder ___ he will come to the party.',
      options: ['that', 'if', 'what', 'which'],
      answer: 'if',
      explanation: 'wonder后接宾语从句，表示"是否"用if或whether。',
      difficulty: 2,
    );

    // 状语从句题目
    await _addGrammarQuestion(
      topic: '状语从句',
      subtopic: '时间状语从句',
      question: 'I will call you ___ I arrive at the airport.',
      options: ['as soon as', 'until', 'unless', 'although'],
      answer: 'as soon as',
      explanation: '表示"一...就..."用as soon as引导时间状语从句。',
      difficulty: 2,
    );

    await _addGrammarQuestion(
      topic: '状语从句',
      subtopic: '条件状语从句',
      question: 'You will succeed ___ you work hard.',
      options: ['if', 'unless', 'although', 'because'],
      answer: 'if',
      explanation: '表示条件"如果"用if引导条件状语从句。',
      difficulty: 1,
    );

    // 时态题目
    await _addGrammarQuestion(
      topic: '一般现在时',
      subtopic: '一般现在时基本用法',
      question: 'The sun ___ in the east.',
      options: ['rises', 'rose', 'is rising', 'has risen'],
      answer: 'rises',
      explanation: '客观真理用一般现在时，主语是第三人称单数，动词加s。',
      difficulty: 1,
    );

    await _addGrammarQuestion(
      topic: '现在完成时',
      subtopic: '现在完成时基本用法',
      question: 'I ___ this book for two weeks.',
      options: ['have bought', 'have had', 'bought', 'had'],
      answer: 'have had',
      explanation: '现在完成时与for+时间段连用时，动词必须是延续性动词，buy是瞬间动词，要用have。',
      difficulty: 3,
    );

    // 被动语态题目
    await _addGrammarQuestion(
      topic: '被动语态',
      subtopic: '一般现在时被动语态',
      question: 'English ___ in many countries.',
      options: ['speaks', 'is spoken', 'spoke', 'was spoken'],
      answer: 'is spoken',
      explanation: 'English是被说的，用被动语态；陈述客观事实用一般现在时。',
      difficulty: 2,
    );

    print('语法题测试数据初始化完成！共添加10道题目。');
  }

  Future<void> _addGrammarQuestion({
    required String topic,
    String? subtopic,
    required String question,
    required List<String> options,
    required String answer,
    required String explanation,
    int difficulty = 1,
  }) async {
    await _grammarService.addQuestion(
      id: _uuid.v4(),
      type: '单选',
      topic: topic,
      subtopic: subtopic,
      question: question,
      options: options,
      answer: answer,
      explanation: explanation,
      difficulty: difficulty,
      source: '测试数据',
    );
  }
}
