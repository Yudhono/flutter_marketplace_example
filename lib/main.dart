import 'package:flutter/material.dart';
import 'package:flutter_marketplace_example/presentation/auth/pages/signin.dart';
import 'package:flutter_marketplace_example/service_locator.dart';

void main() async {
  await initializeDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(body: SigninPage()),
    );
  }
}
