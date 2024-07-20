import 'package:dio/dio.dart';
import 'package:photo_app/models/user_model.dart';

class UserRepository {
  final Dio _dio = Dio();

  Future<UserModel> login(String email, String password) async {
    final response = await _dio.get('https://randomuser.me/api/');
    return UserModel.fromJson(response.data['results'][0]);
  }
}
