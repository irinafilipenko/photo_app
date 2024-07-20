class UserModel {
  final String email;
  final String fullName;
  final String avatarUrl;

  UserModel(
      {required this.email, required this.fullName, required this.avatarUrl});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      fullName: json['name']['first'] + ' ' + json['name']['last'],
      avatarUrl: json['picture']['large'],
    );
  }
}
