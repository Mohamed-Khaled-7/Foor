import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musa/features/favoriate/domain/repo/favoriate_repo.dart';
part 'favoriate_state.dart';

class FavoriateCubit extends Cubit<FavoriateState> {
  FavoriateCubit(this.favoriteRepository) : super(FavoriateInitial());
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

  void addOrRemoveFav(product) {
    favoriteRepository.addOrRemoveFav(product);
    getAllFavoriates();
  }

  bool isFav(product) {
    return favoriteRepository.isFav(product);
  }
}
