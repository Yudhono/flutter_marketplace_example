import 'package:flutter_marketplace_example/domain/entities/products/products_entity.dart';

abstract class ProductsListState {}

class ProductsListLoading extends ProductsListState {}

class ProductsListLoaded extends ProductsListState {
  final List<ProductEntity> products;
  final bool isLoadingNextPage;

  ProductsListLoaded(this.products, {this.isLoadingNextPage = false});
}

class ProductsListLoadFailed extends ProductsListState {
  final String error;

  ProductsListLoadFailed(this.error);
}
