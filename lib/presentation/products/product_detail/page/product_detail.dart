import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_marketplace_example/domain/entities/products/products_entity.dart';
import 'package:flutter_marketplace_example/presentation/products/product_detail/bloc/product_detail_cubit.dart';
import 'package:flutter_marketplace_example/presentation/products/product_detail/bloc/product_detail_state.dart';

class ProductDetail extends StatelessWidget {
  final int id;

  const ProductDetail({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductDetailCubit()..getProductDetail(id),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Product Detail'),
        ),
        body: BlocBuilder<ProductDetailCubit, ProductDetailState>(
          builder: (context, state) {
            if (state is ProductDetailLoading) {
              return const CircularProgressIndicator();
            } else if (state is ProductDetailLoaded) {
              return _productDetailContent(state.product);
            } else if (state is ProductDetailLoadFailed) {
              return Text(state.message);
            }
            return const SizedBox.shrink(); // Default widget
          },
        ),
      ),
    );
  }

  Widget _productDetailContent(ProductEntity productDetail) {
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
                backgroundImage: NetworkImage(productDetail.images?.first ??
                    'https://via.placeholder.com/150'),
              ),
              const SizedBox(
                  width: 25), // Add some spacing between the avatar and text
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Name: ${productDetail.title}' ?? 'No name available',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 10,
                  ),
                  Text('Price: ${productDetail.price}' ?? 'No price available',
                      style: const TextStyle(fontSize: 16)),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                      'Description: ${productDetail.description}' ??
                          'No description available',
                      style: const TextStyle(fontSize: 16)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
