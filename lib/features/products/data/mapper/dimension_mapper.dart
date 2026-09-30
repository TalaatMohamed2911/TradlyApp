import 'package:tradly/features/products/data/model/dimensions_model.dart';
import 'package:tradly/features/products/domain/entity/dimensions.dart';

extension DimensionMapper on DimensionsModel {
  Dimensions toDomain() {
    return Dimensions(width: width, height: height, depth: depth);
  }
}
