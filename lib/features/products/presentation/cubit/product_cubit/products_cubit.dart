import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:musa/features/products/domain/repository/products_repo.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit({required this.repo}) : super(ProductsInitial());
  final ProductsRepo repo;
  Future<void> getAllProducts() async {
    try {
      emit(ProductsLoading());
      final products = await repo.getProducts(
        url: 'https://dummyjson.com/products',
      );
      emit(ProductsLoaded(products: products));
    } on Exception catch (e) {
      emit(ProductsError(errMessage: e.toString()));
    }
  }

  Future<void> getProductsByCategory({required String url}) async {
    try {
      emit(ProductsLoading());

      final products = await repo.getProducts(
        url: url,
      );

      emit(ProductsLoaded(products: products));
    } catch (e) {
      emit(ProductsError(errMessage: e.toString()));
    }
  }
}
