import 'package:json_annotation/json_annotation.dart';
import 'package:tradly/features/products/domain/entity/product.dart';

import 'dimensions_model.dart';
import 'review_model.dart';
import 'meta_model.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  final int id;
  final String title;
  final String description;
  final String category;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;

  final List<String> tags;

  final String? brand;
  final String sku;
  final int weight;

  final DimensionsModel dimensions;

  final String warrantyInformation;
  final String shippingInformation;
  final String availabilityStatus;

  final List<ReviewModel> reviews;

  final String returnPolicy;
  final int minimumOrderQuantity;

  final MetaModel meta;

  final List<String> images;
  final String thumbnail;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.tags,
    this.brand,
    required this.sku,
    required this.weight,
    required this.dimensions,
    required this.warrantyInformation,
    required this.shippingInformation,
    required this.availabilityStatus,
    required this.reviews,
    required this.returnPolicy,
    required this.minimumOrderQuantity,
    required this.meta,
    required this.images,
    required this.thumbnail,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);

  static ProductModel fromDomain(Product product) {
    return ProductModel(
      id: product.id,
      title: product.title,
      description: product.description,
      category: product.category,
      price: product.price,
      discountPercentage: product.discountPercentage,
      rating: product.rating,
      stock: product.stock,
      tags: product.tags,
      sku: product.sku,
      weight: product.weight,
      dimensions: DimensionsModel(
        width: product.dimensions.width,
        height: product.dimensions.height,
        depth: product.dimensions.depth,
      ),
      warrantyInformation: product.warrantyInformation,
      shippingInformation: product.shippingInformation,
      availabilityStatus: product.availabilityStatus,

      reviews: [
        ReviewModel(
          rating: 1,
          comment: "comment",
          date: "date",
          reviewerName: "reviewerName",
          reviewerEmail: "reviewerEmail",
        ),
      ],
      returnPolicy: product.returnPolicy,
      minimumOrderQuantity: product.minimumOrderQuantity,
      meta: MetaModel(
        createdAt: product.meta.createdAt,
        updatedAt: product.meta.updatedAt,
        barcode: product.meta.barcode,
        qrCode: product.meta.qrCode,
      ),
      images: product.images,
      thumbnail: product.thumbnail,
    );
  }
}
