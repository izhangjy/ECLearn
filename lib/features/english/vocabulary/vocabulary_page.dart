import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../app/routes.dart';
import '../../../app/theme.dart';
import 'vocabulary_provider.dart';

class VocabularyPage extends ConsumerWidget {
  final String? unitId;

  const VocabularyPage({super.key, this.unitId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wordsAsync = ref.watch(unitWordsProvider(unitId ?? 'B1U1'));

    return Scaffold(
      appBar: AppBar(
        title: const Text('单词学习'),
        backgroundColor: AppTheme.englishColor.withOpacity(0.1),
      ),
      body: wordsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('加载失败: $err')),
        data: (words) => _buildContent(context, ref, words),
      ),
    );
  }

  Widget _buildContent(BuildContext context, WidgetRef ref, List<WordWithState> words) {
    final progress = ref.watch(unitProgressProvider(unitId ?? 'B1U1'));

    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildProgressCard(progress),
          SizedBox(height: 20.h),
          _buildLearnModes(context),
          SizedBox(height: 20.h),
          _buildWordList(words),
        ],
      ),
    );
  }

  Widget _buildProgressCard(UnitProgress progress) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppTheme.englishColor, AppTheme.englishColor.withOpacity(0.7)],
        ),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '本单元进度',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
            ),
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Text(
                '${progress.mastered}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                ' / ${progress.total}',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 18.sp,
                ),
              ),
              const Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(
                  '${(progress.masteryRate * 100).toInt()}% 已掌握',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.sp,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          ClipRRect(
            borderRadius: BorderRadius.circular(4.r),
            child: LinearProgressIndicator(
              value: progress.masteryRate,
              backgroundColor: Colors.white.withOpacity(0.3),
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
              minHeight: 6.h,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLearnModes(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '学习模式',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            Expanded(
              child: _ModeButton(
                icon: Icons.visibility,
                label: '认识模式',
                description: '看词选义',
                color: Colors.blue,
                onTap: () => _startLearn(context, LearnMode.recognize),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: _ModeButton(
                icon: Icons.edit,
                label: '拼写模式',
                description: '听音写词',
                color: Colors.green,
                onTap: () => _startLearn(context, LearnMode.spell),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: _ModeButton(
                icon: Icons.format_quote,
                label: '语境模式',
                description: '句中选词',
                color: Colors.orange,
                onTap: () => _startLearn(context, LearnMode.context),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _startLearn(BuildContext context, LearnMode mode) {
    Navigator.pushNamed(
      context,
      AppRoutes.wordLearn,
      arguments: {
        'unitId': unitId ?? 'B1U1',
        'mode': mode,
      },
    );
  }

  Widget _buildWordList(List<WordWithState> words) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '单词列表',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              '共 ${words.length} 词',
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: words.length,
          separatorBuilder: (_, __) => Divider(height: 1.h),
          itemBuilder: (context, index) {
            final item = words[index];
            return _WordListItem(wordWithState: item);
          },
        ),
      ],
    );
  }
}

class _ModeButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final String description;
  final Color color;
  final VoidCallback onTap;

  const _ModeButton({
    required this.icon,
    required this.label,
    required this.description,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 28.sp),
            SizedBox(height: 8.h),
            Text(
              label,
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
                color: color,
              ),
            ),
            SizedBox(height: 2.h),
            Text(
              description,
              style: TextStyle(
                fontSize: 10.sp,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _WordListItem extends StatelessWidget {
  final WordWithState wordWithState;

  const _WordListItem({required this.wordWithState});

  @override
  Widget build(BuildContext context) {
    final word = wordWithState.word;
    final state = wordWithState.state;

    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 4.h),
      title: Row(
        children: [
          Text(
            word.word,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(width: 8.w),
          Text(
            word.phonetic,
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
      subtitle: Text(
        word.primaryMeaning,
        style: TextStyle(
          fontSize: 13.sp,
          color: Colors.grey[700],
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: _buildStatusBadge(state),
    );
  }

  Widget _buildStatusBadge(WordMasteryState state) {
    Color color;
    String text;

    switch (state.status) {
      case 'mastered':
        color = AppTheme.successColor;
        text = '已掌握';
        break;
      case 'learning':
        color = AppTheme.warningColor;
        text = '学习中';
        break;
      default:
        color = Colors.grey;
        text = '未学习';
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 11.sp,
          color: color,
        ),
      ),
    );
  }
}
