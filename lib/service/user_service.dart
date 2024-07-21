import 'package:dio/dio.dart';

class UserService {
  final Dio _dio = Dio();

  Future<Response> getUser(String url) async {
    final response = await _dio.get(
      url,
    );
    return response;
  }
}
