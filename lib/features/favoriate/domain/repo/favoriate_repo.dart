

import 'package:musa/features/favoriate/domain/entites/favoriate.dart';

abstract class FavoriteRepository {
  void addOrRemoveFav(Product product);

  bool isFav(Product product);

  List<Product> getAllFav();
}