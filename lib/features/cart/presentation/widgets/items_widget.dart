import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tradly/features/cart/domain/entity/cart_item.dart';
import 'package:tradly/features/cart/presentation/provider/cart_provider.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({super.key, required this.cart});
  final List<CartItem> cart;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) => Container(
          color: Colors.white,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 20,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Product Image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        cart[index].product.thumbnail,
                        width: 108,
                        height: 108,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: 108,
                            height: 108,
                            color: Colors.grey.shade200,
                            child: const Icon(Icons.image, size: 40),
                          );
                        },
                      ),
                    ),

                    const SizedBox(width: 16),

                    /// Product Information
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 5),
                          Text(
                            cart[index].product.title,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),

                          const SizedBox(height: 10),

                          Row(
                            children: [
                              Text(
                                '\$${cart[index].product.price.toStringAsFixed(0)}',
                                style: const TextStyle(
                                  color: Color(0xFF329985),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(width: 14),

                              const Text(
                                '\$50',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),

                              const SizedBox(width: 5),

                              const Text(
                                '50% off',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 10),

                          /// Quantity
                          Row(
                            children: [
                              Consumer(
                                builder: (context, ref, child) {
                                  return Text(
                                    'Qty : ${ref.read(cartProvider.notifier).getQuantity(cart[index].product.id)}',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              /// Remove
              Container(
                width: double.infinity,
                height: 45,
                decoration: const BoxDecoration(
                  border: Border(top: BorderSide(color: Color(0xFFEEEEEE))),
                ),
                child: Consumer(
                  builder: (context, ref, child) => TextButton(
                    onPressed: () {
                      ref
                          .read(cartProvider.notifier)
                          .removeFromCart(cart[index].product.id);
                    },
                    child: const Text(
                      'Remove',
                      style: TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
