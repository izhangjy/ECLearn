import 'dart:convert';

import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/database/database.dart';
import '../../../core/practice/reading_service.dart';
import '../../../core/practice/practice_engine.dart';

// Provider：ReadingService
final readingServiceProvider = Provider<ReadingService>((ref) {
  return ReadingService(AppDatabase.instance);
});

// Provider：PracticeEngine
final practiceEngineProvider = Provider<PracticeEngine>((ref) {
  return PracticeEngine(AppDatabase.instance);
});

// Provider：AppDatabase实例
final appDatabaseProvider = Provider<AppDatabase>((ref) {
  return AppDatabase.instance;
});

// 阅读练习状态类
class ReadingPracticeState {
  final List<ReadingQuestionData> questions;
  final int currentIndex;
  final String? selectedOption;
  final bool answered;
  final bool isCorrect;
  final bool isCollected; // 是否错题收藏标记

  ReadingPracticeState({
    required this.questions,
    this.currentIndex = 0,
    this.selectedOption,
    this.answered = false,
    this.isCorrect = false,
    this.isCollected = false,
  });

  ReadingPracticeState copyWith({
    List<ReadingQuestionData>? questions,
    int? currentIndex,
    String? selectedOption,
    bool? answered,
    bool? isCorrect,
    bool? isCollected,
  }) {
    return ReadingPracticeState(
      questions: questions ?? this.questions,
      currentIndex: currentIndex ?? this.currentIndex,
      selectedOption: selectedOption,
      answered: answered ?? this.answered,
      isCorrect: isCorrect ?? this.isCorrect,
      isCollected: isCollected ?? this.isCollected,
    );
  }
}

// StateNotifier管理阅读练习状态和逻辑
class ReadingPracticeNotifier extends StateNotifier<ReadingPracticeState> {
  final ReadingService _service;
  final PracticeEngine _engine;
  final AppDatabase _db;

  ReadingPracticeNotifier(this._service, this._engine, this._db)
      : super(ReadingPracticeState(questions: []));

  Future<void> loadQuestions(String passageId) async {
    final questions = await _service.getQuestionsByPassageId(passageId);
    if (questions.isEmpty) {
      state = ReadingPracticeState(questions: []);
      return;
    }
    final firstQ = questions.first;
    final collected = await _checkIfCollected(firstQ);
    state = ReadingPracticeState(questions: questions, isCollected: collected);
  }

  Future<bool> _checkIfCollected(ReadingQuestionData question) async {
    final wrongItems = await _db.getUnresolvedWrongItems('reading');
    return wrongItems.any((w) => w.itemId == question.id);
  }

  void selectOption(String option) {
    if (!state.answered) {
      state = state.copyWith(selectedOption: option);
    }
  }

  Future<void> submitAnswer() async {
    if (state.selectedOption == null || state.questions.isEmpty) return;

    final question = state.questions[state.currentIndex];
    final isCorrect = state.selectedOption == question.answer;

    await _engine.recordPractice(
      itemId: question.id,
      itemType: 'reading',
      isCorrect: isCorrect,
      userAnswer: state.selectedOption,
    );

    // 错题收藏或自动移除
    if (!isCorrect) {
      await _addToWrongItems(question, state.selectedOption!, 'reading');
    } else {
      await _markWrongItemResolved(question.id, 'reading');
    }

    state = state.copyWith(answered: true, isCorrect: isCorrect);
  }

  Future<void> _addToWrongItems(
      ReadingQuestionData question, String userAnswer, String itemType) async {
    final now = DateTime.now();
    final existing = await _db.getUnresolvedWrongItems(itemType);
    final alreadyExists = existing.any((item) => item.itemId == question.id);
    if (alreadyExists) return;

    final newWrong = WrongItemsCompanion(
      id: drift.Value(question.id),
      itemId: drift.Value(question.id),
      itemType: drift.Value(itemType),
      unitId: drift.Value(''),
      errorReason: drift.Value(userAnswer),
      addedTime: drift.Value(now),
      isResolved: drift.Value(false),
      resolvedTime: drift.Value.absent(),
    );

    await _db.addWrongItem(newWrong);
  }

