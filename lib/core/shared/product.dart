class Product {
  final double discountPercentage;
  final String image;
  final String title;
  final double price;
  final String description;
  final num rating;
  final int id;
  final String category;
  final num quantity;
  Product({
    required this.quantity,
    required this.category,
    required this.rating,
    required this.description,
    required this.id,
    required this.discountPercentage,
    required this.image,
    required this.title,
    required this.price,
  });
}
