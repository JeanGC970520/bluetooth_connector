
import 'package:flutter/material.dart';

class AppTheme {

  // TEXT
  static const String prmFont = 'Poppins';

  // COLOR BASE
  static const Color kSeedColor = Color(0xFF49BDFE);

  // COLORS VARIETY
  static const Color kSeedColorAlp60 = Color(0x3C49BDFE);
  static const Color kSeedColorBold = Color.fromARGB(255, 89, 181, 235);
  static const Color kWhite = Color.fromARGB(255, 247, 244, 244);

  ThemeData getTheme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: kSeedColor,
      fontFamily: prmFont,
      elevatedButtonTheme: const ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(kSeedColor),
          foregroundColor: WidgetStatePropertyAll(kWhite)
        )
      )
    );
  }

}