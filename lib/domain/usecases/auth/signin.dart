import 'package:dartz/dartz.dart';
import 'package:flutter_marketplace_example/core/usecase/usecase.dart';
import 'package:flutter_marketplace_example/data/models/auth/user_signin_request.dart';
import 'package:flutter_marketplace_example/domain/repository/auth/auth.dart';
import 'package:flutter_marketplace_example/service_locator.dart';

class SignInUseCase implements UseCase<Either, UserSigninRequest> {
  @override
  Future<Either> call({UserSigninRequest? params}) async {
    return sl<AuthRepository>().signin(params!);
  }
}
