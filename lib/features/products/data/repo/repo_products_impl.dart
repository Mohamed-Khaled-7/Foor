
import 'package:musa/features/products/data/data_source/remote/get_all_products.dart';
import 'package:musa/features/products/data/models/product_model.dart';
import 'package:musa/features/products/domain/entities/product.dart';
import 'package:musa/features/products/domain/repository/products_repo.dart';

class ProductsImpl implements ProductsRepo {
  final GetAllProductsDataSource productsDS;
  ProductsImpl({ required this.productsDS});
  @override
  Future<List<Product>> getProducts({required String url}) async {
    final products = await productsDS.getAllProducts(url: url);
    return products.map<Product>((product) {
      return ProductModel.fromJson(product).toEntity();
    }).toList();
  }
}