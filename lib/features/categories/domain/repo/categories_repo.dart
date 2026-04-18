import 'package:musa/features/categories/domain/entites/category.dart';
abstract class CategoriesRepo {
  Future<List<Category>> getAllCategories();
}