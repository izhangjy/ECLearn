import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../app/theme.dart';

class StatsPage extends StatelessWidget {
  const StatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('学习统计'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTodayStats(),
            SizedBox(height: 24.h),
            _buildWeeklyChart(),
            SizedBox(height: 24.h),
            _buildKnowledgeMap(),
          ],
        ),
      ),
    );
  }

  Widget _buildTodayStats() {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppTheme.primaryColor, AppTheme.secondaryColor],
        ),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '今日学习',
            style: TextStyle(
              color: Colors.white.withOpacity(0.9),
              fontSize: 14.sp,
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _StatItem(label: '学习时长', value: '0', unit: '分钟'),
              _StatItem(label: '学习单词', value: '0', unit: '个'),
              _StatItem(label: '正确率', value: '0', unit: '%'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWeeklyChart() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '本周学习趋势',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 16.h),
        Container(
          height: 200.h,
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: ['一', '二', '三', '四', '五', '六', '日'].map((day) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 24.w,
                    height: 20.h,
                    decoration: BoxDecoration(
                      color: AppTheme.primaryColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    day,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildKnowledgeMap() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '知识掌握度',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 16.h),
        _KnowledgeItem(
          title: '英语单词',
          progress: 0,
          total: 3500,
          mastered: 0,
          color: AppTheme.englishColor,
        ),
        SizedBox(height: 12.h),
        _KnowledgeItem(
          title: '英语语法',
          progress: 0,
          total: 15,
          mastered: 0,
          color: Colors.purple,
        ),
        SizedBox(height: 12.h),
        _KnowledgeItem(
          title: '语文基础',
          progress: 0,
          total: 800,
          mastered: 0,
          color: AppTheme.chineseColor,
        ),
        SizedBox(height: 12.h),
        _KnowledgeItem(
          title: '古诗文背诵',
          progress: 0,
          total: 64,
          mastered: 0,
          color: Colors.brown,
        ),
      ],
    );
  }
}

class _StatItem extends StatelessWidget {
  final String label;
  final String value;
  final String unit;

  const _StatItem({
    required this.label,
    required this.value,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              value,
              style: TextStyle(
                color: Colors.white,
                fontSize: 28.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 4.h),
              child: Text(
                unit,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 12.sp,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 4.h),
        Text(
          label,
          style: TextStyle(
            color: Colors.white.withOpacity(0.8),
            fontSize: 12.sp,
          ),
        ),
      ],
    );
  }
}

class _KnowledgeItem extends StatelessWidget {
  final String title;
  final double progress;
  final int total;
  final int mastered;
  final Color color;

  const _KnowledgeItem({
    required this.title,
    required this.progress,
    required this.total,
    required this.mastered,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '$mastered / $total',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          ClipRRect(
            borderRadius: BorderRadius.circular(4.r),
            child: LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation<Color>(color),
              minHeight: 8.h,
            ),
          ),
        ],
      ),
    );
  }
}
