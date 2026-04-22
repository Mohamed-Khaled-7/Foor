import 'package:musa/core/utils/api.dart';

class HomeRemoteDS{
  Future<dynamic> getAllProducts({required String url}) async {
    final products = await Api().get(url: url);
    return products['products'];
  }
 
  Future<dynamic> getAllCategories() async {
    final categories = await Api().get(
      url: 'https://dummyjson.com/products/categories',
    );
    return categories;
  }
}