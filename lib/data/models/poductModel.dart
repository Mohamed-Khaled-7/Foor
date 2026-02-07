class Productmodel {
  String title;
  String description;
  String image;
  double price;
  dynamic id;
  Productmodel({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
    required this.description,
  });
  factory Productmodel.fromjson(jsonData) {
    return Productmodel(
      id: jsonData['id'],
      title: jsonData['title'],
      description: jsonData['description'],
      price: jsonData['price'].toDouble(),
      image: jsonData['image'],
    );
  }
}
