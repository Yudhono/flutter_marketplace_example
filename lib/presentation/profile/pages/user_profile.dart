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
        appBar: AppBar(
          title: const Text('My Profile'),
        ),
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(
                    userProfile.avatar ?? 'https://via.placeholder.com/150'),
              ),
              const SizedBox(
                  width: 25), // Add some spacing between the avatar and text
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Name: ${userProfile.name}' ?? 'No name available',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      )),
                  Text(
                    'Email: ${userProfile.email}' ?? 'No email available',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
