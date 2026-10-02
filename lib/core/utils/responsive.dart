import 'package:flutter/material.dart';

class Responsive {
  static double width(BuildContext context) {
    return MediaQuery.sizeOf(context).width;
  }

  static double height(BuildContext context) {
    return MediaQuery.sizeOf(context).height;
  }

  static bool isSmall(BuildContext context) {
    return width(context) < 300;
  }

  static bool isCompact(BuildContext context) {
    return width(context) < 360;
  }

  static bool isMedium(BuildContext context) {
    final screenWidth = width(context);
    return screenWidth >= 300 && screenWidth < 400;
  }

  static bool isLarge(BuildContext context) {
    return width(context) >= 400;
  }

  static double horizontalPadding(BuildContext context) {
    return (width(context) * 0.05).clamp(12.0, 24.0).toDouble();
  }
}
