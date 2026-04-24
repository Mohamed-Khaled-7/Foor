import 'package:musa/core/shared/product.dart';

abstract class FavoriteRepository {
  void addOrRemoveFav(Product product);
  bool isFav(Product product);
  List<Product> getAllFav();
}
