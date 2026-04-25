import 'package:musa/core/shared/product.dart';

abstract class ProductsRepo {
  Future<List<Product>> getAllProducts({required String url});
  Future<List<Product>> searchProducts({required String query});
  Future<List<Product>> getProductsByCategory({required String category});
}