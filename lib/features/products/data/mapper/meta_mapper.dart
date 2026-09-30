import 'package:tradly/features/products/data/model/meta_model.dart';
import 'package:tradly/features/products/domain/entity/product_meta.dart';

extension MetaModelMapper on MetaModel {
  ProductMeta toDomain() {
    return ProductMeta(
      createdAt: createdAt,
      updatedAt: updatedAt,
      barcode: barcode,
      qrCode: qrCode,
    );
  }
}
