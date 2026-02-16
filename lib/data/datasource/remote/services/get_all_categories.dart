import 'package:musa/data/helper/api.dart';

class GetAllCategoriesServices {
  Future<List<dynamic>> getAllCategories() async {
    List<dynamic> categories = await Api().get(
      url: 'https://dummyjson.com/products/categories',
    );
    return categories;
  }
}
