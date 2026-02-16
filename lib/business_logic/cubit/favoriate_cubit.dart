import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:musa/const/const.dart';
import 'package:musa/data/models/product_model.dart';
import 'package:musa/data/repository/favoriate_repository.dart';

part 'favoriate_state.dart';

class FavoriateCubit extends Cubit<FavoriateState> {
  FavoriateCubit({required this.favoriateRepository})
    : super(FavoriateInitial());
  FavoriateRepository favoriateRepository;
  var FavBox = Hive.box<ProductModel>(FavoritesBox);
  void addOrRemoveFav(ProductModel productModel) {
    favoriateRepository.addOrRemoveFav(productModel);
    getAllFav(productModel);
  }
  bool isFav(ProductModel productModel) {
    return FavBox.containsKey(productModel.id);
  }
  void getAllFav(ProductModel productModel) {
    var items = FavBox.values.toList();

    emit(FavoriateLoaded(items: items));
  }
}
