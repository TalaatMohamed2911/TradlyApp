import 'package:dartz/dartz.dart';
import 'package:tradly/core/error/failure.dart';
import 'package:tradly/features/products/data/data_source/products_data_source.dart';
import 'package:tradly/features/products/data/mapper/product_mapper.dart';
import 'package:tradly/features/products/domain/entity/product.dart';
import 'package:tradly/features/products/domain/repository/products_repository.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final ProductsDataSource _productsDataSource;
  ProductsRepositoryImpl(this._productsDataSource);
  @override
  Future<Either<Failure, List<Product>>> getProducts({
    required int limit,
    required int skip,
  }) async {
    try {
      final response = await _productsDataSource.getProducts(
        limit: limit,
        skip: skip,
      );

      final products = response.products
          .map((product) => product.toDomain())
          .toList();
      // await _localDataSource.saveHomeToCache(products);
      return Right(products);
    } catch (e) {
      return Left(Failure(500, e.toString()));
    }
  }

  @override
  Future<Either<Failure, Product>> getProductsDetails(int productId) async {
    try {
      final result = await _productsDataSource.getProductDetails(productId);
      return Right(result.toDomain());
    } catch (e) {
      return Left(Failure(500, e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Product>>> searchProduct(String query) async {
    try {
      final result = await _productsDataSource.searchProduct(query);
      return Right(
        result.products.map((product) => product.toDomain()).toList(),
      );
    } catch (e) {
      return Left(Failure(500, e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getCategoryProducts(
    String category,
  ) async {
    try {
      final result = await _productsDataSource.getCategoryProducts(category);
      return Right(
        result.products.map((product) => product.toDomain()).toList(),
      );
    } catch (e) {
      return Left(Failure(500, e.toString()));
    }
  }
}
