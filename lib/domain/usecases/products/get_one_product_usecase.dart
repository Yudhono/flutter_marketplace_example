import 'package:dartz/dartz.dart';
import 'package:flutter_marketplace_example/core/usecase/usecase.dart';
import 'package:flutter_marketplace_example/domain/repository/products/product_repository.dart';
import 'package:flutter_marketplace_example/service_locator.dart';

class GetOneProductUsecase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({dynamic params}) async {
    return sl<ProductRepository>().getProductById(params);
  }
}
