import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tradly/core/error/failure.dart';
import 'package:tradly/features/products/presentation/widgets/home_content.dart';
import 'package:tradly/features/products/presentation/provider/products_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(productsProvider);

    return Scaffold(
      body: homeState.when(
        loading: () {
          return const Center(child: CircularProgressIndicator());
        },

        error: (error, stackTrace) {
          return Center(
            child: Text(error is Failure ? error.message : error.toString()),
          );
        },

        data: (homeData) {
          return HomeContent(homeData: homeData);
        },
      ),
    );
  }
}
