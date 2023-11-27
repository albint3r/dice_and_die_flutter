import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'color_theme.dart';

@singleton
class ThemeConfig {
  ThemeData get light => _getThemeData(colorScheme: ColorTheme.light);

  ThemeData get dark => _getThemeData(colorScheme: ColorTheme.dark);

  ThemeData _getThemeData({
    required ColorScheme colorScheme,
  }) {
    return ThemeData(
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colorScheme.background,
      brightness: colorScheme.brightness,
      visualDensity: VisualDensity.standard,
    );
  }
}
