import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tradly/core/di/di.dart';
import 'package:tradly/features/products/domain/entity/product.dart';
import 'package:tradly/features/wishlist/domain/entity/wishlist_product.dart';
import 'package:tradly/features/wishlist/domain/repository/wishlist_repository.dart';

class WishListProducts extends Notifier<List<WishlistProduct>> {
  final _wishlistRepository = instance<WishlistRepository>();
  @override
  List<WishlistProduct> build() {
    return _wishlistRepository.getWishlist();
  }

  void toggleFavourite(Product product) async {
    final newState = [...state];
    final index = newState.indexWhere((item) => item.id == product.id);
    if (index != -1) {
      newState.removeAt(index);
    } else {
      newState.add(
        WishlistProduct(
          id: product.id,
          title: product.title,
          price: product.price,
          thumbnail: product.thumbnail,
        ),
      );
    }

    state = newState;
    await _wishlistRepository.saveWishlist(state);
  }

  bool isFavourite(int productId) {
    final isFavourite = state.any((product) => product.id == productId);
    return isFavourite;
  }

  Future<void> removeFromWishlist(int productId) async {
    final newList = [...state];
    newList.removeWhere((item) => item.id == productId);
    state = newList;
    await _wishlistRepository.saveWishlist(state);
  }

  Future<void> clearWishlist() async {
    state = [];
    await _wishlistRepository.clearWishlist();
  }
}

final wishListProvider =
    NotifierProvider<WishListProducts, List<WishlistProduct>>(
      WishListProducts.new,
    );
