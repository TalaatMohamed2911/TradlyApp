import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tradly/core/di/di.dart';
import 'package:tradly/features/products/domain/entity/product.dart';
import 'package:tradly/features/products/domain/usecase/get_product_details_usecase.dart';

class ProductDetailsNotifier extends AsyncNotifier<Product> {
  final int productId;
  ProductDetailsNotifier(this.productId);

  final GetProductDetailsUsecase _useCase =
      instance<GetProductDetailsUsecase>();

  @override
  Future<Product> build() async {
    final response = await _useCase.execute(productId);
    return response.fold((failure) => throw Exception(failure.message), (
      product,
    ) {
      return product;
    });
  }
}

final productDetailsProvider =
    AsyncNotifierProvider.family<ProductDetailsNotifier, Product, int>(
      ProductDetailsNotifier.new,
    );
