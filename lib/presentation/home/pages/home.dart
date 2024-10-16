import 'package:flutter/material.dart';
import 'package:flutter_marketplace_example/presentation/profile/pages/user_profile.dart';
import 'package:flutter_marketplace_example/presentation/home/widgets/products_list/products.dart'; // Import the ProductsPage

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
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: ProductsListWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
