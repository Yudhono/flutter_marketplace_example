import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_marketplace_example/data/models/auth/user_signin_request.dart';
import 'package:flutter_marketplace_example/domain/repository/auth/token_retrieved_repository.dart';
import 'package:http/http.dart' as http;

abstract class SigninService {
  Future<Either> signin(UserSigninRequest userSigninRequest);
}

class SigninServiceImpl implements SigninService {
  final TokenRetrievedRepository tokenRepository;

  SigninServiceImpl(this.tokenRepository);

  @override
  Future<Either<String, Map<String, dynamic>>> signin(
      UserSigninRequest userSigninRequest) async {
    final url = Uri.parse('https://api.escuelajs.co/api/v1/auth/login');
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode({
      'email': userSigninRequest.email,
      'password': userSigninRequest.password,
    });

    try {
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 201) {
        final responseBody = json.decode(response.body);
        final accessToken = responseBody['access_token'];
        final refreshToken = responseBody['refresh_token'];

        await tokenRepository.saveAccessToken(accessToken);
        await tokenRepository.saveRefreshToken(refreshToken);

        return Right(responseBody);
      } else {
        return Left('Error: ${response.statusCode}');
      }
    } catch (e) {
      return Left('Exception: $e');
    }
  }
}
