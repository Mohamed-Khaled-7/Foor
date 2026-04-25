import 'package:musa/core/shared/product.dart';
import 'package:musa/core/shared/product_model.dart';

abstract class CartRepository {
  List<ProductModel> fetchAllCarts();
  void addCart(Product product);
  void deleteCart(Product product);
  void updateCart(Product product, int quantity);
  void decreaseCart(Product product);
  double totalPrice();
  int itemQuantity(Product product);
  String  getItemCount();
}