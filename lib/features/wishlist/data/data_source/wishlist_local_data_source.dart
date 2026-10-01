import 'package:hive_ce/hive_ce.dart';
import 'package:tradly/features/wishlist/data/model/wishlist_product_model.dart';

class WishlistLocalDataSource {
  static const String boxName = 'wishlistBox';

  Future<void> init() async {
    await Hive.openBox<WishlistProductModel>(boxName);
  }

  Box<WishlistProductModel> get _box => Hive.box<WishlistProductModel>(boxName);

  Future<void> saveWishlist(List<WishlistProductModel> products) async {
    await _box.clear();
    await _box.addAll(products);
  }

  List<WishlistProductModel> getWishlist() => _box.values.toList();

  Future<void> clearWishlist() async => await _box.clear();
}
