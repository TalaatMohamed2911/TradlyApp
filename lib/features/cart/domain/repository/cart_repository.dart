import 'package:tradly/features/cart/domain/entity/cart_item.dart';

abstract class CartRepository {
  Future<void> saveCart(List<CartItem> cart);

  List<CartItem> getCart();

  Future<void> clearCart();
}
