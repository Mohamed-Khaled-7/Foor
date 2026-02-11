import 'package:hive_flutter/adapters.dart';
import 'package:musa/const/const.dart';
import 'package:musa/data/models/product_model.dart';

class FavController {
  var FavBox = Hive.box<ProductModel>(FavoritesBox);
  addOrRemoveFav(ProductModel productModel) {
    if(FavBox.containsKey(productModel.id)){
      FavBox.delete(productModel.id);
    }else{
      FavBox.put(productModel.id, productModel); 
    }
  }
  bool isFav(ProductModel productModel){
    return FavBox.containsKey(productModel.id);
  }
  getAllFav(ProductModel productModel){
    return FavBox.values.toList();
  }
}