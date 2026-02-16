import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musa/data/models/product_model.dart';
import 'package:musa/data/repository/cart_repository.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepository cartRepository;

  CartCubit({required this.cartRepository}) : super(CartInitial()) {
    fetchAllCarts();
  }
  void fetchAllCarts() {
    final items = cartRepository.fetchAllCarts();
    if (items.isEmpty) {
      emit(CartEmpty());
    } else {
      emit(CartLoaded(cartItems: items));
    }
  }

  void addCart(ProductModel product) {
    cartRepository.addCart(product);
    fetchAllCarts();
  }

  void decreaseCart(ProductModel product) {
    cartRepository.decreaseCart(product);
    fetchAllCarts();
  }

  void updateCart(ProductModel product, int quantity) {
    cartRepository.updateCart(product, quantity);
    fetchAllCarts();
  }

  void deleteCart(ProductModel product) {
    cartRepository.deleteCart(product);
    fetchAllCarts();
  }

  double totalPrice() => cartRepository.totalPrice();
  int itemQuntity(ProductModel productModel){
    return cartRepository.itemQuntity(productModel);
  }
}

