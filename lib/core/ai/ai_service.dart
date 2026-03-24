import 'package:dio/dio.dart';

// AI服务抽象接口
abstract class AIService {
  Future<String> analyze(String prompt);
  Future<List<Map<String, dynamic>>> generateVariants(String question, int count);
}

// 通义千问服务
class QwenService implements AIService {
  final Dio _dio = Dio();
  final String apiKey;
  final String baseUrl = 'https://dashscope.aliyuncs.com/api/v1/services/aigc/text-generation/generation';

  QwenService({required this.apiKey});

  @override
  Future<String> analyze(String prompt) async {
    try {
      final response = await _dio.post(
        baseUrl,
        options: Options(
          headers: {
            'Authorization': 'Bearer $apiKey',
            'Content-Type': 'application/json',
          },
        ),
        data: {
          'model': 'qwen-turbo',
          'input': {
            'messages': [
              {'role': 'user', 'content': prompt}
            ]
          },
        },
      );

      return response.data['output']['text'] ?? '';
    } catch (e) {
      throw Exception('AI分析失败: $e');
    }
  }

  @override
  Future<List<Map<String, dynamic>>> generateVariants(String question, int count) async {
    final prompt = '''
请根据以下题目生成$count道同类型、同知识点的变式题。
原题：$question

要求：
1. 保持相同的知识点和题型
2. 难度相近
3. 返回JSON格式，包含question、options、answer、explanation字段
''';

    final result = await analyze(prompt);
    // TODO: 解析JSON结果
    return [];
  }
}

// AI服务工厂
class AIServiceFactory {
  static AIService create(String provider, String apiKey) {
    switch (provider) {
      case '通义千问':
        return QwenService(apiKey: apiKey);
      // TODO: 添加其他服务商
      default:
        return QwenService(apiKey: apiKey);
    }
  }
}
