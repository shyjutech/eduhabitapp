import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // SURFACE
  static const Color bg = Color(0xFFFEFEFA);
  static const Color card = Color(0xFFFFFFFF);
  static const Color disabled = Color(0xFFEAFCF0);

  // BORDERS
  static const Color divider = Color(0xFFEAECF0);
  static const Color border = Color(0xFFEAFCF0);
  static const Color outline = Color(0xFFA6A8AA);

  // BUTTONS
  static const Color primaryDefault = Color(0xFF27448C);
  static const Color primaryHover = Color(0xFF3257B5);
  static const Color primaryFocused = Color(0xFF1D346B);
  static const Color primaryPressed = Color(0xFF1D346B);
  static const Color primaryDisabled = Color(0xFFEEF0F3);
  static const Color secondaryDefault = Color(0xFFD5D7DA);
  static const Color secondaryHover = Color(0xFFA6A8AA);
  static const Color secondaryFocused = Color(0xFF828284);
  static const Color secondaryPressed = Color(0xFF828284);
  static const Color secondaryDisabled = Color(0xFFEEF0F3);

  // TEXTS
  static const Color primary = Color(0xFF121212);
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color secondary = Color(0xFF626365);
  static const Color onSecondary = Color(0xFFFFFFFF);
  static const Color disabledText = Color(0xFFA6A8AA);
  static const Color placeholder = Color(0xFFA6A8AA);

  // TEXT FIELDS
  static const Color borderDefault = Color(0xFFD5D7DA);
  static const Color hover = Color(0xFFA6A8AA);
  static const Color focused = Color(0xFF3257B5);
  static const Color pressed = Color(0xFF1D346B);
  static const Color disabledTextField = Color(0xFFA6A8AA);
  static const Color error = Color(0xFFB3261E);
  static const Color onError = Color(0xFFFFFFFF);

  static TextStyle cormorantGaramondDisplayLarge = GoogleFonts.cormorantGaramond(
    fontSize: 57,
    fontWeight: FontWeight.w400,
  );
  static TextStyle cormorantGaramondDisplayMedium = GoogleFonts.cormorantGaramond(
    fontSize: 45,
    fontWeight: FontWeight.w400,
  );
  static TextStyle cormorantGaramondDisplaySmall = GoogleFonts.cormorantGaramond(
    fontSize: 36,
    fontWeight: FontWeight.w400,
  );
  static TextStyle cormorantGaramondHeadlinesLarge = GoogleFonts.cormorantGaramond(
    fontSize: 32,
    fontWeight: FontWeight.w400,
  );
  static TextStyle cormorantGaramondHeadlinesMedium = GoogleFonts.cormorantGaramond(
    fontSize: 28,
    fontWeight: FontWeight.w400,
  );
  static TextStyle cormorantGaramondHeadlinesSmall = GoogleFonts.cormorantGaramond(
    fontSize: 24,
    fontWeight: FontWeight.w400,
  );
  static TextStyle cormorantGaramondTitlesLarge = GoogleFonts.cormorantGaramond(
    fontSize: 22,
    fontWeight: FontWeight.w400,
  );
  static TextStyle cormorantGaramondTitlesMedium = GoogleFonts.cormorantGaramond(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
  static TextStyle cormorantGaramondBodyLarge = GoogleFonts.cormorantGaramond(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  static TextStyle cormorantGaramondBodyMedium = GoogleFonts.cormorantGaramond(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
  static TextStyle cormorantGaramondLabelLarge = GoogleFonts.cormorantGaramond(
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );
  static TextStyle cormorantGaramondLabelMedium = GoogleFonts.cormorantGaramond(
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppTheme.primaryDefault, // Primary Default
    scaffoldBackgroundColor: AppTheme.bg, // Background
    cardColor: Colors.white,
    dividerColor: AppTheme.divider, // Divider

    textTheme: TextTheme(
      displayLarge: GoogleFonts.montserrat(
        fontSize: 57,
        fontWeight: FontWeight.w400,
      ),
      displayMedium: GoogleFonts.montserrat(
        fontSize: 45,
        fontWeight: FontWeight.w400,
      ),
      displaySmall: GoogleFonts.montserrat(
        fontSize: 36,
        fontWeight: FontWeight.w400,
      ),
      headlineLarge: GoogleFonts.montserrat(
        fontSize: 32,
        fontWeight: FontWeight.w400,
      ),
      headlineMedium: GoogleFonts.montserrat(
        fontSize: 28,
        fontWeight: FontWeight.w400,
      ),
      headlineSmall: GoogleFonts.montserrat(
        fontSize: 24,
        fontWeight: FontWeight.w400,
      ),
      titleLarge: GoogleFonts.montserrat(
        fontSize: 22,
        fontWeight: FontWeight.w400,
      ),
      titleMedium: GoogleFonts.montserrat(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: GoogleFonts.montserrat(
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: GoogleFonts.montserrat(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      labelLarge: GoogleFonts.montserrat(
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      labelMedium: GoogleFonts.montserrat(
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppTheme.primaryDefault, // Primary Default
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        textStyle: GoogleFonts.montserrat(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppTheme.secondary, // Secondary Text
        side: const BorderSide(
          color: AppTheme.outline,
        ), // Outline
        textStyle: GoogleFonts.montserrat(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppTheme.borderDefault,
        ), // Default
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppTheme.focused,
        ), // Focused
        borderRadius: BorderRadius.circular(8),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppTheme.error,
        ), // Error
        borderRadius: BorderRadius.circular(8),
      ),
      hintStyle: GoogleFonts.montserrat(
        color: AppTheme.hover,
      ),
    ),
  );
}
