import 'package:equatable/equatable.dart';
import 'enums.dart';

// 单元模型
class Unit extends Equatable {
  final String id;
  final Subject subject;
  final Grade grade;
  final TextbookType textbookType;
  final int bookNumber;      // 第几册
  final int unitNumber;      // 第几单元
  final String title;        // 单元标题
  final String? description; // 单元描述

  const Unit({
    required this.id,
    required this.subject,
    required this.grade,
    required this.textbookType,
    required this.bookNumber,
    required this.unitNumber,
    required this.title,
    this.description,
  });

  String get displayName => '第$unitNumber单元 $title';
  String get bookName => '${textbookType.label}第${bookNumber}册';

  @override
  List<Object?> get props => [id, subject, grade, textbookType, bookNumber, unitNumber];

  factory Unit.fromJson(Map<String, dynamic> json) {
    return Unit(
      id: json['id'] as String,
      subject: Subject.values.firstWhere((e) => e.name == json['subject']),
      grade: Grade.values.firstWhere((e) => e.name == json['grade']),
      textbookType: TextbookType.values.firstWhere((e) => e.name == json['textbookType']),
      bookNumber: json['bookNumber'] as int,
      unitNumber: json['unitNumber'] as int,
      title: json['title'] as String,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'subject': subject.name,
    'grade': grade.name,
    'textbookType': textbookType.name,
    'bookNumber': bookNumber,
    'unitNumber': unitNumber,
    'title': title,
    'description': description,
  };
}
