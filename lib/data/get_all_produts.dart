import 'package:musa/data/helper/helper.dart';
import 'package:musa/data/models/poductModel.dart';

class GetAllProduts {
  Future<List<Productmodel>> getAllProducts() async {
    List<dynamic> data = await Api().get(
      url: 'https://fakestoreapi.com/products',
    );
    List<Productmodel> productsLit = [];
    for (int i = 0; i < data.length; i++) {
      productsLit.add(Productmodel.fromjson(data[i]));
    }
    return productsLit;
  }
}
