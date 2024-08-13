import 'package:dio/dio.dart';
import 'package:photo_app/components/constants.dart';
import 'package:photo_app/models/user_model.dart';
import 'package:retrofit/retrofit.dart';

part 'user_service.g.dart';

@RestApi(baseUrl: kUrlUser)
abstract class UserService {
  factory UserService(Dio dio, {String baseUrl}) = _UserService;

  @GET("/api/")
  Future<UserResponse> getUser();
}

// class UserService {
//   final Dio _dio = Dio();
//
//   Future<Response> getUser(String url) async {
//     final response = await _dio.get(
//       url,
//     );
//     return response;
//   }
// }
