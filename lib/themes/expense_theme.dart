import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GlobalThemeData {
  static final ColorScheme kLightColorScheme = ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 96, 59, 181),
  );
  static final ColorScheme kDarkColorScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 5, 99, 125),
  );

  static ThemeData lightThemeData = ThemeData().copyWith(
    colorScheme: kLightColorScheme,
    appBarTheme: const AppBarTheme().copyWith(
      backgroundColor: kLightColorScheme.onPrimaryContainer,
      foregroundColor: kLightColorScheme.primaryContainer,
    ),
    cardTheme: const CardTheme().copyWith(
      color: kLightColorScheme.secondaryContainer,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: kLightColorScheme.primaryContainer,
      ),
    ),
    textTheme: GoogleFonts.poppinsTextTheme().copyWith(
      titleLarge: GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: kLightColorScheme.onSecondaryContainer,
      ),
      bodyMedium: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: kLightColorScheme.onSecondaryContainer,
      ),
    ),
  );

  static ThemeData darkThemeData = ThemeData.dark().copyWith(
    colorScheme: kDarkColorScheme,
    cardTheme: const CardTheme().copyWith(
      color: kDarkColorScheme.primaryContainer,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: kDarkColorScheme.onPrimaryContainer,
        foregroundColor: kDarkColorScheme.primaryContainer,
      ),
    ),
    textTheme: GoogleFonts.poppinsTextTheme().copyWith(
      titleLarge: GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: kDarkColorScheme.onSecondaryContainer,
      ),
      bodyLarge: GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: FontWeight.normal,
        color: kDarkColorScheme.onSecondaryContainer,
      ),
      bodyMedium: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: kDarkColorScheme.onSecondaryContainer,
      ),
      bodySmall: GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: kDarkColorScheme.onSecondaryContainer,
      ),
    ),
  );
}
