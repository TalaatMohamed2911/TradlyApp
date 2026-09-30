import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tradly/features/products/presentation/widgets/product_details_body.dart';
import 'package:tradly/features/products/presentation/provider/product_details_provider.dart';

class ProductDetailsScreen extends ConsumerWidget {
  final int productId;

  const ProductDetailsScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(productDetailsProvider(productId));

    return Scaffold(
      body: state.when(
        loading: () {
          return const Center(child: CircularProgressIndicator());
        },

        error: (error, stackTrace) {
          return Center(child: Text(error.toString()));
        },

        data: (product) {
          return ProductDetailsBody(product: product);
        },
      ),
    );
  }
}
