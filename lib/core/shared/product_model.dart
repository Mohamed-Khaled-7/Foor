import 'package:hive/hive.dart';
import 'package:musa/core/shared/product.dart';

part 'product_model.g.dart';

@HiveType(typeId: 0)
class ProductModel extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final double price;
  @HiveField(3)
  final double rating;
  @HiveField(4)
  final String thumbnail;
  @HiveField(5)
  final String category;
  @HiveField(6)
  final double discountPercentage;
  @HiveField(7)
  final String description;
  @HiveField(8)
  int quantity;
  ProductModel({
    this.quantity = 1,
    required this.description,
    required this.discountPercentage,
    required this.id,
    required this.title,
    required this.price,
    required this.rating,
    required this.thumbnail,
    required this.category,
  });
  Product toEntity() {
    return Product(
      quantity: quantity,
      category: category,
      rating: rating,
      description: description,
      id: id,
      discountPercentage: discountPercentage,
      image: thumbnail,
      title: title,
      price: price,
    );
  }

  factory ProductModel.fromEntity(Product entity) {
    return ProductModel(
      category: entity.category,
      id: entity.id,
      title: entity.title,
      price: entity.price,
      rating: entity.rating as double,
      thumbnail: entity.image,
      discountPercentage: entity.discountPercentage,
      description: entity.description,
    );
  }
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      description: json['description'],
      discountPercentage: (json['discountPercentage'] as num).toDouble(),
      id: json['id'],
      title: json['title'],
      price: (json['price'] as num).toDouble(),
      rating: (json['rating'] as num).toDouble(),
      thumbnail: json['thumbnail'],
      category: json['category'],
    );
  }
}
