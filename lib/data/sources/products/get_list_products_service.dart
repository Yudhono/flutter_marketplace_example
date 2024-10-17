import 'package:dartz/dartz.dart';
import 'package:flutter_marketplace_example/data/models/products/product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class GetListProductsService {
  Future<Either<String, List<ProductModel>>> getProducts(
      {int offset, int limit});

  Future<Either<String, ProductModel>> getProductById(int id);
}

class GetListProductsServiceImpl implements GetListProductsService {
  @override
  Future<Either<String, List<ProductModel>>> getProducts(
      {int offset = 0, int limit = 10}) async {
    try {
      final response = await http.get(
        Uri.parse(
            'https://api.escuelajs.co/api/v1/products/?offset=$offset&limit=$limit'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        final List<ProductModel> products =
            data.map((item) => ProductModel.fromJson(item)).toList();
        return Right(products);
      } else {
        return Left('Failed to fetch products: ${response.reasonPhrase}');
      }
    } catch (e) {
      return Left('An error occurred: $e');
    }
  }

  @override
  Future<Either<String, ProductModel>> getProductById(int id) async {
    try {
      final response = await http.get(
        Uri.parse('https://api.escuelajs.co/api/v1/products/$id'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final product = ProductModel.fromJson(data);
        return Right(product);
      } else {
        return Left('Failed to fetch product: ${response.reasonPhrase}');
      }
    } catch (e) {
      return Left('An error occurred: $e');
    }
  }
}
