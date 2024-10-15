import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_marketplace_example/domain/entities/user_profile/user_profile_entity.dart';
import 'package:flutter_marketplace_example/presentation/profile/bloc/user_profile_cubit.dart';
import 'package:flutter_marketplace_example/presentation/profile/bloc/user_profile_state.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserProfileCubit()..getUserProfile(),
      child: Scaffold(
        body: Center(
          child: BlocBuilder<UserProfileCubit, UserProfileState>(
            builder: (context, state) {
              if (state is UserProfileLoading) {
                return const CircularProgressIndicator();
              } else if (state is UserProfileLoaded) {
                return _userProfileDetail(state.userProfile);
              } else if (state is UserProfileLoadFailed) {
                return Text(state.message);
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }

  Widget _userProfileDetail(UserProfileEntity userProfile) {
    return Column(
      children: [
        Text(userProfile.name ?? 'No name available'),
        Text(userProfile.email ?? 'No email available'),
        Text(userProfile.role ?? 'No role available'),
      ],
    );
  }
}
