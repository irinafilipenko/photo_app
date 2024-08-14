import 'package:dio/dio.dart';
import 'package:photo_app/data/models/user_model.dart';
import 'package:photo_app/data/service/local_data_storage.dart';
import 'package:photo_app/data/service/user_service.dart';

class UserRepository {
  final UserService _userService;
  final LocalDataStorage _localDataStorage;

  UserRepository(Dio dio, LocalDataStorage localDataStorage)
      : _userService = UserService(dio),
        _localDataStorage = localDataStorage;

  Future<UserModel> login(String email, String password) async {
    try {
      final user = await _userService.getUser();
      return user.results.first;
    } catch (e) {
      throw Error();
    }
  }

  Future<void> saveUserToCache(UserModel user) async {
    await _localDataStorage.userToCache(user);
  }
}

// class UserRepository {
//   final UserService _userService = UserService();
//
//   Future<UserModel> login(String email, String password) async {
//     try {
//       final response = await _userService.getUser(kUrlUser);
//       return UserModel.fromJson(response.data['results'][0]);
//     } catch (e) {
//       throw Error();
//     }
//   }
// }
