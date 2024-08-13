class UserResponse {
  final List<UserModel> results;

  UserResponse({required this.results});

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    var resultsList = json['results'] as List;
    List<UserModel> users =
        resultsList.map((i) => UserModel.fromJson(i)).toList();

    return UserResponse(results: users);
  }
}

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
