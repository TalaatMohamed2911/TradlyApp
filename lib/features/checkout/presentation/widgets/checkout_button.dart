import 'package:flutter/material.dart';

class CheckoutButton extends StatelessWidget {
  const CheckoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,

      padding: const EdgeInsets.fromLTRB(36, 10, 36, 18),

      child: SizedBox(
        width: double.infinity,
        height: 38,

        child: ElevatedButton(
          onPressed: () {
            // Checkout
          },

          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xffA9D8CF),

            foregroundColor: Colors.white,

            elevation: 0,

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),

          child: const Text(
            'Checkout',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
