import 'package:flutter_marketplace_example/common/helpers/shared_preferences_helper.dart';
import 'package:flutter_marketplace_example/data/repository/auth/auth_repository_implementation.dart';
import 'package:flutter_marketplace_example/data/repository/auth/token_retrieved_repository_implementation.dart';
import 'package:flutter_marketplace_example/data/repository/products/product_repository_implementation.dart';
import 'package:flutter_marketplace_example/data/repository/user_profile/user_profile_implementation.dart';
import 'package:flutter_marketplace_example/data/sources/auth/signin_service.dart';
import 'package:flutter_marketplace_example/data/sources/products/get_list_products_service.dart';
import 'package:flutter_marketplace_example/data/sources/user_profile/get_user_profile_service.dart';
import 'package:flutter_marketplace_example/domain/repository/auth/auth.dart';
import 'package:flutter_marketplace_example/domain/repository/auth/token_retrieved_repository.dart';
import 'package:flutter_marketplace_example/domain/repository/products/product_repository.dart';
import 'package:flutter_marketplace_example/domain/repository/user_profile/user_profile_repository.dart';
import 'package:flutter_marketplace_example/domain/usecases/auth/signin.dart';
import 'package:flutter_marketplace_example/domain/usecases/products/products_usecase.dart';
import 'package:flutter_marketplace_example/domain/usecases/user_profile/get_user_profile_usecase.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerLazySingleton<SigninService>(
      () => SigninServiceImpl(sl<TokenRetrievedRepository>()));

  sl.registerLazySingleton<GetUserProfileService>(
      () => GetUserProfileServiceImplementation());

  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImplementation());

  sl.registerLazySingleton<SignInUseCase>(() => SignInUseCase());

  sl.registerLazySingleton<SharedPreferencesHelper>(
      () => SharedPreferencesHelper());

  sl.registerLazySingleton<TokenRetrievedRepository>(
      () => TokenRepositoryImpl(sl<SharedPreferencesHelper>()));

  sl.registerLazySingleton<UserProfileRepository>(
      () => UserProfileImplementation());

  sl.registerLazySingleton<GetUserProfileUsecase>(
      () => GetUserProfileUsecase());

  sl.registerLazySingleton<GetListProductsService>(
      () => GetListProductsServiceImpl());

  sl.registerLazySingleton<ProductRepository>(
      () => ProductRepositoryImplementation());

  sl.registerLazySingleton<GetProductsUsecase>(() => GetProductsUsecase());
}
