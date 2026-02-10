import 'package:musa/data/helper/api.dart';

class GetAllProductsServics {
  Future<List<dynamic>> getAllProducts({required String url}) async {
    List<dynamic> producats = await Api().get(url: url);
    return producats;
  }
}
