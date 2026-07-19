import 'package:flutter/material.dart';

class Responsive {
  static const double designWidth = 390;

  static double scale(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    double contentWidth;

    if (width < 600) {
      contentWidth = width;
    } else if (width < 1200) {
      contentWidth = 650;
    } else {
      contentWidth = 850;
    }

    return contentWidth / designWidth;
  }

  static double width(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width < 600) return width;
    if (width < 1200) return 650;
    return 850;
  }

  static double padding(BuildContext context) {
  final width = MediaQuery.of(context).size.width;

  if (width < 600) return 24;
  if (width < 1200) return 16;
  return 0;
}

static double topPadding(BuildContext context) {
  final width = MediaQuery.of(context).size.width;

  if (width < 600) return 60; // Mobile
  if (width < 1200) return 30; // Tablet
  return 20; // Desktop
}


}