import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musa/core/shared/product.dart';
import 'package:musa/core/shared/product_model.dart';
import 'package:musa/features/cart/domain/repo/cart_repo.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit({required this.cartRepository}) : super(CartInitial());
  CartRepository cartRepository;
  void fetchAllCarts() {
    emit(CartLoading());
    final items = cartRepository.fetchAllCarts();
    if (items.isEmpty) {
      emit(CartEmpty());
    } else {
      emit(CartLoaded(cartItems: items));
    }
  }

  void addCart(Product product) {
    cartRepository.addCart(product);
    fetchAllCarts();
  }

  void decreaseCart(Product product) {
    cartRepository.decreaseCart(product);
    fetchAllCarts();
  }

  void updateCart(Product product, int quantity) {
    cartRepository.updateCart(product, quantity);
    fetchAllCarts();
  }

  void deleteCart(Product product) {
    cartRepository.deleteCart(product);
    fetchAllCarts();
  }

  double totalPrice() => cartRepository.totalPrice();
  int itemQuantity(Product product) {
    return cartRepository.itemQuantity(product);
  }

  String getItemCount() {
    return cartRepository.getItemCount();
  }
}
