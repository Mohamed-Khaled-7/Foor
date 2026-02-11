import 'package:musa/data/models/product_model.dart';
import 'package:musa/data/services/get_all_products.dart';

class GetAllProductsRepo {
  GetAllProductsServics getAllProductsServics;
  GetAllProductsRepo({required this.getAllProductsServics});
  Future<List<ProductModel>> getAllProductsRepository({
    required String url,
  }) async {
    final products = await getAllProductsServics.getAllProducts(url: url);
    return products
        .map<ProductModel>((json) => ProductModel.fromJson(json))
        .toList();
  }
}
