import 'package:realm/realm.dart'; // import realm package

part 'login_model.realm.dart'; // declare a part file.

@RealmModel()
class _LoginModel {
  @PrimaryKey()
  late String email;

  late String fullName;
  late String avatarUrl;
}
