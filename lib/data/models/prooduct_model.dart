class ProductModel {
  final int id;
  final String title;
  final double price;
  final double rating;
  final String thumbnail;
  final String category;
  final double discountPercentage;

  ProductModel({
    required this.discountPercentage,
    required this.id,
    required this.title,
    required this.price,
    required this.rating,
    required this.thumbnail,
    required this.category,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      discountPercentage: json['discountPercentage'],
      id: json['id'],
      title: json['title'],
      price: (json['price'] as num).toDouble(),
      rating: (json['rating'] as num).toDouble(),
      thumbnail: json['thumbnail'],
      category: json['category'],
    );
  }
}
