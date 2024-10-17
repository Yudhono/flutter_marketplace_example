import 'package:flutter_marketplace_example/domain/entities/products/products_entity.dart';

abstract class ProductDetailState {}

class ProductDetailLoading extends ProductDetailState {}

class ProductDetailLoaded extends ProductDetailState {
  final ProductEntity product;

  ProductDetailLoaded(this.product);
}

class ProductDetailLoadFailed extends ProductDetailState {
  final String message;

  ProductDetailLoadFailed(this.message);
}
