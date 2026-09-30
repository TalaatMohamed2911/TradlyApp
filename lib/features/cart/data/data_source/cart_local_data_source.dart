import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import '../model/cart_item_model.dart';

class CartLocalDataSource {
  static const String boxName = 'cartBox';

  Future<void> init() async {
    await Hive.openBox<CartItemModel>(boxName);
  }

  Box<CartItemModel> get _box => Hive.box<CartItemModel>(boxName);

  Future<void> saveCart(List<CartItemModel> cart) async {
    await _box.clear();
    await _box.addAll(cart);
  }

  List<CartItemModel> getCart() {
    return _box.values.toList();
  }

  Future<void> clearCart() async {
    await _box.clear();
  }
}
