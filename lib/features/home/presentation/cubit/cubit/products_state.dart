part of 'products_cubit.dart';

@immutable
abstract class ProductsState {}

class ProductsInitial extends ProductsState {}

class ProductsLoaded extends ProductsState {
  final List<Product> products;
  ProductsLoaded({required this.products});
}

class ProductsError extends ProductsState {
  final String errMessage;

  ProductsError({required this.errMessage});
}

class ProductsLoading extends ProductsState {}

// search states
class SearchLoading extends ProductsState {}

class SearchLoaded extends ProductsState {
  final List<Product> results;

  SearchLoaded({required this.results});
}

class SearchError extends ProductsState {
  final String errMessage;

  SearchError({required this.errMessage});
}
