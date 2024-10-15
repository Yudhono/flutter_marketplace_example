import 'package:dartz/dartz.dart';

abstract class UserProfileRepository {
  Future<Either> getUserProfile();
}
