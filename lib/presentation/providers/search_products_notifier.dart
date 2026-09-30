import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tradly/core/di/di.dart';
import 'package:tradly/features/products/domain/entity/product.dart';
import 'package:tradly/features/products/domain/usecase/search_product_usecase.dart';

class SearchProductsNotifier extends AsyncNotifier<List<Product>> {
  final String query;
  SearchProductsNotifier(this.query);
  final SearchProductUsecase _usecase = instance();

  @override
  Future<List<Product>> build() async {
    final result = await _usecase.execute(query);
    return result.fold(
      (failure) {
        throw Exception(failure.message);
      },
      (products) {
        return products;
      },
    );
  }
}

final searchProductsProvider = AsyncNotifierProvider.autoDispose
    .family<SearchProductsNotifier, List<Product>, String>(
      SearchProductsNotifier.new,
    );
