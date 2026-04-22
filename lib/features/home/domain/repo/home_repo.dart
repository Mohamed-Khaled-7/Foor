import 'package:musa/features/home/domain/entites/category.dart';
import 'package:musa/features/home/domain/entites/product.dart';

abstract class HomeRepo {
  Future<List<Product>> getAllProducts({required String url});
  Future<List<CategoryEntitey>> getAllCategories();
  Future<List<Product>> searchProducts({required String query});
}
