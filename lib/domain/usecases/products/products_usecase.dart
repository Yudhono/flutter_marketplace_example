import 'package:dartz/dartz.dart';
import 'package:flutter_marketplace_example/core/usecase/usecase.dart';
import 'package:flutter_marketplace_example/domain/repository/products/product_repository.dart';
import 'package:flutter_marketplace_example/service_locator.dart';

class GetProductsUsecase implements UseCase<Either, GetProductsParams> {
  @override
  Future<Either> call({GetProductsParams? params}) async {
    return sl<ProductRepository>()
        .getProducts(offset: params!.offset, limit: params.limit);
  }
}

class GetProductsParams {
  final int offset;
  final int limit;

  GetProductsParams({required this.offset, required this.limit});
}
