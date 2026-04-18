import 'package:musa/features/products/data/models/product_model.dart';

abstract class CartRepository {
  List<ProductModel> fetchAllCarts();
  void addCart(ProductModel product);
  void deleteCart(ProductModel product);
  void updateCart(ProductModel product, int quantity);
  void decreaseCart(ProductModel product);
  double totalPrice();
  int itemQuntity(ProductModel product);
  String  getItemCount();
}