import 'package:dio/dio.dart';
import 'dart:convert';

// OCR服务抽象接口
abstract class OCRService {
  Future<String> recognize(List<int> imageBytes);
}

// 百度OCR服务
class BaiduOCRService implements OCRService {
  final Dio _dio = Dio();
  final String apiKey;
  final String secretKey;
  String? _accessToken;

  BaiduOCRService({required this.apiKey, required this.secretKey});

  Future<String> _getAccessToken() async {
    if (_accessToken != null) return _accessToken!;

    final response = await _dio.post(
      'https://aip.baidubce.com/oauth/2.0/token',
      queryParameters: {
        'grant_type': 'client_credentials',
        'client_id': apiKey,
        'client_secret': secretKey,
      },
    );

    _accessToken = response.data['access_token'];
    return _accessToken!;
  }

  @override
  Future<String> recognize(List<int> imageBytes) async {
    try {
      final token = await _getAccessToken();
      final base64Image = base64Encode(imageBytes);

      final response = await _dio.post(
        'https://aip.baidubce.com/rest/2.0/ocr/v1/accurate_basic',
        queryParameters: {'access_token': token},
        options: Options(
          contentType: 'application/x-www-form-urlencoded',
        ),
        data: {
          'image': base64Image,
          'language_type': 'CHN_ENG',
        },
      );

      final words = response.data['words_result'] as List;
      return words.map((w) => w['words']).join('\n');
    } catch (e) {
      throw Exception('OCR识别失败: $e');
    }
  }
}

// OCR服务工厂
class OCRServiceFactory {
  static OCRService create(String provider, String apiKey, String secretKey) {
    switch (provider) {
      case '百度OCR':
        return BaiduOCRService(apiKey: apiKey, secretKey: secretKey);
      // TODO: 添加其他服务商
      default:
        return BaiduOCRService(apiKey: apiKey, secretKey: secretKey);
    }
  }
}
