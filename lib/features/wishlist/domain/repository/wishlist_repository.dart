import 'package:tradly/features/wishlist/domain/entity/wishlist_product.dart';

abstract class WishlistRepository {
  Future<void> saveWishlist(List<WishlistProduct> products);

  List<WishlistProduct> getWishlist();

  Future<void> clearWishlist();
}
