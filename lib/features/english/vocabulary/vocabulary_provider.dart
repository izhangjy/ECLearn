import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/models/word.dart';
import '../../../core/database/database.dart' hide Word;
import '../../../core/practice/practice_engine.dart';

// 单词学习状态
class WordMasteryState {
  final String status;
  final int correctStreak;

  const WordMasteryState({
    this.status = 'notStarted',
    this.correctStreak = 0,
  });
}

// 单词+掌握状态
class WordWithState {
  final Word word;
  final WordMasteryState state;

  const WordWithState({required this.word, required this.state});
}

// 单元进度
class UnitProgress {
  final int total;
  final int mastered;
  final int learning;

  const UnitProgress({
    required this.total,
    required this.mastered,
    required this.learning,
  });

  double get masteryRate => total > 0 ? mastered / total : 0;
}

// 数据库Provider
final databaseProvider = Provider<AppDatabase>((ref) {
  return AppDatabase.instance;
});

// 练习引擎Provider
final practiceEngineProvider = Provider<PracticeEngine>((ref) {
  final db = ref.watch(databaseProvider);
  return PracticeEngine(db);
});

// 单元单词列表Provider
final unitWordsProvider = FutureProvider.family<List<WordWithState>, String>((ref, unitId) async {
  // 加载单词数据（从JSON资源文件）
  final words = await _loadWordsFromAssets(unitId);

  // 获取每个单词的掌握状态
  final db = ref.watch(databaseProvider);
  final result = <WordWithState>[];

  for (final word in words) {
    final state = await db.getMasteryState(word.id, 'word');
    result.add(WordWithState(
      word: word,
      state: WordMasteryState(
        status: state?.status ?? 'notStarted',
        correctStreak: state?.correctStreak ?? 0,
      ),
    ));
  }

  return result;
});

// 单元进度Provider
final unitProgressProvider = Provider.family<UnitProgress, String>((ref, unitId) {
  final wordsAsync = ref.watch(unitWordsProvider(unitId));

  return wordsAsync.when(
    data: (words) {
      int mastered = 0;
      int learning = 0;

      for (final w in words) {
        if (w.state.status == 'mastered') {
          mastered++;
        } else if (w.state.status == 'learning') {
          learning++;
        }
      }

      return UnitProgress(
        total: words.length,
        mastered: mastered,
        learning: learning,
      );
    },
    loading: () => const UnitProgress(total: 0, mastered: 0, learning: 0),
    error: (_, __) => const UnitProgress(total: 0, mastered: 0, learning: 0),
  );
});

// 当前学习会话状态
class LearnSessionState {
  final List<Word> words;
  final int currentIndex;
  final int correctCount;
  final int totalAnswered;
  final bool isComplete;

  const LearnSessionState({
    this.words = const [],
    this.currentIndex = 0,
    this.correctCount = 0,
    this.totalAnswered = 0,
    this.isComplete = false,
  });

  Word? get currentWord => currentIndex < words.length ? words[currentIndex] : null;
  double get accuracy => totalAnswered > 0 ? correctCount / totalAnswered : 0;

  LearnSessionState copyWith({
    List<Word>? words,
    int? currentIndex,
    int? correctCount,
    int? totalAnswered,
    bool? isComplete,
  }) {
    return LearnSessionState(
      words: words ?? this.words,
      currentIndex: currentIndex ?? this.currentIndex,
      correctCount: correctCount ?? this.correctCount,
      totalAnswered: totalAnswered ?? this.totalAnswered,
      isComplete: isComplete ?? this.isComplete,
    );
  }
}

// 学习会话Notifier
class LearnSessionNotifier extends StateNotifier<LearnSessionState> {
  final PracticeEngine _engine;

  LearnSessionNotifier(this._engine) : super(const LearnSessionState());

  void startSession(List<Word> words) {
    // 打乱顺序
    final shuffled = List<Word>.from(words)..shuffle();
    state = LearnSessionState(words: shuffled);
  }

  Future<void> answerQuestion(bool isCorrect) async {
    final currentWord = state.currentWord;
    if (currentWord == null) return;

    // 记录练习结果
    await _engine.recordPractice(
      itemId: currentWord.id,
      itemType: 'word',
      isCorrect: isCorrect,
    );

    // 更新状态
    final newIndex = state.currentIndex + 1;
    final isComplete = newIndex >= state.words.length;

    state = state.copyWith(
      currentIndex: newIndex,
      correctCount: state.correctCount + (isCorrect ? 1 : 0),
      totalAnswered: state.totalAnswered + 1,
      isComplete: isComplete,
    );
  }

  void reset() {
    state = const LearnSessionState();
  }
}

final learnSessionProvider = StateNotifierProvider<LearnSessionNotifier, LearnSessionState>((ref) {
  final engine = ref.watch(practiceEngineProvider);
  return LearnSessionNotifier(engine);
});

