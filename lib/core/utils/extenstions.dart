//convert null to nonnull
//
import 'package:tradly/core/utils/constants.dart';

extension NonNullString on String? {
  String orEmpty() {
    if (this == null) {
      return AppConstants.empty;
    } else {
      return this!;
    }
  }
}

extension NonNullInt on int? {
  int orZero() {
    if (this == null) {
      return AppConstants.zero;
    } else {
      return this!;
    }
  }
}

extension NonNullDouble on double? {
  double orZeroDouble() {
    if (this == null) {
      return 0.0;
    } else {
      return this!;
    }
  }
}
