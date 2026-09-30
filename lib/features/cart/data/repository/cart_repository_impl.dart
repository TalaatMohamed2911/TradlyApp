import 'package:tradly/features/cart/data/data_source/cart_local_data_source.dart';
import 'package:tradly/features/cart/data/model/cart_item_model.dart';
import 'package:tradly/features/cart/data/model/cart_product_model.dart';
import 'package:tradly/features/cart/domain/entity/cart_item.dart';
import 'package:tradly/features/cart/domain/repository/cart_repository.dart';
import 'package:tradly/features/products/domain/entity/dimensions.dart';
import 'package:tradly/features/products/domain/entity/product.dart';
import 'package:tradly/features/products/domain/entity/product_meta.dart';

class CartRepositoryImpl implements CartRepository {
  final CartLocalDataSource _cartLocalDataSource;

  CartRepositoryImpl(this._cartLocalDataSource);

  @override
  Future<void> saveCart(List<CartItem> cart) async {
    final cartModels = cart.map((item) {
      return CartItemModel(
        product: CartProductModel(
          id: item.product.id,
          title: item.product.title,
          price: item.product.price,
          thumbnail: item.product.thumbnail,
        ),
        quantity: item.quantity,
      );
    }).toList();
    await _cartLocalDataSource.saveCart(cartModels);
  }

  @override
  List<CartItem> getCart() {
    final cartModels = _cartLocalDataSource.getCart();
    return cartModels.map((item) {
      return CartItem(
        product: Product(
          id: item.product.id,
          title: item.product.title,
          price: item.product.price,
          thumbnail: item.product.thumbnail,
          description: '',
          category: '',
          discountPercentage: 1,
          rating: 1,
          stock: 1,
          tags: [],
          sku: '',
          weight: 1,
          dimensions: Dimensions(width: 1, height: 1, depth: 1),
          warrantyInformation: '',
          shippingInformation: '',
          availabilityStatus: '',
          reviews: [],
          returnPolicy: '',
          minimumOrderQuantity: 1,
          meta: ProductMeta(
            createdAt: "createdAt",
            updatedAt: "updatedAt",
            barcode: "barcode",
            qrCode: "qrCode",
          ),
          images: [],
        ),
        quantity: item.quantity,
      );
    }).toList();
  }

  @override
  Future<void> clearCart() async {
    await _cartLocalDataSource.clearCart();
  }
}
