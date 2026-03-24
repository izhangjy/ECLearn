import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';
import '../database/database.dart' hide MasteryState;
import '../models/practice_record.dart';
import 'spaced_repetition.dart';

// 刻意练习引擎 - 核心逻辑
class PracticeEngine {
  final AppDatabase _db;
  final SpacedRepetition _sr = SpacedRepetition();
  static const int masteryThreshold = 3; // 连续正确3次算掌握

  PracticeEngine(this._db);

  // 记录练习结果并更新掌握状态
  Future<MasteryState> recordPractice({
    required String itemId,
    required String itemType,
    required bool isCorrect,
    String? userAnswer,
    String? errorReason,
    int responseTimeMs = 0,
  }) async {
    final now = DateTime.now();
    final uuid = const Uuid();

    // 1. 保存练习记录
    await _db.insertPracticeRecord(PracticeRecordsCompanion.insert(
      id: uuid.v4(),
      itemId: itemId,
      itemType: itemType,
      isCorrect: isCorrect,
      practiceTime: now,
      responseTimeMs: Value(responseTimeMs),
      userAnswer: Value(userAnswer),
      errorReason: Value(errorReason),
    ));

    // 2. 获取当前掌握状态
    final currentState = await _db.getMasteryState(itemId, itemType);

    // 3. 计算新的掌握状态
    final newStreak = isCorrect ? (currentState?.correctStreak ?? 0) + 1 : 0;
    final newTotalAttempts = (currentState?.totalAttempts ?? 0) + 1;
    final newCorrectCount = (currentState?.correctCount ?? 0) + (isCorrect ? 1 : 0);

    // 4. 判断掌握状态
    MasteryStatus newStatus;
    if (newStreak >= masteryThreshold) {
      newStatus = MasteryStatus.mastered;
    } else if (newTotalAttempts > 0) {
      newStatus = MasteryStatus.learning;
    } else {
      newStatus = MasteryStatus.notStarted;
    }

    // 5. 计算下次复习时间（基于间隔重复算法）
    final nextReview = _sr.calculateNextReview(
      correctStreak: newStreak,
      isCorrect: isCorrect,
      lastPractice: now,
    );

    // 6. 更新掌握状态
    await _db.updateMasteryState(MasteryStatesCompanion.insert(
      itemId: itemId,
      itemType: itemType,
      status: Value(newStatus.name),
      correctStreak: Value(newStreak),
      totalAttempts: Value(newTotalAttempts),
      correctCount: Value(newCorrectCount),
      lastPractice: Value(now),
      nextReview: Value(nextReview),
    ));

    // 7. 如果答错，添加到错题本
    if (!isCorrect) {
      await _db.addWrongItem(WrongItemsCompanion.insert(
        id: uuid.v4(),
        itemId: itemId,
        itemType: itemType,
        unitId: '', // 需要从外部传入
        addedTime: now,
        errorReason: Value(errorReason),
      ));
    }

    return MasteryState(
      itemId: itemId,
      itemType: itemType,
      status: newStatus,
      correctStreak: newStreak,
      totalAttempts: newTotalAttempts,
      correctCount: newCorrectCount,
      lastPractice: now,
      nextReview: nextReview,
    );
  }

  // 获取需要复习的项目
  Future<List<String>> getItemsToReview(String itemType, {int limit = 20}) async {
    final now = DateTime.now();
    final states = await _db.customSelect(
      '''
      SELECT item_id FROM mastery_states
      WHERE item_type = ?
        AND status != 'mastered'
        AND (next_review IS NULL OR next_review <= ?)
      ORDER BY
        CASE WHEN next_review IS NULL THEN 0 ELSE 1 END,
        next_review ASC
      LIMIT ?
      ''',
      variables: [
        Variable.withString(itemType),
        Variable.withDateTime(now),
        Variable.withInt(limit),
      ],
    ).get();

    return states.map((row) => row.read<String>('item_id')).toList();
  }

  // 获取单元内未掌握的项目
  Future<List<String>> getUnmasteredItems(
    String itemType,
    List<String> itemIds,
  ) async {
    if (itemIds.isEmpty) return [];

    final placeholders = List.filled(itemIds.length, '?').join(',');
    final states = await _db.customSelect(
      '''
      SELECT item_id FROM mastery_states
      WHERE item_type = ?
        AND item_id IN ($placeholders)
        AND status != 'mastered'
      ''',
      variables: [
        Variable.withString(itemType),
        ...itemIds.map((id) => Variable.withString(id)),
      ],
    ).get();

    final masteredIds = states.map((row) => row.read<String>('item_id')).toSet();

    // 返回未在数据库中的（未学习）+ 未掌握的
    return itemIds.where((id) => !masteredIds.contains(id) ||
        states.any((s) => s.read<String>('item_id') == id)).toList();
  }

  // 获取学习进度统计
  Future<LearningProgress> getProgress(String itemType, List<String> itemIds) async {
    if (itemIds.isEmpty) {
      return const LearningProgress(total: 0, mastered: 0, learning: 0, notStarted: 0);
    }

    final placeholders = List.filled(itemIds.length, '?').join(',');
    final result = await _db.customSelect(
      '''
      SELECT
        status,
        COUNT(*) as count
      FROM mastery_states
      WHERE item_type = ? AND item_id IN ($placeholders)
      GROUP BY status
      ''',
      variables: [
        Variable.withString(itemType),
        ...itemIds.map((id) => Variable.withString(id)),
      ],
    ).get();

    int mastered = 0;
    int learning = 0;
    int reviewing = 0;

    for (final row in result) {
      final status = row.read<String>('status');
      final count = row.read<int>('count');
      switch (status) {
        case 'mastered':
          mastered = count;
          break;
        case 'learning':
          learning = count;
          break;
        case 'reviewing':
          reviewing = count;
          break;
      }
    }

    final tracked = mastered + learning + reviewing;
    final notStarted = itemIds.length - tracked;

    return LearningProgress(
      total: itemIds.length,
      mastered: mastered,
      learning: learning + reviewing,
      notStarted: notStarted,
    );
  }
}

// 学习进度
class LearningProgress {
  final int total;
  final int mastered;
  final int learning;
  final int notStarted;

  const LearningProgress({
    required this.total,
    required this.mastered,
    required this.learning,
    required this.notStarted,
  });

  double get masteryRate => total > 0 ? mastered / total : 0;
  double get progressRate => total > 0 ? (mastered + learning) / total : 0;
}
