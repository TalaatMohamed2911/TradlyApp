import 'package:json_annotation/json_annotation.dart';

import 'product_model.dart';

 part 'product_response_model.g.dart'; 
@JsonSerializable()
class ProductsResponseModel {
  final List<ProductModel> products;
  final int total;
  final int skip;
  final int limit;

  ProductsResponseModel({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory ProductsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProductsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsResponseModelToJson(this);
}
