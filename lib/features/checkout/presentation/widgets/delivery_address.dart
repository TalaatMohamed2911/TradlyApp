import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tradly/features/checkout/presentation/provider/address_provider.dart';

class DeliveryAddress extends ConsumerWidget {
  const DeliveryAddress({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final address = ref.watch(addressProvider);

    return Container(
      margin: const EdgeInsets.only(top: 8),

      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),

      color: Colors.white,

      child: Row(
        children: [
          Expanded(
            child: address == null
                ? const Text(
                    'No address selected',
                    style: TextStyle(fontSize: 12),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text(
                        'Deliver to ${address.name}',
                        style: const TextStyle(fontSize: 12),
                      ),

                      const SizedBox(height: 4),

                      Text(
                        '${address.name}, ${address.city}',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
          ),

          ElevatedButton(
            onPressed: () {
              // Change address
            },

            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff359884),

              foregroundColor: Colors.white,

              elevation: 0,

              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),

              minimumSize: Size.zero,

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),

            child: const Text('Change', style: TextStyle(fontSize: 12)),
          ),
        ],
      ),
    );
  }
}