// 从资源文件加载单词
Future<List<Word>> _loadWordsFromAssets(String unitId) async {
  try {
    final jsonString = await rootBundle.loadString('assets/data/words_$unitId.json');
    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((e) => Word.fromJson(e as Map<String, dynamic>)).toList();
  } catch (e) {
    // 如果文件不存在，返回示例数据
    return _getSampleWords(unitId);
  }
}

// 示例单词数据（用于开发测试）
List<Word> _getSampleWords(String unitId) {
  return [
    const Word(
      id: 'w001',
      word: 'abandon',
      phonetic: '/əˈbændən/',
      meanings: [
        WordMeaning(pos: 'vt.', definition: '放弃；遗弃'),
        WordMeaning(pos: 'n.', definition: '放任；放纵'),
      ],
      example: 'He abandoned his wife and children.',
      exampleCn: '他抛弃了妻子和孩子。',
      unitId: 'B1U1',
      frequency: '高频',
    ),
    const Word(
      id: 'w002',
      word: 'abstract',
      phonetic: '/ˈæbstrækt/',
      meanings: [
        WordMeaning(pos: 'adj.', definition: '抽象的'),
        WordMeaning(pos: 'n.', definition: '摘要'),
      ],
      example: 'The concept is too abstract for children.',
      exampleCn: '这个概念对孩子来说太抽象了。',
      unitId: 'B1U1',
      frequency: '中频',
    ),
    const Word(
      id: 'w003',
      word: 'academic',
      phonetic: '/ˌækəˈdemɪk/',
      meanings: [
        WordMeaning(pos: 'adj.', definition: '学术的；学业的'),
        WordMeaning(pos: 'n.', definition: '大学教师'),
      ],
      example: 'She has a brilliant academic record.',
      exampleCn: '她有出色的学业成绩。',
      unitId: 'B1U1',
      frequency: '高频',
    ),
    const Word(
      id: 'w004',
      word: 'access',
      phonetic: '/ˈækses/',
      meanings: [
        WordMeaning(pos: 'n.', definition: '通道；使用权'),
        WordMeaning(pos: 'vt.', definition: '访问；存取'),
      ],
      example: 'Students have access to the library.',
      exampleCn: '学生可以使用图书馆。',
      unitId: 'B1U1',
      frequency: '高频',
    ),
    const Word(
      id: 'w005',
      word: 'accommodate',
      phonetic: '/əˈkɒmədeɪt/',
      meanings: [
        WordMeaning(pos: 'vt.', definition: '容纳；提供住宿'),
        WordMeaning(pos: 'vt.', definition: '适应；迁就'),
      ],
      example: 'The hotel can accommodate 500 guests.',
      exampleCn: '这家酒店可以容纳500位客人。',
      unitId: 'B1U1',
      frequency: '中频',
    ),
    const Word(
      id: 'w006',
      word: 'accompany',
      phonetic: '/əˈkʌmpəni/',
      meanings: [
        WordMeaning(pos: 'vt.', definition: '陪伴；伴随'),
        WordMeaning(pos: 'vt.', definition: '为...伴奏'),
      ],
      example: 'She accompanied her friend to the hospital.',
      exampleCn: '她陪朋友去了医院。',
      unitId: 'B1U1',
      frequency: '高频',
    ),
    const Word(
      id: 'w007',
      word: 'accomplish',
      phonetic: '/əˈkʌmplɪʃ/',
      meanings: [
        WordMeaning(pos: 'vt.', definition: '完成；实现'),
      ],
      example: 'We accomplished our goal ahead of schedule.',
      exampleCn: '我们提前完成了目标。',
      unitId: 'B1U1',
      frequency: '高频',
    ),
    const Word(
      id: 'w008',
      word: 'accurate',
      phonetic: '/ˈækjərət/',
      meanings: [
        WordMeaning(pos: 'adj.', definition: '准确的；精确的'),
      ],
      example: 'The report is accurate and detailed.',
      exampleCn: '这份报告准确而详细。',
      unitId: 'B1U1',
      frequency: '高频',
    ),
    const Word(
      id: 'w009',
      word: 'achieve',
      phonetic: '/əˈtʃiːv/',
      meanings: [
        WordMeaning(pos: 'vt.', definition: '达到；取得'),
      ],
      example: 'She achieved her ambition to become a doctor.',
      exampleCn: '她实现了成为医生的抱负。',
      unitId: 'B1U1',
      frequency: '高频',
    ),
    const Word(
      id: 'w010',
      word: 'acknowledge',
      phonetic: '/əkˈnɒlɪdʒ/',
      meanings: [
        WordMeaning(pos: 'vt.', definition: '承认；确认'),
        WordMeaning(pos: 'vt.', definition: '感谢'),
      ],
      example: 'He acknowledged his mistake.',
      exampleCn: '他承认了自己的错误。',
      unitId: 'B1U1',
      frequency: '中频',
    ),
  ];
}
