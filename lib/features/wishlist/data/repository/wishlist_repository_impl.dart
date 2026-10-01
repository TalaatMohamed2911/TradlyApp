import 'package:tradly/features/wishlist/data/data_source/wishlist_local_data_source.dart';
import 'package:tradly/features/wishlist/data/model/wishlist_product_model.dart';
import 'package:tradly/features/wishlist/domain/entity/wishlist_product.dart';
import 'package:tradly/features/wishlist/domain/repository/wishlist_repository.dart';

class WishlistRepositoryImpl implements WishlistRepository {
  final WishlistLocalDataSource _localDataSource;
  WishlistRepositoryImpl(this._localDataSource);

  @override
  Future<void> saveWishlist(List<WishlistProduct> products) async {
    final models = products.map((product) {
      return WishlistProductModel(
        id: product.id,
        title: product.title,
        price: product.price,
        thumbnail: product.thumbnail,
      );
    }).toList();
    await _localDataSource.saveWishlist(models);
  }

  @override
  List<WishlistProduct> getWishlist() {
    final models = _localDataSource.getWishlist();
    return models.map((product) {
      return WishlistProduct(
        id: product.id,
        title: product.title,
        price: product.price,
        thumbnail: product.thumbnail,
      );
    }).toList();
  }

  @override
  Future<void> clearWishlist() {
    return _localDataSource.clearWishlist();
  }
}
