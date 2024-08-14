import 'package:json_annotation/json_annotation.dart';

// part 'user_model.g.dart';
//
// @JsonSerializable(fieldRename: FieldRename.snake)
// class UserResponse {
//   final List<UserModel> results;
//   const UserResponse({
//     required this.results,
//   });
//
//   factory UserResponse.fromJson(Map<String, Object?> json) =>
//       _$UserResponseFromJson(json);
//
//   Map<String, Object?> toJson() => _$UserResponseToJson(this);
// }
//
// @JsonSerializable(fieldRename: FieldRename.snake)
// class UserModel {
//   final String email;
//   final Name name;
//   final Picture picture;
//
//   const UserModel({
//     required this.email,
//     required this.name,
//     required this.picture,
//   });
//
//   factory UserModel.fromJson(Map<String, Object?> json) =>
//       _$UserModelFromJson(json);
//
//   Map<String, Object?> toJson() => _$UserModelToJson(this);
// }
//
// @JsonSerializable(fieldRename: FieldRename.snake)
// class Name {
//   final String first;
//   final String last;
//
//   const Name({
//     required this.first,
//     required this.last,
//   });
//
//   factory Name.fromJson(Map<String, dynamic> json) => _$NameFromJson(json);
//
//   Map<String, dynamic> toJson() => _$NameToJson(this);
// }
//
// @JsonSerializable(fieldRename: FieldRename.snake)
// class Picture {
//   final String large;
//   final String medium;
//   final String thumbnail;
//
//   const Picture({
//     required this.large,
//     required this.medium,
//     required this.thumbnail,
//   });
//
//   factory Picture.fromJson(Map<String, dynamic> json) =>
//       _$PictureFromJson(json);
//
//   Map<String, dynamic> toJson() => _$PictureToJson(this);
// }

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
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'name': {
        'first': fullName.split(' ')[0],
        'last': fullName.split(' ').length > 1 ? fullName.split(' ')[1] : '',
      },
      'picture': {
        'large': avatarUrl,
      },
    };
  }
}
