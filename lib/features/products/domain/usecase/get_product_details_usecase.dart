import 'package:dartz/dartz.dart';
import 'package:tradly/core/error/failure.dart';
import 'package:tradly/features/products/domain/entity/product.dart';
import 'package:tradly/core/usecase/base_usecase.dart';
import 'package:tradly/features/products/domain/repository/products_repository.dart';

class GetProductDetailsUsecase implements BaseUsecase<int, Product> {
  final ProductsRepository _repository;
  GetProductDetailsUsecase(this._repository);
  @override
  Future<Either<Failure, Product>> execute(int productId) async {
    return await _repository.getProductsDetails(productId);
  }
}
