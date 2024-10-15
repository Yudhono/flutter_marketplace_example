class UserProfileEntity {
  int? id;
  String? email;
  String? password;
  String? name;
  String? role;
  String? avatar;
  String? creationAt;
  String? updatedAt;

  UserProfileEntity({
    this.id,
    this.name,
    this.email,
    this.password,
    this.role,
    this.avatar,
    this.creationAt,
    this.updatedAt,
  });
}
