import 'package:dartz/dartz.dart';
import 'package:flutter_marketplace_example/domain/entities/products/products_entity.dart';

abstract class ProductRepository {
  Future<Either<String, List<ProductEntity>>> getProducts(
      {int offset, int limit});
}
