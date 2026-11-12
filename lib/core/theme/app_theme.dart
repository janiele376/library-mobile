
import 'package:flutter/material.dart';

class AppTheme {
  // tema claro
  static const Color lightPage = Color(0xFFE9E4DE);
  static const Color lightCard = Color(0xFFDBC2B0);
  static const Color lightInput = Color(0xFFFFFFFF);
  static const Color lightInputReadonly = Color(0xFFE5D7CC);

  static const Color lightText = Color(0xFF55463C);
  static const Color lightTextMuted = Color(0xFF7A6A5F);
  static const Color lightBorder = Color(0xFF55463C);

  static const Color lightPrimaryButton = Color(0xFF55463C);
  static const Color lightPrimaryButtonText = Color(0xFFFFFFFF);
  static const Color lightSecondaryButton = Color(0xFFDBC2B0);

  // tema escuro
  static const Color darkPage = Color(0xFF1E1915);
  static const Color darkCard = Color(0xFF2C241F);
  static const Color darkInput = Color(0xFF1E1915);
  static const Color darkInputReadonly = Color(0xFF251F1A);

  static const Color darkText = Color(0xFFE9E4DE);
  static const Color darkTextMuted = Color(0xFFA89587);
  static const Color darkBorder = Color(0xFF8A7363);

  static const Color darkPrimaryButton = Color(0xFFDBC2B0);
  static const Color darkPrimaryButtonText = Color(0xFF2C241F);
  static const Color darkSecondaryButton = Color(0xFF3F342D);

  // tema claro
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: lightPage,
    colorScheme: const ColorScheme.light(
      primary: lightPrimaryButton,
      onPrimary: lightPrimaryButtonText,
      surface: lightCard,
      onSurface: lightText,
      outline: lightBorder,
      secondary: lightSecondaryButton,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: lightCard,
      foregroundColor: lightText,
    ),
  );

  // tema escuro
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: darkPage,
    colorScheme: const ColorScheme.dark(
      primary: darkPrimaryButton,
      onPrimary: darkPrimaryButtonText,
      surface: darkCard,
      onSurface: darkText,
      outline: darkBorder,
      secondary: darkSecondaryButton,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: darkCard,
      foregroundColor: darkText,
    ),
  );
}
