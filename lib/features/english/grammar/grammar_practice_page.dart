import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/database/database.dart';
import '../../../core/practice/grammar_question_service.dart';
import '../../../core/practice/practice_engine.dart';

// Provider初始化数据库和服务
final grammarServiceProvider = Provider<GrammarQuestionService>((ref) {
  final db = AppDatabase.instance;
  return GrammarQuestionService(db);
});

final practiceEngineProvider2 = Provider<PracticeEngine>((ref) {
  final db = AppDatabase.instance;
  return PracticeEngine(db);
});

// 练习页面状态
class GrammarPracticeState {
  final List<GrammarQuestionData> questions;
  final int currentIndex;
  final String? selectedOption;
  final bool answered;
  final bool isCorrect;

  GrammarPracticeState({
    required this.questions,
    this.currentIndex = 0,
    this.selectedOption,
    this.answered = false,
    this.isCorrect = false,
  });

  GrammarPracticeState copyWith({
    List<GrammarQuestionData>? questions,
    int? currentIndex,
    String? selectedOption,
    bool? answered,
    bool? isCorrect,
  }) {
    return GrammarPracticeState(
      questions: questions ?? this.questions,
      currentIndex: currentIndex ?? this.currentIndex,
      selectedOption: selectedOption,
      answered: answered ?? this.answered,
      isCorrect: isCorrect ?? this.isCorrect,
    );
  }
}

// StateNotifier管理练习状态和操作
class GrammarPracticeNotifier extends StateNotifier<GrammarPracticeState> {
  final GrammarQuestionService _service;
  final PracticeEngine _engine;

  GrammarPracticeNotifier(this._service, this._engine)
      : super(GrammarPracticeState(questions: []));

  Future<void> loadQuestions(String topic) async {
    final questions = await _service.getQuestionsByTopic(topic);
    state = GrammarPracticeState(questions: questions);
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

    // 记录练习结果到刻意练习引擎
    await _engine.recordPractice(
      itemId: question.id,
      itemType: 'grammar',
      isCorrect: isCorrect,
      userAnswer: state.selectedOption,
    );

    state = state.copyWith(answered: true, isCorrect: isCorrect);
  }

  void nextQuestion() {
    if (state.currentIndex < state.questions.length - 1) {
      state = GrammarPracticeState(
        questions: state.questions,
        currentIndex: state.currentIndex + 1,
      );
    }
  }

  void reset() {
    state = GrammarPracticeState(questions: []);
  }
}

// Provider暴露给UI使用
final grammarPracticeProvider = StateNotifierProvider.autoDispose<GrammarPracticeNotifier, GrammarPracticeState>((ref) {
  final service = ref.watch(grammarServiceProvider);
  final engine = ref.watch(practiceEngineProvider2);
  return GrammarPracticeNotifier(service, engine);
});

// 练习界面
class GrammarPracticePage extends ConsumerStatefulWidget {
  final String topic;

  const GrammarPracticePage({Key? key, required this.topic}) : super(key: key);

  @override
  ConsumerState<GrammarPracticePage> createState() => _GrammarPracticePageState();
}

class _GrammarPracticePageState extends ConsumerState<GrammarPracticePage> {
  @override
  void initState() {
    super.initState();
    // 页面加载时获取题目
    Future.microtask(() {
      ref.read(grammarPracticeProvider.notifier).loadQuestions(widget.topic);
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(grammarPracticeProvider);
    final notifier = ref.read(grammarPracticeProvider.notifier);

    // 加载中状态
    if (state.questions.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Text('语法练习 - ${widget.topic}'),
        ),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    final question = state.questions[state.currentIndex];
    final options = (jsonDecode(question.options) as List<dynamic>).cast<String>();
    final isLastQuestion = state.currentIndex >= state.questions.length - 1;

    return Scaffold(
      appBar: AppBar(
        title: Text('语法练习 - ${widget.topic}'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 进度指示
            Text(
              '题目 ${state.currentIndex + 1}/${state.questions.length}',
              style: TextStyle(fontSize: 16.sp, color: Colors.grey[600]),
            ),
            SizedBox(height: 16.h),

            // 题干
            Text(
              question.question,
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 24.h),

            // 选项列表
            ...options.asMap().entries.map((entry) {
              final index = entry.key;
              final opt = entry.value;
              final optionLabel = String.fromCharCode(65 + index); // A, B, C, D
              final isSelected = opt == state.selectedOption;

              Color? optionColor;
              IconData? trailingIcon;

              if (state.answered) {
                if (opt == question.answer) {
                  optionColor = Colors.green[100];
                  trailingIcon = Icons.check_circle;
                } else if (isSelected && opt != question.answer) {
                  optionColor = Colors.red[100];
                  trailingIcon = Icons.cancel;
                }
              } else {
                optionColor = isSelected ? Colors.blue[100] : null;
              }

              return Container(
                margin: EdgeInsets.only(bottom: 12.h),
                decoration: BoxDecoration(
                  color: optionColor,
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
                      optionLabel,
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  title: Text(opt),
                  trailing: trailingIcon != null
                      ? Icon(
                          trailingIcon,
                          color: opt == question.answer ? Colors.green : Colors.red,
                        )
                      : null,
                  onTap: state.answered ? null : () => notifier.selectOption(opt),
                ),
              );
            }).toList(),

            const Spacer(),

            // 答案解析展示
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
                            color: state.isCorrect ? Colors.green : Colors.red,
                          ),
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

            // 操作按钮
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
                    onPressed: state.answered && !isLastQuestion
                        ? () => notifier.nextQuestion()
                        : null,
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 14.h),
                    ),
                    child: const Text('下一题'),
                  ),
                ),
              ],
            ),

            // 完成提示
            if (state.answered && isLastQuestion)
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
