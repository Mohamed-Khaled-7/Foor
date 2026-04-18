import 'package:dio/dio.dart';
import 'package:musa/data/helper/api.dart';

class GetAllCategoriesDataSource {
  final Dio dio;
  GetAllCategoriesDataSource({required this.dio});
  Future<List<dynamic>> getAllCategories() async {
    final categories = await Api().get(
      url: 'https://dummyjson.com/products/categories',
    );
    return categories;
  }
}