import 'package:musa/core/shared/product.dart';
import 'package:musa/core/shared/product_model.dart';
import 'package:musa/features/home/data/data_source/remote/product_remote_ds.dart';
import 'package:musa/features/home/domain/repo/products_repo.dart';

class ProductRepoImpl implements ProductsRepo {
  final ProductsRemoteDataSource remoteDS;
  ProductRepoImpl({required this.remoteDS});
  @override
  Future<List<Product>> getAllProducts({required String url}) async {
    final products = await remoteDS.getAllProducts(url: url);
    return products.map<Product>((product) {
      return ProductModel.fromJson(product).toEntity();
    }).toList();
  }

  @override
  Future<List<Product>> searchProducts({required String query}) async {
    final products = await remoteDS.getAllProducts(
      url: 'https://dummyjson.com/products/search?q=$query',
    );
    return products.map<Product>((product) {
      return ProductModel.fromJson(product).toEntity();
    }).toList();
  }

  @override
  Future<List<Product>> getProductsByCategory({
    required String category,
  }) async {
    final products = await remoteDS.getProductsByCategory(category: category);
    return products.map<Product>((product) {
      return ProductModel.fromJson(product).toEntity();
    }).toList();
  }
}
