import 'package:musa/features/products/domain/entities/category.dart';
import 'package:musa/features/products/domain/entities/product.dart';
 
abstract class ProductsRepo {
  Future<List<Product>> getProducts({required String url});
}