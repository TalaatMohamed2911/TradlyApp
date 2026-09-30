import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tradly/core/di/di.dart';
import 'package:tradly/features/cart/domain/repository/cart_repository.dart';
import 'package:tradly/features/products/domain/entity/product.dart';
import 'package:tradly/features/cart/domain/entity/cart_item.dart';

class CartNotifier extends Notifier<List<CartItem>> {
  final CartRepository _cartRepository = instance();

  @override
  List<CartItem> build() {
    return _cartRepository.getCart();
  }

  void addToCart(Product product) async {
    final newList = [...state];

    final index = newList.indexWhere(
      (cartItem) => cartItem.product.id == product.id,
    );
    // لو موجود
    if (index != -1) {
      // هاته وزود الكميه ب واحد
      final item = newList[index];

      newList[index] = item.copyWith(quantity: item.quantity + 1);
    } else {
      // لو موش موجود ضيفه عندي
      newList.add(CartItem(product: product, quantity: 1));
    }
    state = newList;

    await _cartRepository.saveCart(state);
  }

  void removeFromCart(int productId) async {
    final newList = [...state];

    newList.removeWhere((cartItem) => cartItem.product.id == productId);

    state = newList;

    await _cartRepository.saveCart(state);
  }

  void increaseQuantity(int productId) async {
    final newList = [...state];
    final index = newList.indexWhere(
      (cartItem) => cartItem.product.id == productId,
    );
    // لو مش موجود اخرج متعملش حاجه
    if (index == -1) {
      return;
    }
    // لو موجود هاته وزود الكميه بواحد
    final item = newList[index];
    newList[index] = item.copyWith(quantity: item.quantity + 1);

    state = newList;

    await _cartRepository.saveCart(state);
  }

  void decreaseQuantity(int productId) async {
    final newList = [...state];
    final index = newList.indexWhere(
      (cartItem) => cartItem.product.id == productId,
    );
    // لو مش موجود اخرج ومتعملش حاجه
    if (index == -1) {
      return;
    }
    // لو موجود هاته وشوف لو الكمية اكبر من واحد نقص غير كدا امسحه
    final item = newList[index];
    if (item.quantity > 1) {
      newList[index] = item.copyWith(quantity: item.quantity - 1);
    } else {
      newList.removeAt(index);
    }
    state = newList;

    await _cartRepository.saveCart(state);
  }

  // Clear cart
  Future<void> clearCart() async {
    state = [];
    await _cartRepository.clearCart();
  }

  // Set specific quantity
  void setQuantity(int productId, int quantity) async {
    if (quantity <= 0) {
      removeFromCart(productId);
      return;
    }

    final newList = [...state];

    final index = newList.indexWhere((item) => item.product.id == productId);

    if (index == -1) {
      return;
    }

    final item = newList[index];

    newList[index] = item.copyWith(quantity: quantity);

    state = newList;

    await _cartRepository.saveCart(state);
  }

  // Check if product exists in cart
  bool isInCart(int productId) {
    return state.any((item) => item.product.id == productId);
  }

  // Get quantity of product
  int getQuantity(int productId) {
    final index = state.indexWhere((item) => item.product.id == productId);

    if (index == -1) {
      return 0;
    }

    return state[index].quantity;
  }

  // Total number of products عدد المنتجات كلها
  int get totalItems {
    return state.fold(0, (total, item) => total + item.quantity);
  }

  // Subtotal
  double get subtotal {
    return state.fold(0, (total, item) {
      return total + (item.product.price * item.quantity);
    });
  }

  // Delivery fee
  double get deliveryFee => 0;

  // Total price
  double get totalPrice {
    return subtotal + deliveryFee;
  }
}

final cartProvider = NotifierProvider<CartNotifier, List<CartItem>>(
  CartNotifier.new,
);
