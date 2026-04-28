import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';
import '../constants/app_dimensions.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: AppColors.islamicEmerald,
      scaffoldBackgroundColor: AppColors.islamicCream,
      colorScheme: const ColorScheme.light(
        primary: AppColors.islamicEmerald,
        secondary: AppColors.islamicGold,
        surface: Colors.white,
        onPrimary: Colors.white,
        onSecondary: AppColors.textDark,
        onSurface: AppColors.textDark,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.islamicEmerald,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.amiri(
          fontSize: AppDimensions.fontSizeTitle,
          fontWeight: FontWeight.bold,
          color: AppColors.islamicGold,
          shadows: const [
            Shadow(blurRadius: 2, color: Colors.black38, offset: Offset(1, 1)),
          ],
        ),
      ),
      cardTheme: CardThemeData(
        color: Colors.white,
        elevation: AppDimensions.cardElevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
        ),
      ),
      textTheme: TextTheme(
        displayLarge: GoogleFonts.amiri(
            fontSize: AppDimensions.fontSizeTitle, color: AppColors.textDark),
        displayMedium: GoogleFonts.amiri(
            fontSize: AppDimensions.fontSizeXLarge,
            fontWeight: FontWeight.bold,
            color: AppColors.textDark),
        titleLarge: GoogleFonts.amiri(
            fontSize: AppDimensions.fontSizeLarge,
            fontWeight: FontWeight.bold,
            color: AppColors.textDark),
        bodyLarge: GoogleFonts.amiri(
            fontSize: AppDimensions.fontSizeDefault,
            color: AppColors.textDark,
            height: 1.9),
        bodyMedium: GoogleFonts.amiri(
            fontSize: AppDimensions.fontSizeMedium, color: AppColors.textMuted),
      ),
      iconTheme: const IconThemeData(color: AppColors.islamicGold),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.islamicGold,
        foregroundColor: AppColors.islamicDarkBg,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: AppColors.islamicEmerald,
      scaffoldBackgroundColor: AppColors.islamicDarkBg,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.islamicEmerald,
        secondary: AppColors.goldLight,
        surface: AppColors.islamicDarkSurface,
        onPrimary: Colors.white,
        onSecondary: AppColors.islamicDarkBg,
        onSurface: AppColors.textLight,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.islamicDarkSurface,
        foregroundColor: AppColors.goldLight,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.amiri(
          fontSize: AppDimensions.fontSizeTitle,
          fontWeight: FontWeight.bold,
          color: AppColors.goldLight,
          shadows: const [
            Shadow(blurRadius: 2, color: Colors.black54, offset: Offset(1, 1)),
          ],
        ),
      ),
      cardTheme: CardThemeData(
        color: AppColors.islamicDarkCard,
        elevation: AppDimensions.cardElevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
        ),
      ),
      textTheme: TextTheme(
        displayLarge: GoogleFonts.amiri(
            fontSize: AppDimensions.fontSizeTitle, color: AppColors.textLight),
        displayMedium: GoogleFonts.amiri(
            fontSize: AppDimensions.fontSizeXLarge,
            fontWeight: FontWeight.bold,
            color: AppColors.textLight),
        titleLarge: GoogleFonts.amiri(
            fontSize: AppDimensions.fontSizeLarge,
            fontWeight: FontWeight.bold,
            color: AppColors.textLight),
        bodyLarge: GoogleFonts.amiri(
            fontSize: AppDimensions.fontSizeDefault,
            color: AppColors.textLight,
            height: 1.9),
        bodyMedium: GoogleFonts.amiri(
            fontSize: AppDimensions.fontSizeMedium, color: AppColors.textMuted),
      ),
      iconTheme: const IconThemeData(color: AppColors.goldLight),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.goldLight,
        foregroundColor: AppColors.islamicDarkBg,
      ),
    );
  }
}
