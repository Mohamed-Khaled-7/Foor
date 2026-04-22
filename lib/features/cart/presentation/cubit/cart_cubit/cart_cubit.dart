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
    final model = ProductModel.fromEntity(product);
    cartRepository.addCart(model);
    fetchAllCarts();
  }

  void decreaseCart(Product product) {
    final model = ProductModel.fromEntity(product);
    cartRepository.decreaseCart(model);
    fetchAllCarts();
  }

  void updateCart(Product product, int quantity) {
    final model = ProductModel.fromEntity(product);
    cartRepository.updateCart(model, quantity);
    fetchAllCarts();
  }

  void deleteCart(Product product) {
    final model = ProductModel.fromEntity(product);
    cartRepository.deleteCart(model);
    fetchAllCarts();
  }

  double totalPrice() => cartRepository.totalPrice();
  int itemQuantity(Product productModel) {
    final model = ProductModel.fromEntity(productModel);
    return cartRepository.itemQuantity(model);
  }

  String getItemCount() {
    return cartRepository.getItemCount();
  }
}
