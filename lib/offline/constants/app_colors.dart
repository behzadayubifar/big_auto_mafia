import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF522A7B);
  static const Color secondary = Color(0xFFEB430D);
  static const Color black = Color(0xFF070707);
  static const Color white = Color(0xFFFFFFFF);
  static const lightestGrey = Color(0xFFDDDDDD);
  static const lighterGrey = Color(0xFFC1C1C1);
  static const grey = Color(0xFF7B7B7B);
  static const darkerGrey = Color(0xFF494949);
  static const darkestGrey = Color(0xFF171818);
  static const lightText = Color(0xFFC4C4C4);
  static const darkText = Color(0xFF313131);
  static final white60 = Color(0xFFFFFFFF).withOpacity(0.6);
  static final black20 = Color(0xFF000000).withOpacity(0.2);
  static final black50 = Color(0xFF000000).withOpacity(0.5);
  static const Color backGround = Color(0xFF05052B);
  static const Color green = Color(0xFF07A240);

// 5 shades of each color
  static const primaries = [
    Color(0xFFD4BFE9),
    Color(0xFFA97FD3),
    Color(0xFF522A7B),
    Color(0xFF29153E),
    Color(0xFF05052B),
  ];

  static const secondaries = [
    Color(0xFFFFC1C1),
    Color(0xFFFF8F8F),
    Color(0xFFEB430D),
    Color(0xFFA62A0D),
    Color(0xFF4C0A0A),
  ];

  static const tintsOfBlack = [
    Color(0xFFD4D4D4),
    Color(0xFFA9A9A9),
    Color(0xFF525252),
    Color(0xFF292929),
    Color(0xFF050505),
  ];

  static const greens = [
    Color(0xFFC1E7D9),
    Color(0xFF8FD9B9),
    Color(0xFF07A240),
    Color(0xFF0D7A2A),
    Color(0xFF0A4C1A),
  ];

  static final List<List<Color>> allSwatches = [
    primaries,
    secondaries,
    tintsOfBlack,
  ];
}
