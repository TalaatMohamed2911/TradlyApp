import 'package:hive_ce_flutter/hive_ce_flutter.dart';
part 'cart_product_model.g.dart';

@HiveType(typeId: 1)
class CartProductModel extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final double price;
  @HiveField(3)
  final String thumbnail;

  CartProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.thumbnail,
  });
}
