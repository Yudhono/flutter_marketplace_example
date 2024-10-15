import 'package:dartz/dartz.dart';
import 'package:flutter_marketplace_example/core/usecase/usecase.dart';
import 'package:flutter_marketplace_example/domain/repository/user_profile/user_profile_repository.dart';
import 'package:flutter_marketplace_example/service_locator.dart';

class GetUserProfileUsecase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return sl<UserProfileRepository>().getUserProfile();
  }
}
