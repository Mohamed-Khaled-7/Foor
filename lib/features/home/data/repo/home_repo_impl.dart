import 'package:musa/core/shared/product.dart';
import 'package:musa/core/shared/product_model.dart';
import 'package:musa/features/home/data/data_source/remote/home_remote_ds.dart';
import 'package:musa/features/home/data/models/category_model.dart';
import 'package:musa/features/home/domain/entites/category.dart';
import 'package:musa/features/home/domain/repo/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDS remoteDS;
  HomeRepoImpl({required this.remoteDS});
  @override
  Future<List<Product>> getAllProducts({required String url}) async {
    final products = await remoteDS.getAllProducts(url: url);
    return products.map<Product>((product) {
      return ProductModel.fromJson(product).toEntity();
    }).toList();
  }

  @override
  Future<List<CategoryEntitey>> getAllCategories() async {
    final categories = await remoteDS.getAllCategories();
    return categories
        .map<CategoryEntitey>(
          (categoery) => CategoryModel.fromJson(categoery).toEntity(),
        )
        .toList();
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
}
