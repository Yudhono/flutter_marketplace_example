import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_marketplace_example/domain/usecases/user_profile/get_user_profile_usecase.dart';
import 'package:flutter_marketplace_example/presentation/profile/bloc/user_profile_state.dart';
import 'package:flutter_marketplace_example/service_locator.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  UserProfileCubit() : super(UserProfileLoading());

  Future<void> getUserProfile() async {
    try {
      final returnedUserProfile = await sl<GetUserProfileUsecase>().call();

      returnedUserProfile.fold(
        (l) => emit(UserProfileLoadFailed(l.toString())),
        (r) => emit(UserProfileLoaded(r)),
      );
    } catch (e) {
      emit(UserProfileLoadFailed(e.toString()));
    }
  }
}
