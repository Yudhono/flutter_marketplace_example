import 'package:dartz/dartz.dart';
import 'package:flutter_marketplace_example/data/models/products/product.dart';
import 'package:flutter_marketplace_example/data/sources/products/get_list_products_service.dart';
import 'package:flutter_marketplace_example/domain/entities/products/products_entity.dart';
import 'package:flutter_marketplace_example/domain/repository/products/product_repository.dart';
import 'package:flutter_marketplace_example/service_locator.dart';

class ProductRepositoryImplementation extends ProductRepository {
  @override
  Future<Either<String, List<ProductEntity>>> getProducts(
      {int offset = 0, int limit = 10}) async {
    final result = await sl<GetListProductsService>()
        .getProducts(offset: offset, limit: limit);
    return result.map((productModels) =>
        productModels.map((model) => model.toEntity()).toList());
  }
}
