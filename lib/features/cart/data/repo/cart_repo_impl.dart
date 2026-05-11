// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:musa/core/shared/product.dart';
import 'package:musa/core/shared/product_model.dart';
import 'package:musa/features/cart/data/data_source/local/cart_local_datasource.dart';
import 'package:musa/features/cart/domain/repo/cart_repo.dart';
import 'package:collection/collection.dart';

class CartRepoImpl implements CartRepository {
  CartLocalDataSource cartDataSource;
  CartRepoImpl({required this.cartDataSource});

  @override
  @override
  void addCart(Product product) {
    final items = cartDataSource.getAllItems();
    final existingItem = items.firstWhereOrNull(
      (item) => item.id == product.id,
    );
    if (existingItem != null) {
      existingItem.quantity += 1;
      cartDataSource.updateCart(existingItem, existingItem.quantity);
    } else {
      final newModel = ProductModel.fromEntity(product)..quantity = 1;
      cartDataSource.addToCart(newModel);
    }
  }

  @override
  void decreaseCart(Product product) {
    final items = cartDataSource.getAllItems();
    final existingItem = items.firstWhereOrNull(
      (item) => item.id == product.id,
    );
    if (existingItem == null)return;
    else {
      if (existingItem.quantity > 1) {
        existingItem.quantity -= 1;
        cartDataSource.updateCart(existingItem, existingItem.quantity);
      } else {
        cartDataSource.delete(existingItem);
      }
    }
  }

  @override
  void deleteCart(Product product) {
    final model = ProductModel.fromEntity(product);
    cartDataSource.delete(model);
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
  int itemQuantity(Product product) {
    final model = ProductModel.fromEntity(product);
    return cartDataSource.getItemQuntity(model);
  }

  @override
  void updateCart(Product product, int quantity) {
    final model = ProductModel.fromEntity(product);
    cartDataSource.updateCart(model, quantity);
  }

  @override
  double totalPrice() {
    return cartDataSource.getTotalPrice();
  }
}
