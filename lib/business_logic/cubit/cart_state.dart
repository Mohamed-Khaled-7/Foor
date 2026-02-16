part of 'cart_cubit.dart';

sealed class CartState {}

final class CartInitial extends CartState {}
class CartLoaded extends CartState {
  final List<ProductModel> cartItems;
  CartLoaded({required this.cartItems});
}
class CartEmpty extends CartState {}
