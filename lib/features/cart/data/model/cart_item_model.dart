import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:tradly/features/cart/data/model/cart_product_model.dart';

part 'cart_item_model.g.dart';

@HiveType(typeId: 2)
class CartItemModel extends HiveObject {
  @HiveField(0)
  final CartProductModel product;

  @HiveField(1)
  final int quantity;

  CartItemModel({required this.product, required this.quantity});
}
