import 'package:dio/dio.dart';
import 'package:photo_app/components/constants.dart';
import 'package:photo_app/models/user_model.dart';
import 'package:photo_app/service/user_service.dart';

class UserRepository {
  final UserService _userService = UserService();

  Future<UserModel> login(String email, String password) async {
    final response = await _userService.getUser(kUrlUser);
    return UserModel.fromJson(response.data['results'][0]);
  }
}
