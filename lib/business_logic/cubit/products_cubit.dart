import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:musa/data/models/prooduct_model.dart';
import 'package:musa/data/repository/get_all_products_repo.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit({required this.repo}) : super(ProductsInitial());
  GetAllProductsRepo repo;
  List<ProductModel> products = [];
  List<ProductModel> getAllProducts({required String url}) {
    try {
      repo.getAllProductsRepository(url: url).then((products) {
        emit(ProductsLoaded(products: products));
        this.products = products;
      });
      return products;
    } on Exception catch (e) {
      emit(ProductsError(errMessage: e.toString()));
      return [];
    }
  }
}
