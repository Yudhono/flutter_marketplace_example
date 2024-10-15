import 'package:flutter_marketplace_example/domain/entities/products/products_entity.dart';

class CategoryModel {
  int? id;
  String? name;
  String? image;
  String? creationAt;
  String? updatedAt;

  CategoryModel({
    this.id,
    this.name,
    this.image,
    this.creationAt,
    this.updatedAt,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      creationAt: json['creationAt'],
      updatedAt: json['updatedAt'],
    );
  }
}

class ProductModel {
  int? id;
  String? title;
  int? price;
  String? description;
  List<String>? images;
  String? creationAt;
  String? updatedAt;
  CategoryModel? category;

  ProductModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.images,
    this.creationAt,
    this.updatedAt,
    this.category,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      description: json['description'],
      images: List<String>.from(json['images']),
      creationAt: json['creationAt'],
      updatedAt: json['updatedAt'],
      category: CategoryModel.fromJson(json['category']),
    );
  }
}

extension ProductModelX on ProductModel {
  ProductEntity toEntity() {
    return ProductEntity(
      id: id,
      title: title,
      price: price,
      description: description,
      images: images,
      creationAt: creationAt,
      updatedAt: updatedAt,
      category: category?.toEntity(),
    );
  }
}

extension CategoryModelX on CategoryModel {
  Category toEntity() {
    return Category(
      id: id,
      name: name,
      image: image,
      creationAt: creationAt,
      updatedAt: updatedAt,
    );
  }
}