  Future<void> _markWrongItemResolved(String itemId, String itemType) async {
    final wrongItems = await _db.getUnresolvedWrongItems(itemType);
    final matched = wrongItems.where((w) => w.itemId == itemId);
    for (final item in matched) {
      final resolvedCompanion = WrongItemsCompanion(
        id: drift.Value(item.id),
        itemId: drift.Value(item.itemId),
        itemType: drift.Value(item.itemType),
        unitId: drift.Value(item.unitId),
        errorReason: drift.Value(item.errorReason),
        addedTime: drift.Value(item.addedTime),
        isResolved: drift.Value(true),
        resolvedTime: drift.Value(DateTime.now()),
      );
      await _db.addWrongItem(resolvedCompanion);
    }
  }

  Future<void> toggleCollect() async {
    if (state.questions.isEmpty) return;
    final question = state.questions[state.currentIndex];
    final currentlyCollected = state.isCollected;

    if (currentlyCollected) {
      await _markWrongItemResolved(question.id, 'reading');
      state = state.copyWith(isCollected: false);
    } else {
      await _addToWrongItems(question, '', 'reading');
      state = state.copyWith(isCollected: true);
    }
  }

  void nextQuestion() async {
    if (state.currentIndex < state.questions.length - 1) {
      final nextIndex = state.currentIndex + 1;
      final question = state.questions[nextIndex];
      final collected = await _checkIfCollected(question);
      state = ReadingPracticeState(
        questions: state.questions,
        currentIndex: nextIndex,
        isCollected: collected,
      );
    }
  }

  void reset() {
    state = ReadingPracticeState(questions: []);
  }
}

// Provider暴露状态给UI
final readingPracticeProvider =
    StateNotifierProvider.autoDispose<ReadingPracticeNotifier, ReadingPracticeState>(
        (ref) {
  final service = ref.watch(readingServiceProvider);
  final engine = ref.watch(practiceEngineProvider);
  final db = ref.watch(appDatabaseProvider);
  return ReadingPracticeNotifier(service, engine, db);
});

// 练习统计页面传入文章ID展示统计信息
class ReadingPracticeResultPage extends ConsumerWidget {
  final String passageId;
  final String passageTitle;

  const ReadingPracticeResultPage({
    Key? key,
    required this.passageId,
    required this.passageTitle,
  }) : super(key: key);

