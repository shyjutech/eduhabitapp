import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemes {
  // Colors from the design system
  static const Color primaryDefault = Color(0xFF27448C);
  static const Color primaryHover = Color(0xFF3257B5);
  static const Color primaryPressed = Color(0xFF1D346B);
  static const Color primaryDisabled = Color(0xFFEEF0F3);

  static const Color secondaryDefault = Color(0xFFD5D7DA);
  static const Color secondaryHover = Color(0xFFA6A8AA);
  static const Color secondaryPressed = Color(0xFF818284);

  static const Color textPrimary = Color(0xFF121212);
  static const Color textSecondary = Color(0xFF626365);
  static const Color textDisabled = Color(0xFFA6A8AA);

  static const Color backgroundLight = Color(0xFFFEFEFA);
  static const Color backgroundDark = Color(0xFF121212);
  static const Color cardColorLight = Color(0xFFFFFFFF);
  static const Color cardColorDark = Color(0xFF1E1E1E);
  static const Color dividerColor = Color(0xFFEAECF0);

  static const Color errorColor = Color(0xFFB3261E);
  static const Color onErrorColor = Color(0xFFFFFFFF);

  // Light theme
  static final lightTheme = ThemeData(
    primaryColor: primaryDefault,
    scaffoldBackgroundColor: backgroundLight,
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      primary: primaryDefault,
      secondary: secondaryDefault,
      surface: backgroundLight, // ✅ Updated from `background` to `surface`
      onSurface: Colors.black,
      error: errorColor,
      onError: onErrorColor,
      onPrimary: Colors.white,
      onSecondary: Colors.black,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: primaryDefault,
      foregroundColor: Colors.white,
      titleTextStyle: GoogleFonts.montserrat(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    ),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.montserrat(
        fontSize: 57,
        fontWeight: FontWeight.w400,
        color: textPrimary,
      ),
      displayMedium: GoogleFonts.montserrat(
        fontSize: 45,
        fontWeight: FontWeight.w400,
        color: textPrimary,
      ),
      displaySmall: GoogleFonts.montserrat(
        fontSize: 36,
        fontWeight: FontWeight.w400,
        color: textPrimary,
      ),
      headlineLarge: GoogleFonts.cormorantGaramond(
        fontSize: 45,
        fontWeight: FontWeight.bold,
        color: textPrimary,
      ),
      bodyLarge: GoogleFonts.montserrat(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: textPrimary,
      ),
      bodyMedium: GoogleFonts.montserrat(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: textSecondary,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryDefault,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        textStyle: GoogleFonts.montserrat(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    cardColor: cardColorLight,
    dividerColor: dividerColor,
  );

  // Dark theme
  static final darkTheme = ThemeData(
    primaryColor: primaryDefault,
    scaffoldBackgroundColor: backgroundDark,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      primary: primaryDefault,
      secondary: secondaryDefault,
      surface: backgroundDark, // ✅ Updated from `background` to `surface`
      onSurface: Colors.white,
      error: errorColor,
      onError: onErrorColor,
      onPrimary: Colors.white,
      onSecondary: Colors.black,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: primaryPressed,
      foregroundColor: Colors.white,
      titleTextStyle: GoogleFonts.montserrat(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    ),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.montserrat(
        fontSize: 57,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
      displayMedium: GoogleFonts.montserrat(
        fontSize: 45,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
      displaySmall: GoogleFonts.montserrat(
        fontSize: 36,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
      headlineLarge: GoogleFonts.cormorantGaramond(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      bodyLarge: GoogleFonts.montserrat(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
      bodyMedium: GoogleFonts.montserrat(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: textSecondary,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryPressed,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        textStyle: GoogleFonts.montserrat(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    cardColor: cardColorDark,
    dividerColor: dividerColor,
  );
}
