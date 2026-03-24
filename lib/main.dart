import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app/app.dart';
import 'core/database/database.dart';
import 'core/database/test_data_initializer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    print('开始初始化数据库...');
    // 初始化数据库
    await AppDatabase.instance.initialize();
    print('数据库初始化完成');

    print('开始初始化测试数据...');
    // 初始化测试数据（仅开发环境）
    final initializer = TestDataInitializer(AppDatabase.instance);
    await initializer.initializeAll();
    print('测试数据初始化完成');

    runApp(
      const ProviderScope(
        child: ECLearnApp(),
      ),
    );
  } catch (e, stackTrace) {
    print('初始化失败: $e');
    print('堆栈跟踪: $stackTrace');

    runApp(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error, size: 64, color: Colors.red),
                  const SizedBox(height: 16),
                  const Text(
                    '应用初始化失败',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '错误信息: $e',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
