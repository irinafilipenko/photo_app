import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:photo_app/data/models/login_model.dart';
import 'package:photo_app/data/service/local_data_storage.dart';
import 'package:realm/realm.dart';

@module
abstract class DioModule {
  @lazySingleton
  Dio get dio => Dio();
}

@module
abstract class LocalDataStorageModule {
  @lazySingleton
  Realm get realm {
    final config = Configuration.local([LoginModel.schema]);
    return Realm(config);
  }

  @lazySingleton
  LocalDataStorage get localDataStorage => LocalDataStorageImpl(realm);
}
