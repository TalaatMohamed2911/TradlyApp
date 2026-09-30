import 'package:tradly/features/products/domain/entity/dimensions.dart';
import 'package:tradly/features/products/domain/entity/product_meta.dart';
import 'package:tradly/features/products/domain/entity/review.dart';

class Product {
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

  final Dimensions dimensions;

  final String warrantyInformation;
  final String shippingInformation;
  final String availabilityStatus;

  final List<Review> reviews;

  final String returnPolicy;
  final int minimumOrderQuantity;

  final ProductMeta meta;

  final List<String> images;
  final String thumbnail;

  Product({
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
}
