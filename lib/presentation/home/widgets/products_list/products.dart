import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_marketplace_example/common/helpers/add_dot_after_characters.dart';
import 'package:flutter_marketplace_example/domain/entities/products/products_entity.dart';
import 'package:flutter_marketplace_example/presentation/home/widgets/products_list/bloc/products_list_cubit.dart';
import 'package:flutter_marketplace_example/presentation/home/widgets/products_list/bloc/products_list_state.dart';
import 'package:flutter_marketplace_example/presentation/products/product_detail/page/product_detail.dart';

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
            return GridView.builder(
              controller: _scrollController,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 350,
                crossAxisCount: 2, // Number of columns
                childAspectRatio: 0.75, // Adjust the aspect ratio as needed
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
              ),
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
                return _productItemsTile(product);
              },
            );
          } else if (state is ProductsListLoadFailed) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: Text('Failed to load products: ${state.error}')),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget _productItemsTile(ProductEntity product) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetail(id: product.id!),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              product.images!.first,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 5),
            Text(
              addDotAfterCharacters(product.title ?? 'No Title', 32),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '\$ ${product.price}',
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Add to Cart'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
