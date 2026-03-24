import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../app/routes.dart';
import '../../../app/theme.dart';
import '../../../core/models/word.dart';
import 'vocabulary_provider.dart';

class WordLearnPage extends ConsumerStatefulWidget {
  final String unitId;
  final LearnMode mode;

  const WordLearnPage({
    super.key,
    required this.unitId,
    required this.mode,
  });

  @override
  ConsumerState<WordLearnPage> createState() => _WordLearnPageState();
}

class _WordLearnPageState extends ConsumerState<WordLearnPage> {
  bool _showAnswer = false;
  String? _selectedOption;

  @override
  void initState() {
    super.initState();
    // 初始化学习会话
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initSession();
    });
  }

  Future<void> _initSession() async {
    final wordsAsync = await ref.read(unitWordsProvider(widget.unitId).future);
    final words = wordsAsync.map((w) => w.word).toList();
    ref.read(learnSessionProvider.notifier).startSession(words);
  }

  @override
  Widget build(BuildContext context) {
    final session = ref.watch(learnSessionProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(_getModeTitle()),
        backgroundColor: AppTheme.englishColor.withOpacity(0.1),
        actions: [
          Center(
            child: Padding(
              padding: EdgeInsets.only(right: 16.w),
              child: Text(
                '${session.currentIndex + 1}/${session.words.length}',
                style: TextStyle(fontSize: 14.sp),
              ),
            ),
          ),
        ],
      ),
      body: session.isComplete
          ? _buildCompleteView(session)
          : session.currentWord != null
              ? _buildQuestionView(session.currentWord!)
              : const Center(child: CircularProgressIndicator()),
    );
  }

  String _getModeTitle() {
    switch (widget.mode) {
      case LearnMode.recognize:
        return '认识模式';
      case LearnMode.spell:
        return '拼写模式';
      case LearnMode.context:
        return '语境模式';
    }
  }

  Widget _buildQuestionView(Word word) {
    switch (widget.mode) {
      case LearnMode.recognize:
        return _buildRecognizeMode(word);
      case LearnMode.spell:
        return _buildSpellMode(word);
      case LearnMode.context:
        return _buildContextMode(word);
    }
  }

  // 认识模式：看词选义
  Widget _buildRecognizeMode(Word word) {
    final options = _generateMeaningOptions(word);

    return Padding(
      padding: EdgeInsets.all(20.w),
      child: Column(
        children: [
          SizedBox(height: 40.h),
          // 单词卡片
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(24.w),
            decoration: BoxDecoration(
              color: AppTheme.englishColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Column(
              children: [
                Text(
                  word.word,
                  style: TextStyle(
                    fontSize: 32.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  word.phonetic,
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.grey[600],
                  ),
                ),
                if (_showAnswer && word.example != null) ...[
                  SizedBox(height: 16.h),
                  Text(
                    word.example!,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.grey[700],
                      fontStyle: FontStyle.italic,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ],
            ),
          ),
          SizedBox(height: 32.h),
          // 选项
          Text(
            '请选择正确的释义：',
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.grey[700],
            ),
          ),
          SizedBox(height: 16.h),
          ...options.map((option) => _buildOptionButton(
            option,
            word.primaryMeaning,
          )),
        ],
      ),
    );
  }

  Widget _buildOptionButton(String option, String correctAnswer) {
    final isSelected = _selectedOption == option;
    final isCorrect = option == correctAnswer;
    final showResult = _showAnswer;

    Color bgColor = Colors.grey[100]!;
    Color borderColor = Colors.grey[300]!;
    Color textColor = Colors.black87;

    if (showResult) {
      if (isCorrect) {
        bgColor = AppTheme.successColor.withOpacity(0.1);
        borderColor = AppTheme.successColor;
        textColor = AppTheme.successColor;
      } else if (isSelected && !isCorrect) {
        bgColor = AppTheme.errorColor.withOpacity(0.1);
        borderColor = AppTheme.errorColor;
        textColor = AppTheme.errorColor;
      }
    } else if (isSelected) {
      bgColor = AppTheme.englishColor.withOpacity(0.1);
      borderColor = AppTheme.englishColor;
    }

    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: GestureDetector(
        onTap: _showAnswer ? null : () => _selectOption(option, correctAnswer),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: borderColor),
          ),
          child: Text(
            option,
            style: TextStyle(
              fontSize: 15.sp,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }

  void _selectOption(String option, String correctAnswer) {
    setState(() {
      _selectedOption = option;
      _showAnswer = true;
    });

    final isCorrect = option == correctAnswer;

    // 延迟后进入下一题
    Future.delayed(const Duration(milliseconds: 1500), () {
      ref.read(learnSessionProvider.notifier).answerQuestion(isCorrect);
      setState(() {
        _showAnswer = false;
        _selectedOption = null;
      });
    });
  }

  List<String> _generateMeaningOptions(Word word) {
    // 生成干扰选项（实际应用中应从题库获取）
    final distractors = [
      'vt. 接受；承认',
      'adj. 积极的；活跃的',
      'n. 行动；活动',
      'vt. 增加；添加',
    ];

    final options = [word.primaryMeaning];
    distractors.shuffle();
    options.addAll(distractors.take(3));
    options.shuffle();

    return options;
  }

  // 拼写模式
  Widget _buildSpellMode(Word word) {
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: Column(
        children: [
          SizedBox(height: 40.h),
          Text(
            '请根据释义拼写单词：',
            style: TextStyle(fontSize: 16.sp, color: Colors.grey[700]),
          ),
          SizedBox(height: 24.h),
          Container(
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Text(
              word.allMeanings,
              style: TextStyle(fontSize: 18.sp),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 32.h),
          _SpellInput(
            correctWord: word.word,
            onComplete: (isCorrect) {
              ref.read(learnSessionProvider.notifier).answerQuestion(isCorrect);
            },
          ),
        ],
      ),
    );
  }

  // 语境模式
  Widget _buildContextMode(Word word) {
    final sentence = word.example ?? 'The word "${word.word}" is important.';
    final blankedSentence = sentence.replaceAll(
      RegExp(word.word, caseSensitive: false),
      '_____',
    );

    return Padding(
      padding: EdgeInsets.all(20.w),
      child: Column(
        children: [
          SizedBox(height: 40.h),
          Text(
            '请选择填入空白处的单词：',
            style: TextStyle(fontSize: 16.sp, color: Colors.grey[700]),
          ),
          SizedBox(height: 24.h),
          Container(
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Text(
              blankedSentence,
              style: TextStyle(fontSize: 16.sp, height: 1.5),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 32.h),
          ..._generateWordOptions(word).map((option) => _buildOptionButton(
            option,
            word.word,
          )),
        ],
      ),
    );
  }

  List<String> _generateWordOptions(Word word) {
    final distractors = ['accept', 'active', 'action', 'add'];
    final options = [word.word];
    distractors.shuffle();
    options.addAll(distractors.take(3));
    options.shuffle();
    return options;
  }

  // 完成页面
  Widget _buildCompleteView(LearnSessionState session) {
    final accuracy = (session.accuracy * 100).toInt();

    return Center(
      child: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              accuracy >= 80 ? Icons.celebration : Icons.emoji_events,
              size: 80.sp,
              color: accuracy >= 80 ? AppTheme.successColor : AppTheme.warningColor,
            ),
            SizedBox(height: 24.h),
            Text(
              '学习完成！',
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              '正确率：$accuracy%',
              style: TextStyle(
                fontSize: 18.sp,
                color: Colors.grey[700],
              ),
            ),
            Text(
              '${session.correctCount}/${session.totalAnswered}',
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.grey[500],
              ),
            ),
            SizedBox(height: 40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: () {
                    ref.read(learnSessionProvider.notifier).reset();
                    _initSession();
                  },
                  child: const Text('再练一次'),
                ),
                SizedBox(width: 16.w),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('返回'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// 拼写输入组件
class _SpellInput extends StatefulWidget {
  final String correctWord;
  final Function(bool) onComplete;

  const _SpellInput({
    required this.correctWord,
    required this.onComplete,
  });

  @override
  State<_SpellInput> createState() => _SpellInputState();
}

class _SpellInputState extends State<_SpellInput> {
  final _controller = TextEditingController();
  bool? _isCorrect;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _checkAnswer() {
    final input = _controller.text.trim().toLowerCase();
    final correct = widget.correctWord.toLowerCase();
    final isCorrect = input == correct;

    setState(() {
      _isCorrect = isCorrect;
    });

    Future.delayed(const Duration(milliseconds: 1500), () {
      widget.onComplete(isCorrect);
      _controller.clear();
      setState(() {
        _isCorrect = null;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _controller,
          enabled: _isCorrect == null,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20.sp),
          decoration: InputDecoration(
            hintText: '输入单词',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
            filled: true,
            fillColor: _isCorrect == null
                ? Colors.white
                : _isCorrect!
                    ? AppTheme.successColor.withOpacity(0.1)
                    : AppTheme.errorColor.withOpacity(0.1),
          ),
          onSubmitted: (_) => _checkAnswer(),
        ),
        SizedBox(height: 16.h),
        if (_isCorrect != null)
          Text(
            _isCorrect! ? '正确！' : '正确答案：${widget.correctWord}',
            style: TextStyle(
              fontSize: 16.sp,
              color: _isCorrect! ? AppTheme.successColor : AppTheme.errorColor,
            ),
          )
        else
          ElevatedButton(
            onPressed: _checkAnswer,
            child: const Text('确认'),
          ),
      ],
    );
  }
}
