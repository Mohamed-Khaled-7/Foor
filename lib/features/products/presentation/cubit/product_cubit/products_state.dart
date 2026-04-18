part of 'products_cubit.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}
final class ProductsLoaded extends ProductsState {
  final List products;
  ProductsLoaded({required this.products});
}
final class ProductsError extends ProductsState {
  final String errMessage;
  ProductsError({required this.errMessage});
}
final class ProductsLoading extends ProductsState {}
