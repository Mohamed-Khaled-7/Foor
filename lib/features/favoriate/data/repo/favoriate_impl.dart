import 'package:musa/core/shared/product.dart';
import 'package:musa/core/shared/product_model.dart';
import 'package:musa/features/favoriate/data/data_source/local/favoriate_local.dart';
import 'package:musa/features/favoriate/domain/repo/favoriate_repo.dart';

class FavoriateRepositoryImpl implements FavoriteRepository {
  final FavoriateLocalDataSoure favoriateDS;
  FavoriateRepositoryImpl({required this.favoriateDS});
  @override
  void addOrRemoveFav(Product product) {
    final model = ProductModel.fromEntity(product);
    favoriateDS.addOrRemoveFav(model);
  }

  @override
  List<Product> getAllFav() {
    final favs = favoriateDS.getAllFav();
    return favs.map((model) => model.toEntity()).toList();
  }

  @override
  bool isFav(Product product) {
    final model = ProductModel.fromEntity(product);
    return favoriateDS.isFav(model);
  }
}
