import 'package:flutter/material.dart';

class AppColors {
  static Color splashBackground = const Color.fromRGBO(1, 180, 253, 1);
  static Color textWhite = const Color.fromRGBO(255, 255, 255, 1);
  static Color textBlack = const Color.fromRGBO(0, 0, 0, 1);
  static Color primary = const Color.fromRGBO(12, 12, 18, 1);
  static Color gradient2 = const Color.fromRGBO(76, 161, 245, 1);
  static Color gradient3 = const Color.fromRGBO(30, 145, 247, 1);
  static Color gradient1 = const Color.fromRGBO(161, 207, 251, 1);


  static List<Color> customGradient = [
    AppColors.gradient1,
    AppColors.gradient2,
    AppColors.gradient3,
  ];

  static List<BoxShadow> circularImageShadow = [
    BoxShadow(
      color: Colors.black.withOpacity(0.3),
      spreadRadius: 1,
      blurRadius: 5,
      offset: const Offset(0, 3),
    ),
  ];
}
