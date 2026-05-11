import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musa/core/shared/product.dart';
import 'package:musa/features/favoriate/domain/repo/favoriate_repo.dart';
part 'favoriate_state.dart';

class FavoriateCubit extends Cubit<FavoriateState> {
  FavoriateCubit({required this.favoriteRepository})
    : super(FavoriateInitial());
  final FavoriteRepository favoriteRepository;
  void getAllFavoriates() {
    emit(FavoriateLoading());
    try {
      final favs = favoriteRepository.getAllFav();
      emit(FavoriateLoaded(products: favs));
    } catch (e) {
      emit(FavoriateError(errMessage: e.toString()));
    }
  }

  void addOrRemoveFav(Product product) {
    favoriteRepository.addOrRemoveFav(product);
    getAllFavoriates();
  }

  bool isFav(Product product) {
    return favoriteRepository.isFav(product);
  }
}
