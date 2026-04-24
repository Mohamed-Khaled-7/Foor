import 'package:musa/core/shared/product.dart';
import 'package:musa/features/home/domain/entites/category.dart';

abstract class HomeRepo {
  Future<List<Product>> getAllProducts({required String url});
  Future<List<CategoryEntitey>> getAllCategories();
  Future<List<Product>> searchProducts({required String query});
}
