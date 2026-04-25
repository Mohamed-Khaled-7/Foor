import 'package:musa/core/utils/api.dart';

class CategoryRemoteDataSource {
   Future<dynamic> getAllCategories() async {
    final categories = await Api().get(
      url: 'https://dummyjson.com/products/categories',
    );
    return categories;
  }
}