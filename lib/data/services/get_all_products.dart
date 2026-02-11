import 'package:musa/data/helper/api.dart';

class GetAllProductsServics {
  Future<List<dynamic>> getAllProducts({required String url}) async {
    final producats = await Api().get(url: url);
    return producats['products'];
  }
}
