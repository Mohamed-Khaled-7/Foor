import 'package:musa/data/models/category_model.dart';
import 'package:musa/data/services/get_all_categories.dart';

class CategoriesRepository {
  final GetAllCategoriesServices getAllCategoriesServices;
  CategoriesRepository({required this.getAllCategoriesServices});
  Future<List<CategoryModel>> getAllCharacters() async {
    final categories = await getAllCategoriesServices.getAllCategories();
    return categories
        .map((category) => CategoryModel.fromJson(category))
        .toList();
  }
}
