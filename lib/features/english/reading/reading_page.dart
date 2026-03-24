import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/database/database.dart';
import '../../../core/practice/reading_service.dart';
import 'reading_practice_page.dart';

// Provider
final readingServiceProvider = Provider<ReadingService>((ref) {
  return ReadingService(AppDatabase.instance);
});

final passagesProvider = FutureProvider<List<ReadingPassageData>>((ref) async {
  final service = ref.watch(readingServiceProvider);
  return service.getAllPassages();
});

/// 阅读理解主页 - 文章列表
class ReadingPage extends ConsumerWidget {
  const ReadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final passagesAsync = ref.watch(passagesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('阅读理解'),
      ),
      body: passagesAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('加载失败: $err')),
        data: (passages) {
          if (passages.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.article_outlined, size: 64.sp, color: Colors.grey),
                  SizedBox(height: 16.h),
                  Text('暂无阅读文章', style: TextStyle(fontSize: 16.sp, color: Colors.grey)),
                ],
              ),
            );
          }

          // 按分类分组
          final categories = <String, List<ReadingPassageData>>{};
          for (final p in passages) {
            categories.putIfAbsent(p.category, () => []).add(p);
          }

          return ListView(
            padding: EdgeInsets.all(16.w),
            children: categories.entries.map((entry) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    child: Text(
                      entry.key,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  ...entry.value.map((passage) => _PassageCard(passage: passage)),
                  SizedBox(height: 16.h),
                ],
              );
            }).toList(),
          );
        },
      ),
    );
  }
}

class _PassageCard extends StatelessWidget {
  final ReadingPassageData passage;

  const _PassageCard({required this.passage});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 12.h),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ReadingPracticePage(passageId: passage.id),
            ),
          );
        },
        borderRadius: BorderRadius.circular(8.r),
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      passage.title,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  _DifficultyBadge(difficulty: passage.difficulty),
                ],
              ),
              SizedBox(height: 8.h),
              Text(
                passage.content.length > 100
                    ? '${passage.content.substring(0, 100)}...'
                    : passage.content,
                style: TextStyle(fontSize: 14.sp, color: Colors.grey[600]),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 8.h),
              Row(
                children: [
                  Icon(Icons.text_fields, size: 16.sp, color: Colors.grey),
                  SizedBox(width: 4.w),
                  Text(
                    '${passage.wordCount} 词',
                    style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                  ),
                  const Spacer(),
                  Icon(Icons.arrow_forward_ios, size: 14.sp, color: Colors.grey),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DifficultyBadge extends StatelessWidget {
  final int difficulty;

  const _DifficultyBadge({required this.difficulty});

  @override
  Widget build(BuildContext context) {
    final colors = [Colors.green, Colors.lightGreen, Colors.orange, Colors.deepOrange, Colors.red];
    final labels = ['简单', '较易', '中等', '较难', '困难'];
    final index = (difficulty - 1).clamp(0, 4);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: colors[index].withOpacity(0.1),
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Text(
        labels[index],
        style: TextStyle(fontSize: 12.sp, color: colors[index]),
      ),
    );
  }
}
