import 'package:flutter_marketplace_example/domain/entities/products/products_entity.dart';

abstract class ProductsListState {}

class ProductsListLoading extends ProductsListState {}

class ProductsListLoaded extends ProductsListState {
  final List<ProductEntity> products;

  ProductsListLoaded(this.products);
}

class ProductsListLoadFailed extends ProductsListState {
  final String message;

  ProductsListLoadFailed(this.message);
}
