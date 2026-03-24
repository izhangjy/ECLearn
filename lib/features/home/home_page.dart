import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../app/theme.dart';
import '../../app/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              SizedBox(height: 24.h),
              _buildSubjectCards(context),
              SizedBox(height: 24.h),
              _buildQuickActions(context),
              const Spacer(),
              _buildBottomNav(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'ECLearn',
          style: TextStyle(
            fontSize: 28.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          '刻意练习，高效备考',
          style: TextStyle(
            fontSize: 14.sp,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildSubjectCards(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _SubjectCard(
            title: '英语',
            subtitle: '单词 · 语法 · 阅读',
            color: AppTheme.englishColor,
            icon: Icons.translate,
            onTap: () => Navigator.pushNamed(context, AppRoutes.englishHome),
          ),
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: _SubjectCard(
            title: '语文',
            subtitle: '基础 · 古诗文 · 阅读',
            color: AppTheme.chineseColor,
            icon: Icons.menu_book,
            onTap: () => Navigator.pushNamed(context, AppRoutes.chineseHome),
          ),
        ),
      ],
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '快捷功能',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            _QuickActionButton(
              icon: Icons.camera_alt,
              label: '试卷分析',
              onTap: () => Navigator.pushNamed(context, AppRoutes.examAnalysis),
            ),
            SizedBox(width: 12.w),
            _QuickActionButton(
              icon: Icons.error_outline,
              label: '错题本',
              onTap: () {
                // TODO: 错题本页面
              },
            ),
            SizedBox(width: 12.w),
            _QuickActionButton(
              icon: Icons.bar_chart,
              label: '学习统计',
              onTap: () => Navigator.pushNamed(context, AppRoutes.stats),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBottomNav(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
          icon: const Icon(Icons.home),
          onPressed: () {},
          color: AppTheme.primaryColor,
        ),
        IconButton(
          icon: const Icon(Icons.book_outlined),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.person_outline),
          onPressed: () => Navigator.pushNamed(context, AppRoutes.settings),
        ),
      ],
    );
  }
}

class _SubjectCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color color;
  final IconData icon;
  final VoidCallback onTap;

  const _SubjectCard({
    required this.title,
    required this.subtitle,
    required this.color,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 140.h,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color, color.withOpacity(0.7)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: Colors.white, size: 32.sp),
            const Spacer(),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              subtitle,
              style: TextStyle(
                color: Colors.white.withOpacity(0.9),
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _QuickActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _QuickActionButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          children: [
            Icon(icon, size: 20.sp, color: Colors.grey[700]),
            SizedBox(width: 8.w),
            Text(
              label,
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
