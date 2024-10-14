import 'package:flutter_marketplace_example/common/helpers/shared_preferences_helper.dart';
import 'package:flutter_marketplace_example/domain/repository/auth/token_retrieved_repository.dart';

class TokenRepositoryImpl implements TokenRetrievedRepository {
  final SharedPreferencesHelper sharedPreferencesHelper;

  TokenRepositoryImpl(this.sharedPreferencesHelper);

  @override
  Future<void> saveAccessToken(String token) async {
    await sharedPreferencesHelper.saveAccessToken(token);
  }

  @override
  Future<void> saveRefreshToken(String token) async {
    await sharedPreferencesHelper.saveRefreshToken(token);
  }

  @override
  Future<String?> getAccessToken() async {
    return await sharedPreferencesHelper.getAccessToken();
  }

  @override
  Future<String?> getRefreshToken() async {
    return await sharedPreferencesHelper.getRefreshToken();
  }
}
