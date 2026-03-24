import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String _selectedLLM = '通义千问';
  String _selectedOCR = '百度OCR';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('设置'),
      ),
      body: ListView(
        children: [
          _buildSection('AI服务配置', [
            _buildLLMSelector(),
            _buildOCRSelector(),
            _buildAPIKeyTile('大模型 API Key', '点击配置'),
            _buildAPIKeyTile('OCR API Key', '点击配置'),
          ]),
          _buildSection('学习设置', [
            _buildSwitchTile('每日学习提醒', true),
            _buildSwitchTile('自动播放单词发音', true),
            _buildSwitchTile('深色模式', false),
          ]),
          _buildSection('数据管理', [
            ListTile(
              title: const Text('导出学习数据'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                // TODO: 导出数据
              },
            ),
            ListTile(
              title: const Text('清除缓存'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                // TODO: 清除缓存
              },
            ),
          ]),
          _buildSection('关于', [
            const ListTile(
              title: Text('版本'),
              trailing: Text('1.0.0'),
            ),
            ListTile(
              title: const Text('反馈问题'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                // TODO: 反馈
              },
            ),
          ]),
        ],
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(16.w, 24.h, 16.w, 8.h),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: Colors.grey[600],
            ),
          ),
        ),
        Card(
          margin: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(children: children),
        ),
      ],
    );
  }

  Widget _buildLLMSelector() {
    return ListTile(
      title: const Text('大模型服务'),
      trailing: DropdownButton<String>(
        value: _selectedLLM,
        underline: const SizedBox(),
        items: ['通义千问', '文心一言', 'DeepSeek', 'OpenAI', 'Claude']
            .map((e) => DropdownMenuItem(value: e, child: Text(e)))
            .toList(),
        onChanged: (value) {
          if (value != null) {
            setState(() {
              _selectedLLM = value;
            });
          }
        },
      ),
    );
  }

  Widget _buildOCRSelector() {
    return ListTile(
      title: const Text('OCR服务'),
      trailing: DropdownButton<String>(
        value: _selectedOCR,
        underline: const SizedBox(),
        items: ['百度OCR', '腾讯OCR', '阿里云OCR']
            .map((e) => DropdownMenuItem(value: e, child: Text(e)))
            .toList(),
        onChanged: (value) {
          if (value != null) {
            setState(() {
              _selectedOCR = value;
            });
          }
        },
      ),
    );
  }

  Widget _buildAPIKeyTile(String title, String subtitle) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        _showAPIKeyDialog(title);
      },
    );
  }

  Widget _buildSwitchTile(String title, bool initialValue) {
    return StatefulBuilder(
      builder: (context, setState) {
        return SwitchListTile(
          title: Text(title),
          value: initialValue,
          onChanged: (value) {
            setState(() {
              // TODO: 保存设置
            });
          },
        );
      },
    );
  }

  void _showAPIKeyDialog(String title) {
    final controller = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('配置$title'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            hintText: '请输入API Key',
            border: OutlineInputBorder(),
          ),
          obscureText: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('取消'),
          ),
          ElevatedButton(
            onPressed: () {
              // TODO: 保存API Key
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('API Key 已保存')),
              );
            },
            child: const Text('保存'),
          ),
        ],
      ),
    );
  }
}
