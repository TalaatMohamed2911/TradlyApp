import 'package:tradly/features/products/data/model/review_model.dart';
import 'package:tradly/features/products/domain/entity/review.dart';

extension ReviewMapper on ReviewModel {
  Review toDomain() {
    return Review(
      rating: rating,
      comment: comment,
      date: date,
      reviewerName: reviewerName,
      reviewerEmail: reviewerEmail,
    );
  }
}
