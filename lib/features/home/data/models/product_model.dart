import 'package:hive/hive.dart';
import 'package:musa/core/shared/product.dart';

class ProductModel extends HiveObject {
  final int id;
  final String title;
  final double price;
  final double rating;
  final String thumbnail;
  final String category;
  final double discountPercentage;
  final String description;
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
      category:category,
      rating: rating,
      description: description,
      id: id,
      discountPercentage: discountPercentage,
      image: thumbnail,
      title: title,
      price: price,
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
