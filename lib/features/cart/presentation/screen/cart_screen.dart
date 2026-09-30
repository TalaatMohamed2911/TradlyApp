import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tradly/features/cart/presentation/widgets/cart_body.dart';
import 'package:tradly/features/cart/presentation/provider/cart_provider.dart';
import 'package:tradly/features/checkout/presentation/provider/address_provider.dart';
import 'package:tradly/presentation/resourcses/colors_manager.dart';

class CartView extends ConsumerWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);
    final address = ref.watch(addressProvider);
    if (cart.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: Text("Cart")),
        body: Center(
          child: Text(
            'Your cart is empty',
            style: TextStyle(color: ColorManager.black),
          ),
        ),
      );
    }
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        backgroundColor: ColorManager.primary,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
        centerTitle: true,
        title: Text('My Cart', style: Theme.of(context).textTheme.titleLarge),
      ),

      body: CartBody(cart: cart, address: address),
    );
  }
}
