
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
  static const Color kGray = Color.fromARGB(181, 145, 144, 144);
  static const Color kGreen = Color(0xFF66CE8C);
  static const Color kOrange = Color(0xFFF57A37);
  static const Color kYellow = Color(0xFFF2B538);
  static const Color kPurple = Color(0xFF676FCF);

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