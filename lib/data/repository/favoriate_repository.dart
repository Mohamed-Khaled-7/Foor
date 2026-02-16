// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive_flutter/adapters.dart';

import 'package:musa/const/const.dart';
import 'package:musa/data/datasource/local/favoriate_local_datasoure.dart';
import 'package:musa/data/models/product_model.dart';

class FavoriateRepository {
  FavoriateLocalDatasoure favoriateLocalDatasoure;
  FavoriateRepository({required this.favoriateLocalDatasoure});
  var FavBox = Hive.box<ProductModel>(FavoritesBox);
  void addOrRemoveFav(ProductModel productModel) {
    if (FavBox.containsKey(productModel.id)) {
      FavBox.delete(productModel.id);
    } else {
      FavBox.put(productModel.id, productModel);
    }
  }

  bool isFav(ProductModel productModel) {
    return favoriateLocalDatasoure.isFav(productModel);
  }

  List<ProductModel>getAllFav(ProductModel productModel) {
    return FavBox.values.toList();
  }
}
