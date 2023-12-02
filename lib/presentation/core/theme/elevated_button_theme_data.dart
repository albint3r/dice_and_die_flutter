import 'package:flutter/material.dart';
import 'const_values.dart';

abstract class CustomElevatedButtonThemeData {
  static ElevatedButtonThemeData? themeData(ColorScheme colorScheme) {
    return ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(colorScheme.primary),
        foregroundColor:
        MaterialStateProperty.all<Color>(colorScheme.onPrimary),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: BorderSide(
              color: colorScheme.secondary,
            ),
          ),
        ),
        shadowColor: MaterialStateProperty.all<Color>(colorScheme.onBackground),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.all(8)),
        textStyle: MaterialStateProperty.all<TextStyle>(
          const TextStyle(
            fontSize: 20.0,
          ),
        ),
        iconColor: MaterialStateProperty.all<Color>(colorScheme.onBackground),
        overlayColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return colorScheme.secondaryContainer
                  .withOpacity(0.8); // Cambia el color al presionar
            }
            return colorScheme.secondaryContainer
                .withOpacity(0.8); // Sin cambio de color
          },
        ),
      ),
    );
  }
}
