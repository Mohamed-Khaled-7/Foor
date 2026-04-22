// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:musa/core/shared/product_model.dart';
import 'package:musa/features/cart/data/data_source/local/cart_local_datasource.dart';
import 'package:musa/features/cart/domain/repo/cart_repo.dart';

class CartRepoImpl implements CartRepository {
  CartLocalDataSource cartDataSource;
  CartRepoImpl({required this.cartDataSource});

  @override
  void addCart(ProductModel product) {
    final items = cartDataSource.getAllItems();
    ProductModel? existingItem;
    for (var item in items) {
      if (item.id == product.id) {
        existingItem = item;
        break;
      }
    }
    if (existingItem != null) {
      existingItem.quantity += 1;
      cartDataSource.updateCart(existingItem, existingItem.quantity);
    } else {
      product.quantity = 1;
      cartDataSource.addToCart(product);
    }
  }

  @override
  void decreaseCart(ProductModel product) {
    if (product.quantity > 1) {
      product.quantity -= 1;
      cartDataSource.updateCart(product, product.quantity);
    } else if (product.quantity == 1) {
      cartDataSource.delete(product);
    }
  }

  @override
  void deleteCart(ProductModel productModel) {
    cartDataSource.delete(productModel);
  }

  @override
  List<ProductModel> fetchAllCarts() {
    return cartDataSource.getAllItems();
  }

  @override
  String getItemCount() {
    return cartDataSource.getItemCount();
  }

  @override
  int itemQuantity(ProductModel productModel) {
    return cartDataSource.getItemQuntity(productModel);
  }

  @override
  void updateCart(ProductModel productModel, int quantity) {
    cartDataSource.updateCart(productModel, quantity);
  }

  @override
  double totalPrice() {
    return cartDataSource.getTotalPrice();
  }
}
