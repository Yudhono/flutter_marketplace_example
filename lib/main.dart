import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_marketplace_example/presentation/auth/pages/signin.dart';
import 'package:flutter_marketplace_example/presentation/home/widgets/products_list/bloc/products_list_cubit.dart';
import 'package:flutter_marketplace_example/service_locator.dart';

void main() async {
  await initializeDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ProductsListCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Marketplace Example',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SigninPage(),
      ),
    );
  }
}
