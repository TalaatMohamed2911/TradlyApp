import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tradly/core/utils/constants.dart';
import 'package:tradly/features/products/data/model/product_model.dart';
import 'package:tradly/features/products/data/model/products_response_model.dart';

part 'test_api.g.dart';

@RestApi(baseUrl: AppConstants.testUrl)
abstract class AppApi {
  factory AppApi(Dio dio, {String? baseUrl}) = _AppApi;

  @GET("/products")
  Future<ProductsResponseModel> getProducts(
    @Query('limit') int limit,
    @Query('skip') int skip,
  );

  @GET("/products/{id}")
  Future<ProductModel> getProductDetails(@Path('id') int id);

  @GET("/products/search")
  Future<ProductsResponseModel> searchProduct(@Query("q") String query);

  @GET("/products/category/{category}")
  Future<ProductsResponseModel> getCategoryProducts(
    @Path('category') String category,
  );
}
