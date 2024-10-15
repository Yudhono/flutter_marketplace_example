import 'package:flutter_marketplace_example/domain/entities/user_profile/user_profile_entity.dart';

abstract class UserProfileState {}

class UserProfileLoading extends UserProfileState {}

class UserProfileLoaded extends UserProfileState {
  final UserProfileEntity userProfile;

  UserProfileLoaded(this.userProfile);
}

class UserProfileLoadFailed extends UserProfileState {
  final String message;

  UserProfileLoadFailed(this.message);
}
