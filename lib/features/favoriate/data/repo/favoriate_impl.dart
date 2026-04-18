import 'package:musa/features/favoriate/data/data_source/local/favoriate_local.dart';
import 'package:musa/features/favoriate/domain/repo/favoriate_repo.dart';
import 'package:musa/features/products/data/models/product_model.dart';

class FavoriateRepositoryImpl implements FavoriteRepository {
  final FavoriateLocalDatasoure favoriateLD;
  FavoriateRepositoryImpl({required this.favoriateLD});
  @override
  void addOrRemoveFav(ProductModel productModel) {
    favoriateLD.addOrRemoveFav(productModel);
  }

  @override
  List<ProductModel> getAllFav() {
    return favoriateLD.getAllFav();
  }

  @override
  bool isFav(ProductModel productModel) {
    return favoriateLD.isFav(productModel);
  }
}
