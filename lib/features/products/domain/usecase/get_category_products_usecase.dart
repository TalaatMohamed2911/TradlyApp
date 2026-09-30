import 'package:dartz/dartz.dart';
import 'package:tradly/core/error/failure.dart';
import 'package:tradly/features/products/domain/entity/product.dart';
import 'package:tradly/core/usecase/base_usecase.dart';
import 'package:tradly/features/products/domain/repository/products_repository.dart';

class GetCategoryProductsUsecase implements BaseUsecase<String, List<Product>> {
  final ProductsRepository _repository;
  GetCategoryProductsUsecase(this._repository);

  @override
  Future<Either<Failure, List<Product>>> execute(String category) async {
    return _repository.getCategoryProducts(category);
  }
}
