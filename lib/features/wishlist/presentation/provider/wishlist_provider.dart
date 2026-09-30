import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tradly/features/products/domain/entity/product.dart';

class WishListProducts extends Notifier<List<Product>> {
  @override
  List<Product> build() {
    return [];
  }

  void toogleFavourite(Product product) {
    final newState = [...state];

    final isFavourite = newState.any((element) => element.id == product.id);

    if (isFavourite) {
      newState.removeWhere((element) => element.id == product.id);
    } else {
      newState.add(product);
    }
    state = newState;
  }
}

final wishListProvider = NotifierProvider<WishListProducts, List<Product>>(
  WishListProducts.new,
);
