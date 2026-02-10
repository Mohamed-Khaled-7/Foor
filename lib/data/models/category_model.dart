class CategoryModel {
  final String name;
  final String url;
  final String image;
  final String slug;

  CategoryModel({
    required this.name,
    required this.url,
    required this.image,
    required this.slug,
  });

  static const Map<String, String> _categoryImages = {
    "beauty":
        "https://images.pexels.com/photos/3373739/pexels-photo-3373739.jpeg?auto=compress&cs=tinysrgb&w=400",
    "fragrances":
        "https://images.pexels.com/photos/965989/pexels-photo-965989.jpeg?auto=compress&cs=tinysrgb&w=400",
    "furniture":
        "https://images.pexels.com/photos/1350789/pexels-photo-1350789.jpeg?auto=compress&cs=tinysrgb&w=400",
    "groceries":
        "https://images.pexels.com/photos/219794/pexels-photo-219794.jpeg?auto=compress&cs=tinysrgb&w=400",
    "home-decoration":
        "https://images.pexels.com/photos/1090638/pexels-photo-1090638.jpeg?auto=compress&cs=tinysrgb&w=400",
    "kitchen-accessories":
        "https://images.pexels.com/photos/1080721/pexels-photo-1080721.jpeg?auto=compress&cs=tinysrgb&w=400",
    "laptops":
        "https://images.pexels.com/photos/18105/pexels-photo.jpg?auto=compress&cs=tinysrgb&w=400",
    "mens-shirts":
        "https://images.pexels.com/photos/297933/pexels-photo-297933.jpeg?auto=compress&cs=tinysrgb&w=400",
    "mens-shoes":
        "https://images.pexels.com/photos/292999/pexels-photo-292999.jpeg?auto=compress&cs=tinysrgb&w=400",
    "mens-watches":
        "https://images.pexels.com/photos/380782/pexels-photo-380782.jpeg?auto=compress&cs=tinysrgb&w=400",
    "mobile-accessories":
        "https://images.pexels.com/photos/607812/pexels-photo-607812.jpeg?auto=compress&cs=tinysrgb&w=400",
    "motorcycle":
        "https://cdn.pixabay.com/photo/2016/04/07/06/53/bmw-1313343_1280.jpg",
    "skin-care":
        "https://images.pexels.com/photos/3762875/pexels-photo-3762875.jpeg?auto=compress&cs=tinysrgb&w=400",
    "smartphones":
        "https://images.pexels.com/photos/607812/pexels-photo-607812.jpeg?auto=compress&cs=tinysrgb&w=400",
    "sports-accessories":
        "https://images.pexels.com/photos/1311518/pexels-photo-1311518.jpeg?auto=compress&cs=tinysrgb&w=400",
    "sunglasses":
        "https://images.pexels.com/photos/46710/pexels-photo-46710.jpeg?auto=compress&cs=tinysrgb&w=400",
    "tablets":
        "https://images.pexels.com/photos/1334597/pexels-photo-1334597.jpeg?auto=compress&cs=tinysrgb&w=400",
    "tops":
        "https://images.pexels.com/photos/994517/pexels-photo-994517.jpeg?auto=compress&cs=tinysrgb&w=400",
    "vehicle":
        "https://images.pexels.com/photos/170811/pexels-photo-170811.jpeg?auto=compress&cs=tinysrgb&w=400",
    "womens-bags":
        "https://images.pexels.com/photos/1152077/pexels-photo-1152077.jpeg?auto=compress&cs=tinysrgb&w=400",
    "womens-dresses":
        "https://images.pexels.com/photos/985635/pexels-photo-985635.jpeg?auto=compress&cs=tinysrgb&w=400",
    "womens-jewellery":
        "https://images.pexels.com/photos/1458867/pexels-photo-1458867.jpeg?auto=compress&cs=tinysrgb&w=400",
    "womens-shoes":
        "https://images.pexels.com/photos/137603/pexels-photo-137603.jpeg?auto=compress&cs=tinysrgb&w=400",
    "womens-watches":
        "https://images.pexels.com/photos/236907/pexels-photo-236907.jpeg?auto=compress&cs=tinysrgb&w=400",
  };

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    String slugValue = json['slug'] ?? "";
    return CategoryModel(
      name: json['name'] ?? "",
      url: json['url'] ?? "",
      slug: slugValue,
      image: _categoryImages[slugValue] ?? "https://via.placeholder.com/400",
    );
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'url': url, 'slug': slug, 'image': image};
  }
}
