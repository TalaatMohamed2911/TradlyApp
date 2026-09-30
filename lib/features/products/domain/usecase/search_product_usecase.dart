import 'package:dartz/dartz.dart';
import 'package:tradly/core/error/failure.dart';
import 'package:tradly/features/products/domain/entity/product.dart';
import 'package:tradly/core/usecase/base_usecase.dart';
import 'package:tradly/features/products/domain/repository/products_repository.dart';

class SearchProductUsecase implements BaseUsecase<String, List<Product>> {
  final ProductsRepository _repository;
  SearchProductUsecase(this._repository);

  @override
  Future<Either<Failure, List<Product>>> execute(String query) async {
    return await _repository.searchProduct(query);
  }
}
