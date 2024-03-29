import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppColors {
  static const secondary = Color(0xFF3B76F6);
  static const accent = Color(0xFFD6755B);
  static const textDark = Color(0xFF53585A);
  static const textLigth = Color(0xFFF5F5F5);
  static const textFaded = Color(0xFF9899A5);
  static const iconLight = Color(0xFFB1B4C0);
  static const iconDark = Color(0xFFB1B3C1);
  static const textHighlight = secondary;
  static const cardLight = Color(0xFFF9FAFE);
  static const cardDark = Color(0xFF303334);
}

abstract class _LightColors {
  static const background = Colors.white;
  static const card = AppColors.cardLight;
}

abstract class _DarkColors {
  static const background = Color(0xFF1B1E1F);
  static const card = AppColors.cardDark;
}

abstract class AppTheme {
  static const accentColor = AppColors.accent;
  static final visualDensity = VisualDensity.adaptivePlatformDensity;

  static ThemeData light() => ThemeData(
      brightness: Brightness.light,
      visualDensity: visualDensity,
      textTheme: GoogleFonts.mulishTextTheme().apply(
        bodyColor: AppColors.textDark,
      ),
      primaryColor: AppColors.textDark,
      scaffoldBackgroundColor: _LightColors.background,
      cardColor: _LightColors.card,
      primaryTextTheme: const TextTheme(
        titleLarge: TextStyle(color: AppColors.textDark),
      ),
      iconTheme: const IconThemeData(color: AppColors.iconDark),
      colorScheme: ColorScheme.fromSwatch()
          .copyWith(secondary: accentColor)
          .copyWith(background: _LightColors.background));

  static ThemeData dark() => ThemeData(
        visualDensity: visualDensity,
        primaryColor: AppColors.textLigth,
        textTheme: GoogleFonts.interTextTheme().apply(
          bodyColor: AppColors.textLigth,
        ),
        scaffoldBackgroundColor: _DarkColors.background,
        cardColor: _DarkColors.card,
        primaryTextTheme: const TextTheme(
          titleLarge: TextStyle(
            color: AppColors.textLigth,
          ),
        ),
        iconTheme: const IconThemeData(color: AppColors.iconLight),
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: accentColor)
            .copyWith(background: _DarkColors.background)
            .copyWith(brightness: Brightness.dark),
      );
}
