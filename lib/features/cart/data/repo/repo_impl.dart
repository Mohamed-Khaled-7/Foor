// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:musa/core/shared/product.dart';
import 'package:musa/core/shared/product_model.dart';
import 'package:musa/features/cart/data/data_source/local/cart_local_datasource.dart';
import 'package:musa/features/cart/domain/repo/cart_repo.dart';

class CartRepoImpl implements CartRepository {
  CartLocalDataSource cartDataSource;
  CartRepoImpl({required this.cartDataSource});

  @override
  void addCart(Product product) {
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
    } else{
      existingItem!.quantity = 1;
      cartDataSource.addToCart(existingItem);
    }
  }
  @override
  void decreaseCart(Product product) {
    final model = ProductModel.fromEntity(product);
    if (model.quantity > 1) {
      model.quantity -= 1;
      cartDataSource.updateCart(model, model.quantity);
    } else if (model.quantity == 1) {
      cartDataSource.delete(model);
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
