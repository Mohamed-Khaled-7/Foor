part of 'products_cubit.dart';

sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsLoaded extends ProductsState {
  final List<ProductModel> products;
  ProductsLoaded({required this.products});
}

class ProductsError extends ProductsState {
  final String errMessage;
  ProductsError({required this.errMessage});
}

class SearchedSuccess extends ProductsState {
 final List<ProductModel> SearchedProducts;
  SearchedSuccess({required this.SearchedProducts});
}
