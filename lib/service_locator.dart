import 'package:flutter_marketplace_example/common/helpers/shared_preferences_helper.dart';
import 'package:flutter_marketplace_example/data/repository/auth/auth_repository_implementation.dart';
import 'package:flutter_marketplace_example/data/repository/auth/token_retrieved_repository_implementation.dart';
import 'package:flutter_marketplace_example/data/sources/auth/signin_service.dart';
import 'package:flutter_marketplace_example/domain/repository/auth/auth.dart';
import 'package:flutter_marketplace_example/domain/repository/auth/token_retrieved_repository.dart';
import 'package:flutter_marketplace_example/domain/usecases/auth/signin.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerLazySingleton<SigninService>(
      () => SigninServiceImpl(sl<TokenRetrievedRepository>()));
  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImplementation());
  sl.registerLazySingleton<SignInUseCase>(() => SignInUseCase());
  sl.registerLazySingleton<SharedPreferencesHelper>(
      () => SharedPreferencesHelper());
  sl.registerLazySingleton<TokenRetrievedRepository>(
      () => TokenRepositoryImpl(sl<SharedPreferencesHelper>()));
}
