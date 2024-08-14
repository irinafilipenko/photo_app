import 'dart:convert';

import 'package:photo_app/data/models/login_model.dart';
import 'package:photo_app/data/models/user_model.dart';
import 'package:realm/realm.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDataStorage {
  Future<LoginModel?> getUserFromCache();
  Future<void> userToCache(LoginModel user);
}

class LocalDataStorageImpl implements LocalDataStorage {
  final Realm realm;

  LocalDataStorageImpl(this.realm);

  @override
  Future<LoginModel?> getUserFromCache() async {
    print("getUserFromCache");

    // Ищем пользователя в базе данных Realm по email
    final users = realm.all<LoginModel>();
    if (users.isNotEmpty) {
      final user = users.first;
      print("User found: ${user.email}");
      return user;
    } else {
      print("User not found in cache");
      return null;
    }
  }

  @override
  Future<void> userToCache(LoginModel user) async {
    print("userToCache");
    print(user.email);

    // Сохраняем пользователя в базу данных Realm
    realm.write(() {
      realm.add(user, update: true);
    });
  }

  Future<void> removeUserFromCache() async {
    print("Removing user from cache");

    final users = realm.all<LoginModel>();
    realm.write(() {
      if (users.isNotEmpty) {
        // Удаляем каждого пользователя по отдельности
        realm.deleteMany(users);
      }
    });
  }
}

// abstract class LocalDataStorage {
//   Future<UserModel?> getUserFromCache();
//   Future<void> userToCache(UserModel user);
// }
//
// class LocalDataStorageImpl implements LocalDataStorage {
//   static const cacheUser = 'CACHE_USER';
//   static const cacheFavoriteRepositories = 'CACHE_FAVORITE_REPOSITORIES';
//   final Realm realm;
//
//   LocalDataStorageImpl(this.realm);
//
//   @override
//   Future<UserModel?> getUserFromCache() async {
//     print("getUserFromCache");
//     final sharedPreferences = await SharedPreferences.getInstance();
//     final jsonUser = sharedPreferences.getString(cacheUser);
//
//     print(jsonUser);
//     if (jsonUser != null && jsonUser.isNotEmpty) {
//       // print('Get User from Cache: $jsonUser');
//       final Map<String, dynamic> userMap =
//           json.decode(jsonUser) as Map<String, dynamic>;
//
//       final user = UserModel.fromJson(userMap);
//       return Future.value(user);
//     } else {
//       return null;
//     }
//   }
//
//   @override
//   Future<void> userToCache(UserModel user) async {
//     print("userToCache");
//     print(user.email);
//     // print(json.encode(user.toJson()));
//     final sharedPreferences = await SharedPreferences.getInstance();
//     final jsonString = json.encode(user.toJson());
//     await sharedPreferences.setString(cacheUser, jsonString);
//   }
// }