  Future<List<PracticeRecord>> _loadPracticeRecords(
      AppDatabase db, String itemType, String passageId) async {
    final allRecords = await db.getRecentRecords(itemType, limit: 1000);
    return allRecords.where((r) {
      return r.itemType == itemType;
    }).toList();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.watch(appDatabaseProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('练习结果 - $passageTitle'),
      ),
      body: FutureBuilder<List<PracticeRecord>>(
        future: _loadPracticeRecords(db, 'reading', passageId),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final records = snapshot.data!;
          if (records.isEmpty) {
            return const Center(child: Text('暂无练习记录'));
          }

          final total = records.length;
          final correct = records.where((r) => r.isCorrect).length;
          final accuracy = (correct / total * 100).toStringAsFixed(1);

          return Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('总答题数: $total', style: TextStyle(fontSize: 18.sp)),
                SizedBox(height: 8.h),
                Text('正确数: $correct', style: TextStyle(fontSize: 18.sp)),
                SizedBox(height: 8.h),
                Text('正确率: $accuracy %', style: TextStyle(fontSize: 18.sp)),
                SizedBox(height: 16.h),
                Expanded(
                  child: ListView.builder(
                    itemCount: records.length,
                    itemBuilder: (context, index) {
                      final r = records[index];
                      return ListTile(
                        title: Text('题目ID: ${r.itemId}'),
                        subtitle: Text(
                            '答案: ${r.userAnswer ?? "无"}，${r.isCorrect ? "正确" : "错误"}'),
                        trailing:
                            Text('${r.practiceTime.toLocal().toString().split(".")[0]}'),
                      );
                    },
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

// 阅读练习页面
class ReadingPracticePage extends ConsumerStatefulWidget {
  final String passageId;
  final String passageTitle;

  const ReadingPracticePage(
      {Key? key, required this.passageId, required this.passageTitle})
      : super(key: key);

  @override
  ConsumerState<ReadingPracticePage> createState() =>
      _ReadingPracticePageState();
}

class _ReadingPracticePageState extends ConsumerState<ReadingPracticePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(readingPracticeProvider.notifier).loadQuestions(widget.passageId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(readingPracticeProvider);
    final notifier = ref.read(readingPracticeProvider.notifier);

    if (state.questions.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Text('阅读练习 - ${widget.passageTitle}'),
        ),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    final question = state.questions[state.currentIndex];
    final options = (jsonDecode(question.options) as List<dynamic>).cast<String>();
    final isLast = state.currentIndex == state.questions.length - 1;

    return Scaffold(
      appBar: AppBar(
        title: Text('阅读练习 - ${widget.passageTitle}'),
        actions: [
          IconButton(
            icon: Icon(
              state.isCollected ? Icons.bookmark : Icons.bookmark_border,
              color: state.isCollected ? Colors.amber : Colors.white,
            ),
            onPressed: () async {
              await notifier.toggleCollect();
            },
            tooltip: state.isCollected ? '取消收藏错题' : '收藏为错题',
          ),
          IconButton(
            icon: const Icon(Icons.assessment),
            tooltip: '查看练习结果',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => ReadingPracticeResultPage(
                        passageId: widget.passageId,
                        passageTitle: widget.passageTitle)),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '题目 ${state.currentIndex + 1} / ${state.questions.length}',
              style: TextStyle(fontSize: 16.sp, color: Colors.grey[600]),
            ),
            SizedBox(height: 16.h),
            Text(
              question.question,
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 24.h),
            ...options.asMap().entries.map((entry) {
              final idx = entry.key;
              final opt = entry.value;
              final optLabel = String.fromCharCode(65 + idx);
              final isSelected = opt == state.selectedOption;

              Color? bgColor;
              IconData? trailingIcon;

              if (state.answered) {
                if (opt == question.answer) {
                  bgColor = Colors.green[100];
                  trailingIcon = Icons.check_circle;
                } else if (isSelected && opt != question.answer) {
                  bgColor = Colors.red[100];
                  trailingIcon = Icons.cancel;
                }
              } else {
                bgColor = isSelected ? Colors.blue[100] : null;
              }

              return Container(
                margin: EdgeInsets.only(bottom: 12.h),
                decoration: BoxDecoration(
                  color: bgColor,
                  border: Border.all(
                    color: isSelected ? Colors.blue : Colors.grey[300]!,
                    width: isSelected ? 2 : 1,
                  ),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: isSelected ? Colors.blue : Colors.grey[300],
                    child: Text(
                      optLabel,
                      style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black87,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  title: Text(opt),
                  trailing: trailingIcon != null
                      ? Icon(trailingIcon,
                          color: opt == question.answer ? Colors.green : Colors.red)
                      : null,
                  onTap:
                      state.answered ? null : () => notifier.selectOption(opt),
                ),
              );
            }).toList(),
            const Spacer(),
            if (state.answered && question.explanation != null)
              Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          state.isCorrect ? Icons.check_circle : Icons.cancel,
                          color: state.isCorrect ? Colors.green : Colors.red,
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          state.isCorrect ? '回答正确！' : '回答错误',
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: state.isCorrect ? Colors.green : Colors.red),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      '解析：${question.explanation}',
                      style: TextStyle(fontSize: 14.sp, color: Colors.black87),
                    ),
                  ],
                ),
              ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: !state.answered && state.selectedOption != null
                        ? () => notifier.submitAnswer()
                        : null,
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 14.h),
                    ),
                    child: const Text('提交答案'),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: ElevatedButton(
                    onPressed: state.answered && !isLast ? () => notifier.nextQuestion() : null,
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 14.h),
                    ),
                    child: const Text('下一题'),
                  ),
                ),
              ],
            ),
            if (state.answered && isLast)
              Padding(
                padding: EdgeInsets.only(top: 16.h),
                child: Center(
                  child: ElevatedButton.icon(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.check),
                    label: const Text('完成练习'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 14.h),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
