import 'package:equatable/equatable.dart';

// 练习记录模型
class PracticeRecord extends Equatable {
  final String id;
  final String itemId;       // 练习项ID（单词ID、语法题ID等）
  final String itemType;     // 练习类型：word, grammar, reading 等
  final bool isCorrect;      // 是否正确
  final DateTime practiceTime; // 练习时间
  final int responseTimeMs;  // 响应时间（毫秒）
  final String? userAnswer;  // 用户答案
  final String? errorReason; // 错误原因

  const PracticeRecord({
    required this.id,
    required this.itemId,
    required this.itemType,
    required this.isCorrect,
    required this.practiceTime,
    this.responseTimeMs = 0,
    this.userAnswer,
    this.errorReason,
  });

  @override
  List<Object?> get props => [id, itemId, itemType, practiceTime];

  factory PracticeRecord.fromJson(Map<String, dynamic> json) {
    return PracticeRecord(
      id: json['id'] as String,
      itemId: json['itemId'] as String,
      itemType: json['itemType'] as String,
      isCorrect: json['isCorrect'] as bool,
      practiceTime: DateTime.parse(json['practiceTime'] as String),
      responseTimeMs: json['responseTimeMs'] as int? ?? 0,
      userAnswer: json['userAnswer'] as String?,
      errorReason: json['errorReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'itemId': itemId,
    'itemType': itemType,
    'isCorrect': isCorrect,
    'practiceTime': practiceTime.toIso8601String(),
    'responseTimeMs': responseTimeMs,
    'userAnswer': userAnswer,
    'errorReason': errorReason,
  };
}

// 掌握状态
enum MasteryStatus {
  notStarted('未学习', 0),
  learning('学习中', 1),
  reviewing('复习中', 2),
  mastered('已掌握', 3);

  final String label;
  final int level;
  const MasteryStatus(this.label, this.level);
}

// 掌握度追踪
class MasteryState extends Equatable {
  final String itemId;
  final String itemType;
  final MasteryStatus status;
  final int correctStreak;     // 连续正确次数
  final int totalAttempts;     // 总尝试次数
  final int correctCount;      // 正确次数
  final DateTime? lastPractice; // 上次练习时间
  final DateTime? nextReview;   // 下次复习时间

  const MasteryState({
    required this.itemId,
    required this.itemType,
    this.status = MasteryStatus.notStarted,
    this.correctStreak = 0,
    this.totalAttempts = 0,
    this.correctCount = 0,
    this.lastPractice,
    this.nextReview,
  });

  // 正确率
  double get accuracy => totalAttempts > 0 ? correctCount / totalAttempts : 0;

  // 是否已掌握（连续正确3次）
  bool get isMastered => correctStreak >= 3;

  @override
  List<Object?> get props => [itemId, itemType, status, correctStreak];

  MasteryState copyWith({
    MasteryStatus? status,
    int? correctStreak,
    int? totalAttempts,
    int? correctCount,
    DateTime? lastPractice,
    DateTime? nextReview,
  }) {
    return MasteryState(
      itemId: itemId,
      itemType: itemType,
      status: status ?? this.status,
      correctStreak: correctStreak ?? this.correctStreak,
      totalAttempts: totalAttempts ?? this.totalAttempts,
      correctCount: correctCount ?? this.correctCount,
      lastPractice: lastPractice ?? this.lastPractice,
      nextReview: nextReview ?? this.nextReview,
    );
  }
}
