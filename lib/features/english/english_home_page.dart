import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../app/theme.dart';
import '../../app/routes.dart';
import '../../core/models/enums.dart';

class EnglishHomePage extends StatelessWidget {
  const EnglishHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('英语学习'),
        backgroundColor: AppTheme.englishColor.withOpacity(0.1),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildModuleCards(context),
            SizedBox(height: 24.h),
            _buildUnitSelector(context),
          ],
        ),
      ),
    );
  }

  Widget _buildModuleCards(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '学习模块',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            Expanded(
              child: _ModuleCard(
                title: '单词精通',
                subtitle: '认识·拼写·语境',
                icon: Icons.abc,
                color: Colors.blue,
                onTap: () => Navigator.pushNamed(
                  context,
                  AppRoutes.vocabulary,
                ),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: _ModuleCard(
                title: '语法攻克',
                subtitle: '15大专题',
                icon: Icons.rule,
                color: Colors.purple,
                onTap: () => Navigator.pushNamed(context, AppRoutes.grammar),
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        _ModuleCard(
          title: '阅读理解',
          subtitle: '细节·推理·主旨·词义·七选五',
          icon: Icons.article,
          color: Colors.teal,
          onTap: () {
            // TODO: 阅读理解页面
          },
          fullWidth: true,
        ),
      ],
    );
  }

  Widget _buildUnitSelector(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '按单元学习',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 12.h),
        _GradeExpansionList(),
      ],
    );
  }
}

class _ModuleCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;
  final bool fullWidth;

  const _ModuleCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.onTap,
    this.fullWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: fullWidth ? 80.h : 100.h,
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        padding: EdgeInsets.all(12.w),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Icon(icon, color: color, size: 24.sp),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: color,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.chevron_right, color: color),
          ],
        ),
      ),
    );
  }
}

class _GradeExpansionList extends StatelessWidget {
  // 英语教材单元数据
  final List<_GradeData> grades = [
    _GradeData(
      grade: Grade.grade1Upper,
      books: [_BookData('必修第一册', 5)],
    ),
    _GradeData(
      grade: Grade.grade1Lower,
      books: [_BookData('必修第二册', 5)],
    ),
    _GradeData(
      grade: Grade.grade2Upper,
      books: [
        _BookData('必修第三册', 5),
        _BookData('选择性必修第一册', 4),
      ],
    ),
    _GradeData(
      grade: Grade.grade2Lower,
      books: [_BookData('选择性必修第二册', 4)],
    ),
    _GradeData(
      grade: Grade.grade3Upper,
      books: [_BookData('选择性必修第三册', 4)],
    ),
    _GradeData(
      grade: Grade.grade3Lower,
      books: [_BookData('选择性必修第四册', 4)],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: grades.map((gradeData) {
        return Card(
          margin: EdgeInsets.only(bottom: 8.h),
          child: ExpansionTile(
            title: Text(
              gradeData.grade.label,
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            children: gradeData.books.expand((book) {
              return List.generate(book.unitCount, (index) {
                final unitNum = index + 1;
                return ListTile(
                  title: Text('${book.name} - 第$unitNum单元'),
                  trailing: const Icon(Icons.chevron_right, size: 20),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.vocabulary,
                      arguments: {
                        'unitId': '${gradeData.grade.name}_${book.name}_$unitNum',
                      },
                    );
                  },
                );
              });
            }).toList(),
          ),
        );
      }).toList(),
    );
  }
}

class _GradeData {
  final Grade grade;
  final List<_BookData> books;

  _GradeData({required this.grade, required this.books});
}

class _BookData {
  final String name;
  final int unitCount;

  _BookData(this.name, this.unitCount);
}
