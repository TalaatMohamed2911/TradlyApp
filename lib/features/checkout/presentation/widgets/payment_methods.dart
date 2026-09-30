import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/payment_provider.dart';

class PaymentMethods extends ConsumerWidget {
  const PaymentMethods({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedPayment = ref.watch(paymentMethodProvider);

    return Container(
      margin: const EdgeInsets.only(top: 5),
      color: Colors.white,

      child: Column(
        children: [
          _PaymentOption(
            title: 'Debit / Credit Card',
            value: 'Debit / Credit Card',
            selectedPayment: selectedPayment,
          ),

          _divider(),

          _PaymentOption(
            title: 'Netbanking',
            value: 'Netbanking',
            selectedPayment: selectedPayment,
          ),

          _divider(),

          _PaymentOption(
            title: 'Cash on Delivery',
            value: 'Cash on Delivery',
            selectedPayment: selectedPayment,
          ),

          _divider(),

          _PaymentOption(
            title: 'Wallet',
            value: 'Wallet',
            selectedPayment: selectedPayment,
          ),
        ],
      ),
    );
  }

  Widget _divider() {
    return Divider(height: 1, thickness: 0.5, color: Colors.grey.shade200);
  }
}

class _PaymentOption extends ConsumerWidget {
  final String title;
  final String value;
  final String selectedPayment;

  const _PaymentOption({
    required this.title,
    required this.value,
    required this.selectedPayment,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSelected = selectedPayment == value;

    return InkWell(
      onTap: () {
        ref.read(paymentMethodProvider.notifier).selectPaymentMethod(value);
      },

      child: Container(
        height: 44,

        padding: const EdgeInsets.symmetric(horizontal: 20),

        child: Row(
          children: [
            Container(
              width: 14,
              height: 14,

              decoration: BoxDecoration(
                shape: BoxShape.circle,

                border: Border.all(
                  color: isSelected
                      ? const Color(0xff20B897)
                      : Colors.grey.shade300,
                ),
              ),

              child: isSelected
                  ? Center(
                      child: Container(
                        width: 7,
                        height: 7,

                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff20B897),
                        ),
                      ),
                    )
                  : null,
            ),

            const SizedBox(width: 8),

            Text(
              title,
              style: const TextStyle(fontSize: 12, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
