import 'package:flutter_marketplace_example/domain/entities/user_profile/user_profile_entity.dart';

class UserProfileModel {
  int? id;
  String? email;
  String? password;
  String? name;
  String? role;
  String? avatar;
  String? creationAt;
  String? updatedAt;

  UserProfileModel({
    this.id,
    this.name,
    this.email,
    this.password,
    this.role,
    this.avatar,
    this.creationAt,
    this.updatedAt,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      role: json['role'],
      avatar: json['avatar'],
      creationAt: json['creationAt'],
      updatedAt: json['updatedAt'],
    );
  }
}

extension UserProfileModelX on UserProfileModel {
  UserProfileEntity toEntity() {
    return UserProfileEntity(
      id: id,
      name: name,
      email: email,
      password: password,
      role: role,
      avatar: avatar,
      creationAt: creationAt,
      updatedAt: updatedAt,
    );
  }
}
