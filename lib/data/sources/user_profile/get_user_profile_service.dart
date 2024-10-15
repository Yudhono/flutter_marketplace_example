import 'package:dartz/dartz.dart';
import 'package:flutter_marketplace_example/domain/entities/user_profile/user_profile_entity.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

abstract class GetUserProfileService {
  Future<Either<String, UserProfileEntity>> getUserProfile();
}

class GetUserProfileServiceImplementation extends GetUserProfileService {
  @override
  Future<Either<String, UserProfileEntity>> getUserProfile() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('access_token');

      if (token == null) {
        return Left('Access token not found');
      }

      final response = await http.get(
        Uri.parse('https://api.escuelajs.co/api/v1/auth/profile'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final userProfile = UserProfileEntity(
          id: data['id'],
          name: data['name'],
          email: data['email'],
          password: data['password'],
          role: data['role'],
          avatar: data['avatar'],
          creationAt: data['creationAt'],
          updatedAt: data['updatedAt'],
        );
        return Right(userProfile);
      } else {
        return Left('Failed to fetch user profile: ${response.reasonPhrase}');
      }
    } catch (e) {
      return Left('An error occurred: $e');
    }
  }
}
