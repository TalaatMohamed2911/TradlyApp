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
  FutureOr<Product> build() async {
    final result = await _useCase.execute(productId);
    return result.fold((failure) => throw Exception(failure.message), (
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
