import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tradly/core/di/di.dart';
import 'package:tradly/features/products/domain/entity/product.dart';
import 'package:tradly/features/products/domain/usecase/get_products_usecase.dart';

class ProductsNotifier extends AsyncNotifier<List<Product>> {
  final GetProductsUseCase _useCase = instance<GetProductsUseCase>();

  @override
  Future<List<Product>> build() async {
    final result = await _useCase.execute(limit: 30, skip: 0);

    return result.fold((failure) => throw failure, (products) => products);
  }
}

final productsProvider = AsyncNotifierProvider<ProductsNotifier, List<Product>>(
  ProductsNotifier.new,
);
