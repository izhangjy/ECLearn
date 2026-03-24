import 'package:flutter/material.dart';

import '../features/home/home_page.dart';
import '../features/english/english_home_page.dart';
import '../features/english/vocabulary/vocabulary_page.dart';
import '../features/english/vocabulary/word_learn_page.dart';
import '../features/english/grammar/grammar_page.dart';
import '../features/chinese/chinese_home_page.dart';
import '../features/exam/exam_analysis_page.dart';
import '../features/stats/stats_page.dart';
import '../features/settings/settings_page.dart';

class AppRoutes {
  static const String home = '/';
  static const String englishHome = '/english';
  static const String vocabulary = '/english/vocabulary';
  static const String wordLearn = '/english/vocabulary/learn';
  static const String grammar = '/english/grammar';
  static const String chineseHome = '/chinese';
  static const String examAnalysis = '/exam';
  static const String stats = '/stats';
  static const String settings = '/settings';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case englishHome:
        return MaterialPageRoute(builder: (_) => const EnglishHomePage());
      case vocabulary:
        final args = settings.arguments as Map<String, dynamic>?;
        return MaterialPageRoute(
          builder: (_) => VocabularyPage(
            unitId: args?['unitId'],
          ),
        );
      case wordLearn:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => WordLearnPage(
            unitId: args['unitId'],
            mode: args['mode'] ?? LearnMode.recognize,
          ),
        );
      case grammar:
        return MaterialPageRoute(builder: (_) => const GrammarPage());
      case chineseHome:
        return MaterialPageRoute(builder: (_) => const ChineseHomePage());
      case examAnalysis:
        return MaterialPageRoute(builder: (_) => const ExamAnalysisPage());
      case stats:
        return MaterialPageRoute(builder: (_) => const StatsPage());
      case AppRoutes.settings:
        return MaterialPageRoute(builder: (_) => const SettingsPage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('页面不存在: ${settings.name}'),
            ),
          ),
        );
    }
  }
}

enum LearnMode {
  recognize, // 认识模式
  spell,     // 拼写模式
  context,   // 语境模式
}
