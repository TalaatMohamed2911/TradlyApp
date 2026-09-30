import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:tradly/features/cart/data/model/cart_item_model.dart';

class CartItemModelAdapter extends TypeAdapter<CartItemModel> {
  @override
  CartItemModel read(BinaryReader reader) {
    return CartItemModel(product: reader.read(), quantity: reader.readInt());
  }

  @override
  int get typeId => 0;

  @override
  void write(BinaryWriter writer, CartItemModel obj) {
    writer.write(obj.product);
    writer.writeInt(obj.quantity);
  }
}
