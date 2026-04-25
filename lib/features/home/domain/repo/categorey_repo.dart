import 'package:musa/features/home/domain/entites/category.dart';

abstract class CategoreyRepo {
  Future<List<CategoryEntitey>> getAllCategories();
}