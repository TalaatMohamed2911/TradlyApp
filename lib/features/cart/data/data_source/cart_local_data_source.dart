import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:tradly/features/cart/data/model/cart_item_model_adapter.dart';

import '../model/cart_item_model.dart';

class CartLocalDataSource {
  static const String boxName = 'cartBox';

  Future<void> init() async {
    Hive.registerAdapter(CartItemModelAdapter());

    await Hive.openBox<CartItemModel>(boxName);
  }

  Box get _box => Hive.box(boxName);

  Future<void> saveCart(List<CartItemModel> cart) async {
    await _box.put('cart', cart);
  }

  List<CartItemModel> getCart() {
    final data = _box.get('cart');

    if (data == null) {
      return [];
    }

    return data;
  }

  Future<void> clearCart() async {
    await _box.delete('cart');
  }
}
