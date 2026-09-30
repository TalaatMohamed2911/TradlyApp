import 'package:tradly/features/cart/data/model/cart_item_model.dart';

abstract class CartRepository {
  Future<void> saveCart(CartItemModel item);

  List<CartItemModel> getCart();

  Future<void> clearCart();
}
