import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_marketplace_example/presentation/products/bloc/products_list_cubit.dart';
import 'package:flutter_marketplace_example/presentation/products/bloc/products_list_state.dart';

class ProductsPage extends StatefulWidget {
  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final ScrollController _scrollController = ScrollController();
  int _offset = 0;
  final int _limit = 10;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _fetchProducts();
  }

  void _fetchProducts() {
    context
        .read<ProductsListCubit>()
        .getProducts(offset: _offset, limit: _limit);
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      setState(() {
        _offset += _limit;
      });
      _fetchProducts();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Products')),
      body: BlocBuilder<ProductsListCubit, ProductsListState>(
        builder: (context, state) {
          if (state is ProductsListLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductsListLoaded) {
            return ListView.builder(
              controller: _scrollController,
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                final product = state.products[index];
                return ListTile(
                  title: Text(product.title ?? 'No Title'),
                  subtitle: Text(product.description ?? 'No Description'),
                );
              },
            );
          } else if (state is ProductsListLoadFailed) {
            return Center(child: Text(state.message));
          }
          return const SizedBox();
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
