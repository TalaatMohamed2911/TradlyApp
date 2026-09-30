import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tradly/features/products/presentation/screen/product_details_screen.dart';
import 'package:tradly/presentation/providers/search_products_notifier.dart';
import 'package:tradly/presentation/providers/search_query_provider.dart';

class SearchScreen extends ConsumerWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final query = ref.watch(searchQueryProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Search')),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              onChanged: (value) {
                ref.read(searchQueryProvider.notifier).updateQuery(value);
              },

              decoration: const InputDecoration(
                hintText: 'Search products...',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),

          Expanded(
            child: query.isEmpty
                ? const Center(child: Text('Search for a product'))
                : _SearchResults(query: query),
          ),
        ],
      ),
    );
  }
}

class _SearchResults extends ConsumerWidget {
  final String query;

  const _SearchResults({required this.query});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(searchProductsProvider(query));

    return state.when(
      loading: () {
        return const Center(child: CircularProgressIndicator());
      },

      error: (error, stackTrace) {
        return Center(child: Text(error.toString()));
      },

      data: (products) {
        if (products.isEmpty) {
          return const Center(child: Text('No products found'));
        }

        return ListView.builder(
          itemCount: products.length,

          itemBuilder: (context, index) {
            final product = products[index];

            return ListTile(
              leading: Image.network(
                product.thumbnail,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),

              title: Text(product.title),

              subtitle: Text('\$${product.price}'),

              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) {
                      return ProductDetailsScreen(productId: product.id);
                    },
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
