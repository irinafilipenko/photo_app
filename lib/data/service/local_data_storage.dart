import 'dart:convert';

import 'package:photo_app/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDataStorage {
  Future<UserModel?> getUserFromCache();
  Future<void> userToCache(UserModel user);
}

class LocalDataStorageImpl implements LocalDataStorage {
  static const cacheUser = 'CACHE_USER';
  static const cacheFavoriteRepositories = 'CACHE_FAVORITE_REPOSITORIES';

  @override
  Future<UserModel?> getUserFromCache() async {
    print("getUserFromCache");
    final sharedPreferences = await SharedPreferences.getInstance();
    final jsonUser = sharedPreferences.getString(cacheUser);

    print(jsonUser);
    if (jsonUser != null && jsonUser.isNotEmpty) {
      // print('Get User from Cache: $jsonUser');
      final Map<String, dynamic> userMap =
          json.decode(jsonUser) as Map<String, dynamic>;

      final user = UserModel.fromJson(userMap);
      return Future.value(user);
    } else {
      return null;
    }
  }

  @override
  Future<void> userToCache(UserModel user) async {
    print("userToCache");
    print(user.email);
    // print(json.encode(user.toJson()));
    final sharedPreferences = await SharedPreferences.getInstance();
    final jsonString = json.encode(user.toJson());
    await sharedPreferences.setString(cacheUser, jsonString);
  }
}
