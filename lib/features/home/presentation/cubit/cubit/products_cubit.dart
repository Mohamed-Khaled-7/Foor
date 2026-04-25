import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:musa/core/shared/product.dart';
import 'package:musa/features/home/domain/entites/category.dart';
import 'package:musa/features/home/domain/repo/products_repo.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit({required this.repo}) : super(ProductsInitial());
  ProductsRepo repo;
  List<Product> products = [];
  List<CategoryEntitey> categories = [];
  Future<void> getAllProducts() async {
    try {
      emit(ProductsLoading());
      products = await repo.getAllProducts(
        url: 'https://dummyjson.com/products',
      );
      emit(ProductsLoaded(products: products));
    } on Exception catch (e) {
      emit(ProductsError(errMessage: e.toString()));
    }
  }

  Future<void> searchProducts({required String query}) async {
    try {
      emit(SearchLoading());
      final products = await repo.searchProducts(query: query);
      emit(SearchLoaded(results: products));
    } on Exception catch (e) {
      emit(SearchError(errMessage: e.toString()));
    }
  }

  Future<void> getProductsByCategory({required String category}) async {
    try {
      emit(ProductsLoading());
      final products = await repo.getProductsByCategory(category: category);
      emit(ProductsLoaded(products: products));
    } on Exception catch (e) {
      emit(ProductsError(errMessage: e.toString()));
    }
  }
}
