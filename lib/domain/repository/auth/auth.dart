import 'package:dartz/dartz.dart';
import 'package:flutter_marketplace_example/data/models/auth/user_signin_request.dart';

abstract class AuthRepository {
  Future<Either> signin(UserSigninRequest userSigninRequest);
}
