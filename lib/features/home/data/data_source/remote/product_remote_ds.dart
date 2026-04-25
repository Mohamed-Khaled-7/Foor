import 'package:musa/core/utils/api.dart';

class ProductsRemoteDataSource {
  Future<dynamic> getAllProducts({required String url}) async {
    final products = await Api().get(url: url);
    return products['products'];
  }
 
 
  Future<dynamic> getProductsByCategory({required String category})async{
    final products = await Api().get(url: 'https://dummyjson.com/products/category/$category');
    return products['products'];
  }
}