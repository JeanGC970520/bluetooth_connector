
import 'package:flutter/material.dart';

class AppTheme {

  // COLOR BASE
  static const Color kSeedColor = Color(0xFF49BDFE);

  ThemeData getTheme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: kSeedColor,
    );
  }

}