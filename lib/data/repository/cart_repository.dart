import 'package:musa/data/datasource/local/cart_local_datasource.dart';
import 'package:musa/data/models/product_model.dart';
import 'package:collection/collection.dart';
import 'package:musa/main.dart';

class CartRepository {
  CartRepository({required this.cartDataSource});
  CartLocalDataSource cartDataSource;
  List<ProductModel> fetchAllCarts() {
    return cartDataSource.getAllItems();
  }

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

  void deleteCart(ProductModel productModel) {
    cartDataSource.delete(productModel);
  }

  void updateCart(ProductModel productModel, int quantity) {
    cartDataSource.updateCart(productModel, quantity);
  }

  void decreaseCart(ProductModel product) {
    if (product.quantity > 1) {
      product.quantity -= 1;
      cartDataSource.updateCart(product, product.quantity);
    } else if (product.quantity == 1) {
      cartDataSource.delete(product);
    }
  }

  double totalPrice() {
    return cartDataSource.getTotalPrice();
  }

  int itemQuntity(ProductModel productModel) {
    return cartDataSource.getItemQuntity(productModel);
  }
}
