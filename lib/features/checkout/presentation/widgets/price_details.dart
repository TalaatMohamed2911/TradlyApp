import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tradly/features/cart/presentation/provider/cart_provider.dart';

class PriceDetails extends StatelessWidget {
  const PriceDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),

      color: Colors.white,

      padding: const EdgeInsets.all(16),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          const Text(
            'Price Details',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),

          const SizedBox(height: 12),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Consumer(
                builder: (context, ref, child) => Text(
                  'Price (${ref.read(cartProvider.notifier).totalItems} Item)',
                  style: TextStyle(fontSize: 12, color: Colors.black),
                ),
              ),

              Consumer(
                builder: (context, ref, child) => Text(
                  '\$ ${ref.read(cartProvider.notifier).totalPrice}',
                  style: TextStyle(fontSize: 12, color: Colors.black),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
