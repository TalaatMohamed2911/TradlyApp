import 'package:hive_ce/hive_ce.dart';
part 'wishlist_product_model.g.dart';

@HiveType(typeId: 3)
class WishlistProductModel extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final double price;
  @HiveField(3)
  final String thumbnail;

  WishlistProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.thumbnail,
  });
}
