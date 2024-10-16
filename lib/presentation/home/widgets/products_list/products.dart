import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_marketplace_example/presentation/home/widgets/products_list/bloc/products_list_cubit.dart';
import 'package:flutter_marketplace_example/presentation/home/widgets/products_list/bloc/products_list_state.dart';

class ProductsListWidget extends StatefulWidget {
  @override
  _ProductsListWidgetState createState() => _ProductsListWidgetState();
}

class _ProductsListWidgetState extends State<ProductsListWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    context.read<ProductsListCubit>().getProducts(); // Initial load
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      final currentState = context.read<ProductsListCubit>().state;
      if (currentState is ProductsListLoaded &&
          !currentState.isLoadingNextPage) {
        context
            .read<ProductsListCubit>()
            .getProducts(offset: currentState.products.length);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProductsListCubit, ProductsListState>(
        builder: (context, state) {
          if (state is ProductsListLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductsListLoaded) {
            return ListView.builder(
              controller: _scrollController,
              itemCount:
                  state.products.length + (state.isLoadingNextPage ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == state.products.length) {
                  return const Center(
                      child: Column(
                    children: [
                      CircularProgressIndicator(),
                      Text('Loading more products...'),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ));
                }
                final product = state.products[index];
                return ListTile(
                  title: Text(product.title ?? 'No Title'),
                  subtitle: Text(product.description ?? 'No Description'),
                );
              },
            );
          } else if (state is ProductsListLoadFailed) {
            return Center(
                child: Text('Failed to load products: ${state.error}'));
          }
          return Container();
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
