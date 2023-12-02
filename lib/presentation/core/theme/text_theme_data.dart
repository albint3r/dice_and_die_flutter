import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'const_values.dart';

abstract class TextThemeData {
  static TextTheme themeData(ColorScheme colorScheme) {
    return GoogleFonts.getTextTheme(
      'Bungee',
      TextTheme(
        titleLarge: TextStyle(
          fontSize: h1,
          fontWeight: FontWeight.bold,
          color: colorScheme.onPrimary,
        ),
        titleMedium: TextStyle(
          fontSize: h2,
          fontWeight: FontWeight.bold,
          color: colorScheme.onBackground,
        ),
        bodyMedium: TextStyle(
          fontSize: body,
          fontWeight: FontWeight.bold,
          color: colorScheme.onBackground,
        ),
        bodySmall: TextStyle(
          fontSize: bodySmall,
          color: colorScheme.onPrimary,
        ),
      ),
    );
  }
}
