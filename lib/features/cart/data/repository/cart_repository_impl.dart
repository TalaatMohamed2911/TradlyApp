import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:tradly/features/cart/data/model/cart_item_model.dart';
import 'package:tradly/features/cart/domain/repository/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  final Box<CartItemModel> cartBox;

  CartRepositoryImpl(this.cartBox);

  @override
  Future<void> saveCart(CartItemModel item) async {
    await cartBox.put(item.product.id, item);
  }

  @override
  List<CartItemModel> getCart() {
    return cartBox.values.toList();
  }

  @override
  Future<void> clearCart() async {
    await cartBox.clear();
  }
}
