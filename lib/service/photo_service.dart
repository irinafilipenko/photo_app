import 'package:dio/dio.dart';

class PhotoService {
  final Dio _dio = Dio();

  Future<Response> getPhotos(String url, String apiKey) async {
    final response = await _dio.get(
      url,
      options: Options(headers: {
        'Authorization': apiKey,
      }),
    );
    return response;
  }
}
