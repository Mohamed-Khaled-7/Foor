import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musa/data/models/product_model.dart';
import 'package:musa/data/repository/get_all_products_repo.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit({required this.repo}) : super(ProductsInitial());

  GetAllProductsRepo repo;
  late List<ProductModel> products;
  List<ProductModel> productsSearched = [];
  void searcheProducts(String query) {
    if (query.isEmpty) {
      productsSearched = products;
    } else {
      productsSearched = products
          .where(
            (product) =>
                product.title.toLowerCase().contains(
                  query.toLowerCase(),
                ) ||
                product.description.toLowerCase().contains(
                  query.toLowerCase(),
                ),
          )
          .toList();
      emit(SearchedSuccess(SearchedProducts: productsSearched));
    }
  }
Future<void>getAllProducts({required String url}) async{
    try {
      repo.getAllProductsRepository(url: url).then((products) {
        emit(ProductsLoaded(products: products));
        this.products = products;
      });
    } on Exception catch (e) {
      emit(ProductsError(errMessage: e.toString()));
    }
  }
}
