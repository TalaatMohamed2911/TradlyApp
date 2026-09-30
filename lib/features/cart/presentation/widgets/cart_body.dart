import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tradly/features/checkout/domain/entity/address.dart';
import 'package:tradly/features/checkout/presentation/screen/address_view.dart';
import 'package:tradly/features/cart/presentation/widgets/items_widget.dart';
import 'package:tradly/features/cart/domain/entity/cart_item.dart';
import 'package:tradly/features/cart/presentation/provider/cart_provider.dart';
import 'package:tradly/features/checkout/presentation/screen/payment_option_screen.dart';

class CartBody extends StatelessWidget {
  const CartBody({super.key, required this.cart, required this.address});

  final List<CartItem> cart;
  final Address? address;

  @override
  Widget build(BuildContext context) {
    final hasAddress = address != null;
    return Column(
      children: [
        /// Content
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                /// Add New Address

                if (address == null)
                  Container(
                    width: double.infinity,
                    height: 55,
                    color: Colors.white,
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const AddAddressScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        '+ Add New Address',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  )
                else
                  ListTile(
                    title: Text(hasAddress ? address!.name : ""),
                    subtitle: Text(
                      '${hasAddress ? address!.streetAddress : ""}, ${hasAddress ? address!.city : ""}\n'
                      '${hasAddress ? address!.phone : ""}',
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        // هنضيف Edit Address بعدين
                      },
                    ),
                  ),

                /// Space
                const SizedBox(height: 10),

                /// Cart Item
                CartItemWidget(cart: cart),

                /// Space
                const SizedBox(height: 10),

                /// Price Details
                Container(
                  width: double.infinity,
                  color: Colors.white,
                  padding: const EdgeInsets.fromLTRB(16, 22, 16, 22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Price Details',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      const SizedBox(height: 20),

                      /// Product Price
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Consumer(
                            builder: (context, ref, child) => Text(
                              'Price ( ${ref.read(cartProvider.notifier).totalItems} item)',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Consumer(
                            builder: (context, ref, child) => Text(
                              '\$${(ref.read(cartProvider.notifier).subtotal).toStringAsFixed(0)}',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 18),

                      /// Delivery
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Delivery Fee',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),

                          Consumer(
                            builder: (context, ref, child) => Text(
                              "\$${ref.read(cartProvider.notifier).deliveryFee}",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      const Divider(color: Color(0xFFEEEEEE)),

                      const SizedBox(height: 12),

                      /// Total
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Total Amount',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),

                          Consumer(
                            builder: (context, ref, child) => Text(
                              '\$${ref.read(cartProvider.notifier).totalPrice.toStringAsFixed(0)}',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 130),
              ],
            ),
          ),
        ),

        /// Bottom Payment Button
        Container(
          color: Colors.white,

          padding: const EdgeInsets.fromLTRB(32, 14, 32, 24),

          child: SizedBox(
            width: double.infinity,
            height: 52,

            child: ElevatedButton(
              onPressed: hasAddress
                  ? () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => PaymentOptionScreen(),
                        ),
                      );
                    }
                  : null,

              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFA9D7D0),

                elevation: 0,

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),

              child: const Text(
                'Continue to Payment',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
