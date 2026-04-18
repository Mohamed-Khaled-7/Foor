import 'package:musa/data/helper/api.dart';

class GetAllProductsDataSource {
  Future<dynamic> getAllProducts({required String url}) async {
    final products = await Api().get(url: url);
    return products['products'];
  }
}
