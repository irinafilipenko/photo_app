import 'package:dio/dio.dart';
import 'package:photo_app/presentation/components/constants.dart';
import 'package:photo_app/data/models/photo_model.dart';
import 'package:retrofit/retrofit.dart';

part 'photo_service.g.dart';

@RestApi(baseUrl: kUrlPhoto)
abstract class PhotoService {
  factory PhotoService(Dio dio, {String baseUrl}) = _PhotoService;

  @GET("curated?per_page=50")
  Future<PhotoResponse> getPhotos(
    @Header('Authorization') String apiKey, // Заголовок авторизации
  );
}

// class PhotoService {
//   final Dio _dio = Dio();
//
//   Future<Response> getPhotos(String url, String apiKey) async {
//     final response = await _dio.get(
//       url,
//       options: Options(headers: {
//         'Authorization': apiKey,
//       }),
//     );
//     return response;
//   }
// }
