import 'package:flutter_test/flutter_test.dart';
import 'package:eclearn/core/practice/spaced_repetition.dart';

void main() {
  group('SpacedRepetition', () {
    late SpacedRepetition sr;

    setUp(() {
      sr = SpacedRepetition();
    });

    test('答错后应该1分钟后复习', () {
      final now = DateTime.now();
      final nextReview = sr.calculateNextReview(
        correctStreak: 0,
        isCorrect: false,
        lastPractice: now,
      );

      expect(nextReview.difference(now).inMinutes, equals(1));
    });

    test('第一次答对后应该1分钟后复习', () {
      final now = DateTime.now();
      final nextReview = sr.calculateNextReview(
        correctStreak: 1,
        isCorrect: true,
        lastPractice: now,
      );

      expect(nextReview.difference(now).inMinutes, equals(5));
    });

    test('连续3次正确后应该30分钟后复习', () {
      final now = DateTime.now();
      final nextReview = sr.calculateNextReview(
        correctStreak: 3,
        isCorrect: true,
        lastPractice: now,
      );

      expect(nextReview.difference(now).inMinutes, equals(720)); // 12小时
    });

    test('needsReview应该正确判断', () {
      expect(sr.needsReview(null), isTrue);
      expect(sr.needsReview(DateTime.now().subtract(const Duration(hours: 1))), isTrue);
      expect(sr.needsReview(DateTime.now().add(const Duration(hours: 1))), isFalse);
    });
  });
}
