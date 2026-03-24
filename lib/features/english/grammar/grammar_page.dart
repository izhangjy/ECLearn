import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'grammar_practice_page.dart';

class GrammarPage extends StatelessWidget {
  const GrammarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('语法攻克'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.w),
        children: [
          _buildSection(context, '时态语态', [
            '一般现在时',
            '一般过去时',
            '一般将来时',
            '现在进行时',
            '过去进行时',
            '现在完成时',
            '过去完成时',
            '被动语态',
          ]),
          _buildSection(context, '从句', [
            '定语从句',
            '名词性从句',
            '状语从句',
          ]),
          _buildSection(context, '非谓语动词', [
            '不定式',
            '动名词',
            '分词',
          ]),
          _buildSection(context, '特殊句式', [
            '倒装句',
            '强调句',
            '虚拟语气',
          ]),
        ],
      ),
    );
  }

  Widget _buildSection(BuildContext context, String title, List<String> items) {
    return Card(
      margin: EdgeInsets.only(bottom: 16.h),
      child: ExpansionTile(
        title: Text(
          title,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        children: items.map((item) => ListTile(
          title: Text(item),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => GrammarPracticePage(topic: item),
              ),
            );
          },
        )).toList(),
      ),
    );
  }
}
