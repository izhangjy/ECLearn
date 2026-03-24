import 'package:equatable/equatable.dart';

// 单词模型
class Word extends Equatable {
  final String id;
  final String word;           // 单词
  final String phonetic;       // 音标
  final List<WordMeaning> meanings; // 释义列表
  final String? example;       // 例句
  final String? exampleCn;     // 例句翻译
  final List<String> derivatives; // 派生词
  final String unitId;         // 所属单元ID
  final String frequency;      // 词频：高频/中频/低频

  const Word({
    required this.id,
    required this.word,
    required this.phonetic,
    required this.meanings,
    this.example,
    this.exampleCn,
    this.derivatives = const [],
    required this.unitId,
    this.frequency = '中频',
  });

  @override
  List<Object?> get props => [id, word, unitId];

  factory Word.fromJson(Map<String, dynamic> json) {
    return Word(
      id: json['id'] as String,
      word: json['word'] as String,
      phonetic: json['phonetic'] as String? ?? '',
      meanings: (json['meanings'] as List<dynamic>?)
          ?.map((e) => WordMeaning.fromJson(e as Map<String, dynamic>))
          .toList() ?? [],
      example: json['example'] as String?,
      exampleCn: json['exampleCn'] as String?,
      derivatives: (json['derivatives'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ?? [],
      unitId: json['unitId'] as String,
      frequency: json['frequency'] as String? ?? '中频',
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'word': word,
    'phonetic': phonetic,
    'meanings': meanings.map((e) => e.toJson()).toList(),
    'example': example,
    'exampleCn': exampleCn,
    'derivatives': derivatives,
    'unitId': unitId,
    'frequency': frequency,
  };

  // 获取主要释义（用于显示）
  String get primaryMeaning {
    if (meanings.isEmpty) return '';
    final m = meanings.first;
    return '${m.pos} ${m.definition}';
  }

  // 获取所有释义文本
  String get allMeanings {
    return meanings.map((m) => '${m.pos} ${m.definition}').join('；');
  }
}

// 单词释义
class WordMeaning extends Equatable {
  final String pos;        // 词性：n. v. adj. adv. 等
  final String definition; // 释义

  const WordMeaning({
    required this.pos,
    required this.definition,
  });

  @override
  List<Object?> get props => [pos, definition];

  factory WordMeaning.fromJson(Map<String, dynamic> json) {
    return WordMeaning(
      pos: json['pos'] as String,
      definition: json['def'] as String? ?? json['definition'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
    'pos': pos,
    'def': definition,
  };
}
