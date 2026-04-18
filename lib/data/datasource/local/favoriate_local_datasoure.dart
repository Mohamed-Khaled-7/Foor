import 'package:hive_flutter/adapters.dart';
import 'package:musa/core/const/const.dart';
import 'package:musa/data/models/product_model.dart';

class FavoriateLocalDatasoure {
  var favBox = Hive.box<ProductModel>(FavoritesBox);
  void addOrRemoveFav(ProductModel productModel) {
    if (favBox.containsKey(productModel.id)) {
      favBox.delete(productModel.id);
    } else {
      favBox.put(productModel.id, productModel);
    }
  }
  bool isFav(ProductModel productModel) {
    return favBox.containsKey(productModel.id);
  }
 List<ProductModel> getAllFav()=>favBox.values.toList();
}