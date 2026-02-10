import 'package:musa/data/helper/api.dart';
import 'package:musa/data/models/prooduct_model.dart';

class GetAllProductsServics {
 Future<List<dynamic>> getAllProducts() async{
    List<dynamic>producats=await Api().get(url:'');
    return producats;
  }
}
