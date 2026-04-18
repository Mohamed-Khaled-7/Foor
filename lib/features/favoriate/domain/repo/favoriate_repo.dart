import 'package:musa/features/products/data/models/product_model.dart';

abstract class FavoriteRepository {
  void addOrRemoveFav(ProductModel productModel);

  bool isFav(ProductModel productModel);

  List<ProductModel> getAllFav();
}