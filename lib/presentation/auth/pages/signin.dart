import 'package:flutter/material.dart';
import 'package:flutter_marketplace_example/data/models/auth/user_signin_request.dart';
import 'package:flutter_marketplace_example/domain/usecases/auth/signin.dart';
import 'package:flutter_marketplace_example/presentation/home/pages/home.dart';
import 'package:flutter_marketplace_example/presentation/profile/pages/user_profile.dart';
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
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const SizedBox(
              height: 150,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome Back,',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('Sign in to continue',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      )),
                ],
              ),
            ),
            const SizedBox(height: 75),
            _emailField(context),
            const SizedBox(height: 16),
            _passwordField(context),
            const SizedBox(height: 60),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  final result = await sl<SignInUseCase>().call(
                    params: UserSigninRequest(
                      email: _emailController.text,
                      password: _passwordController.text,
                    ),
                  );
                  if (result.isRight()) {
                    // Navigate to profile page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  } else {
                    // Show error message
                  }
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: const Color(0xFFFFFFFF), // Text color
                  backgroundColor: const Color(0xFF8C8CEC), // Background color
                  padding: const EdgeInsets.symmetric(
                      horizontal: 17, vertical: 10), // Padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // Rounded corners
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Don\'t have an account?'),
                TextButton(
                  onPressed: () {
                    // Navigate to sign up page
                  },
                  child: const Text('Sign Up'),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            )
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
