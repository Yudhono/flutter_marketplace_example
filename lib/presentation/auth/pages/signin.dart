import 'package:flutter/material.dart';
import 'package:flutter_marketplace_example/common/helpers/shared_preferences_helper.dart';
import 'package:flutter_marketplace_example/data/models/auth/user_signin_request.dart';
import 'package:flutter_marketplace_example/domain/usecases/auth/signin.dart';
import 'package:flutter_marketplace_example/service_locator.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _emailField(context),
            const SizedBox(height: 16),
            _passwordField(context),
            ElevatedButton(
              onPressed: () async {
                final result = await sl<SignInUseCase>().call(
                  params: UserSigninRequest(
                    email: _emailController.text,
                    password: _passwordController.text,
                  ),
                );
                print('result isRight: ${result.isRight()}');
                print('result isLeft: ${result.isLeft()}');
                if (result.isRight()) {
                  final sharedPreferencesHelper = sl<SharedPreferencesHelper>();
                  final accessToken =
                      await sharedPreferencesHelper.getAccessToken();
                  final refreshToken =
                      await sharedPreferencesHelper.getRefreshToken();
                  print('Access Token: $accessToken');
                  print('Refresh Token: $refreshToken');
                } else {
                  // Show error message
                }
              },
              child: const Text('Sign In'),
            ),
          ],
        ),
      ),
    ));
  }

  Widget _emailField(BuildContext context) {
    return TextField(
      controller: _emailController,
      decoration: const InputDecoration(
        hintText: 'Email',
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _passwordField(BuildContext context) {
    return TextField(
      controller: _passwordController,
      decoration: const InputDecoration(
        hintText: 'Password',
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }
}
