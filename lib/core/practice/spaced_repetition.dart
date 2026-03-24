// 间隔重复算法（基于艾宾浩斯遗忘曲线）
class SpacedRepetition {
  // 复习间隔（分钟）：1分钟, 5分钟, 30分钟, 12小时, 1天, 2天, 4天, 7天, 15天
  static const List<int> intervals = [
    1,        // 第1次正确后
    5,        // 第2次正确后
    30,       // 第3次正确后（已掌握）
    720,      // 12小时
    1440,     // 1天
    2880,     // 2天
    5760,     // 4天
    10080,    // 7天
    21600,    // 15天
  ];

  // 计算下次复习时间
  DateTime calculateNextReview({
    required int correctStreak,
    required bool isCorrect,
    required DateTime lastPractice,
  }) {
    if (!isCorrect) {
      // 答错了，1分钟后复习
      return lastPractice.add(const Duration(minutes: 1));
    }

    // 根据连续正确次数确定间隔
    final intervalIndex = correctStreak.clamp(0, intervals.length - 1);
    final intervalMinutes = intervals[intervalIndex];

    return lastPractice.add(Duration(minutes: intervalMinutes));
  }

  // 判断是否需要复习
  bool needsReview(DateTime? nextReview) {
    if (nextReview == null) return true;
    return DateTime.now().isAfter(nextReview);
  }

  // 计算遗忘概率（用于优先级排序）
  double calculateForgettingProbability({
    required DateTime lastPractice,
    required int correctStreak,
  }) {
    final hoursSinceLastPractice =
        DateTime.now().difference(lastPractice).inHours;

    // 简化的遗忘曲线公式
    // 连续正确次数越多，遗忘越慢
    final stabilityFactor = 1 + correctStreak * 0.5;
    final forgettingRate = 0.5 / stabilityFactor;

    return 1 - (1 / (1 + forgettingRate * hoursSinceLastPractice));
  }
}
