import 'package:dartz/dartz.dart';
import 'package:tradly/core/error/failure.dart';
import 'package:tradly/features/products/domain/entity/product.dart';
import 'package:tradly/features/products/domain/repository/products_repository.dart';

class GetProductsUseCase {
  final ProductsRepository _repository;

  GetProductsUseCase(this._repository);

  Future<Either<Failure, List<Product>>> execute({
    required int limit,
    required int skip,
  }) {
    return _repository.getProducts(limit: limit, skip: skip);
  }
}
