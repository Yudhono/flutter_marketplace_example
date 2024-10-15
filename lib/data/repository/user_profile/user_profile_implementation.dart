import 'package:dartz/dartz.dart';
import 'package:flutter_marketplace_example/data/sources/user_profile/get_user_profile_service.dart';
import 'package:flutter_marketplace_example/domain/repository/user_profile/user_profile_repository.dart';
import 'package:flutter_marketplace_example/service_locator.dart';

class UserProfileImplementation extends UserProfileRepository {
  @override
  Future<Either> getUserProfile() async {
    return await sl<GetUserProfileService>().getUserProfile();
  }
}
