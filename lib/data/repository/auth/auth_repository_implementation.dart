import 'package:dartz/dartz.dart';
import 'package:flutter_marketplace_example/data/models/auth/user_signin_request.dart';
import 'package:flutter_marketplace_example/data/sources/auth/signin_service.dart';
import 'package:flutter_marketplace_example/domain/repository/auth/auth.dart';
import 'package:flutter_marketplace_example/service_locator.dart';

class AuthRepositoryImplementation extends AuthRepository {
  @override
  Future<Either> signin(UserSigninRequest userSigninRequest) async {
    return await sl<SigninService>().signin(userSigninRequest);
  }
}
