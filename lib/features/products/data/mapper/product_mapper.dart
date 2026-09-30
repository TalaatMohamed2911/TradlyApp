import 'package:tradly/features/products/data/mapper/dimension_mapper.dart';
import 'package:tradly/features/products/data/mapper/meta_mapper.dart';
import 'package:tradly/features/products/data/mapper/review_mapper.dart';
import 'package:tradly/features/products/data/model/product_model.dart';
import 'package:tradly/features/products/domain/entity/product.dart';

extension ProductMapper on ProductModel {
  Product toDomain() {
    return Product(
      id: id,
      title: title,
      description: description,
      category: category,
      price: price,
      discountPercentage: discountPercentage,
      rating: rating,
      stock: stock,
      tags: tags,
      brand: brand,
      sku: sku,
      weight: weight,

      dimensions: dimensions.toDomain(),

      warrantyInformation: warrantyInformation,
      shippingInformation: shippingInformation,
      availabilityStatus: availabilityStatus,

      reviews: reviews.map((review) => review.toDomain()).toList(),

      returnPolicy: returnPolicy,
      minimumOrderQuantity: minimumOrderQuantity,

      meta: meta.toDomain(),

      images: images,
      thumbnail: thumbnail,
    );
  }
}
