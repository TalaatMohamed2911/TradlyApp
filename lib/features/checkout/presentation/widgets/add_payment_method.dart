import 'package:flutter/material.dart';

class AddPaymentMethod extends StatelessWidget {
  const AddPaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,

      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),

      child: Column(
        children: [
          Container(
            height: 140,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: const Icon(Icons.add, color: Colors.grey, size: 28),
                ),

                const SizedBox(height: 12),

                Text(
                  'Add Payment Method',
                  style: TextStyle(color: Colors.grey.shade400, fontSize: 13),
                ),
              ],
            ),
          ),

          const SizedBox(height: 15),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              _buildDot(true),

              const SizedBox(width: 8),

              _buildDot(false),

              const SizedBox(width: 8),

              _buildDot(false),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDot(bool active) {
    return Container(
      width: active ? 7 : 6,
      height: active ? 7 : 6,

      decoration: BoxDecoration(
        shape: BoxShape.circle,

        color: active ? const Color(0xff20B897) : Colors.grey.shade300,
      ),
    );
  }
}
