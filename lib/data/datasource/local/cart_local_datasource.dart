import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:musa/const/const.dart';
import 'package:musa/data/models/product_model.dart';

class CartLocalDataSource {
  var cartBox = Hive.box<ProductModel>(CartBox);
  void addToCart(ProductModel productModel) {
    productModel.quantity = 1;
    cartBox.put(productModel.id, productModel);
  }

  void delete(ProductModel productModel) {
    if (cartBox.containsKey(productModel.id)) {
      cartBox.delete(productModel.id);
    }
  }

  void updateCart(ProductModel productModel, int quantity) {
    productModel.quantity = quantity;
    cartBox.put(productModel.id, productModel);
  }

  double getTotalPrice() {
    double totalPrice = 0;
    for (var item in cartBox.values) {
      totalPrice += (item.price * (item.quantity));
    }
    return totalPrice;
  }

  getAllItems() {
    var cartItems = cartBox.values.toList();
    return cartItems;
  }

  int getItemQuntity(ProductModel productModel) {
    if (cartBox.containsKey(productModel.id)) {
      return cartBox.get(productModel.id)!.quantity;
    } else {
      return 0;
    }
  }
}
