// api_service.dart

import 'package:dio/dio.dart';
import 'package:examflutterui/models/models.dart';

class ApiService {
  final Dio _dio = Dio();
  final String _baseUrl = 'https://dummyjson.com';

  Future<List<Comment>> fetchComments() async {
    try {
      final response = await _dio.get('$_baseUrl/comments');
      List<Comment> comments = (response.data['comments'] as List)
          .map((commentJson) => Comment.fromJson(commentJson))
          .toList();
      return comments;
    } catch (error) {
      throw Exception('Failed to load comments');
    }
  }
}
