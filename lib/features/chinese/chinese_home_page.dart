import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../app/theme.dart';

class ChineseHomePage extends StatelessWidget {
  const ChineseHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('语文学习'),
        backgroundColor: AppTheme.chineseColor.withOpacity(0.1),
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
                title: '基础积累',
                subtitle: '字音·字形·成语·病句',
                icon: Icons.text_fields,
                color: Colors.orange,
                onTap: () {
                  // TODO: 基础积累页面
                },
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: _ModuleCard(
                title: '古诗文',
                subtitle: '背诵·文言·诗歌',
                icon: Icons.history_edu,
                color: Colors.brown,
                onTap: () {
                  // TODO: 古诗文页面
                },
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        _ModuleCard(
          title: '现代文阅读',
          subtitle: '论述类·文学类·实用类',
          icon: Icons.article,
          color: Colors.indigo,
          onTap: () {
            // TODO: 现代文阅读页面
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
        _buildGradeList(),
      ],
    );
  }

  Widget _buildGradeList() {
    final grades = [
      ('高一上', '必修上册', 8),
      ('高一下', '必修下册', 8),
      ('高二上', '选择性必修上册', 4),
      ('高二下', '选择性必修中册', 4),
      ('高三', '选择性必修下册', 4),
    ];

    return Column(
      children: grades.map((grade) {
        return Card(
          margin: EdgeInsets.only(bottom: 8.h),
          child: ExpansionTile(
            title: Text(
              grade.$1,
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle: Text(grade.$2),
            children: List.generate(grade.$3, (index) {
              return ListTile(
                title: Text('第${index + 1}单元'),
                trailing: const Icon(Icons.chevron_right, size: 20),
                onTap: () {
                  // TODO: 进入单元学习
                },
              );
            }),
          ),
        );
      }).toList(),
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
