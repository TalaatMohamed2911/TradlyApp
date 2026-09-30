import 'package:dartz/dartz.dart';
import 'package:tradly/core/error/failure.dart';
import 'package:tradly/features/products/domain/entity/product.dart';

abstract class ProductsRepository {
  Future<Either<Failure, List<Product>>> getProducts({
    required int limit,
    required int skip,
  });

  Future<Either<Failure, Product>> getProductsDetails(int productId);

  Future<Either<Failure, List<Product>>> searchProduct(String query);

  Future<Either<Failure, List<Product>>> getCategoryProducts(String category);
}
