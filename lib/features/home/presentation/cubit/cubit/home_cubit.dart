import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:musa/core/shared/product.dart';
import 'package:musa/features/home/domain/entites/category.dart';
import 'package:musa/features/home/domain/repo/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.repo}) : super(HomeInitial());
  HomeRepo repo;
  List<Product> products = [];
  List<CategoryEntitey> categories = [];
  Future<void> getAllProducts() async {
    try {
      emit(HomeLoading());
       products = await repo.getAllProducts(
        url: 'https://dummyjson.com/products',
      );
      emit(HomeLoaded(products: products, categories: categories));
    } on Exception catch (e) {
      emit(HomeError(errMessage: e.toString()));
    }
  }

  Future<void> getProductsByCategory({required String url}) async {
    try {
      emit(HomeLoading());

       products = await repo.getAllProducts(url: url);

      emit(HomeLoaded(products: products, categories:categories));
    } catch (e) {
      emit(HomeError(errMessage: e.toString()));
    }
  }

  Future<void> getAllCategories() async {
    try {
      emit(HomeLoading());
       categories = await repo.getAllCategories();
      emit(HomeLoaded(products: products, categories: categories));
    } on Exception catch (e) {
      emit(HomeError(errMessage: e.toString()));
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
}
