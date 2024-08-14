import 'package:injectable/injectable.dart';

import 'package:photo_app/data/models/login_model.dart';

import 'package:realm/realm.dart';

abstract class LocalDataStorage {
  Future<LoginModel?> getUserFromCache();
  Future<void> userToCache(LoginModel user);
}

@lazySingleton
class LocalDataStorageImpl implements LocalDataStorage {
  final Realm realm;

  LocalDataStorageImpl(this.realm);

  @override
  Future<LoginModel?> getUserFromCache() async {
    final users = realm.all<LoginModel>();
    if (users.isNotEmpty) {
      final user = users.first;

      return user;
    } else {
      return null;
    }
  }

  @override
  Future<void> userToCache(LoginModel user) async {
    realm.write(() {
      realm.add(user, update: true);
    });
  }

  Future<void> removeUserFromCache() async {
    print("Removing user from cache");
    final users = realm.all<LoginModel>();
    realm.write(() {
      if (users.isNotEmpty) {
        realm.deleteMany(users);
      }
    });
  }
}
