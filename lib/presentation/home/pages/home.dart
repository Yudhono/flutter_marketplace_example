import 'package:flutter/material.dart';
import 'package:flutter_marketplace_example/presentation/profile/pages/user_profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const UserProfilePage()),
              );
            },
            icon: const Icon(Icons.person),
          )
        ],
      ),
      body: Center(
        child: Text('Home Page'),
      ),
    );
  }
}
