import 'package:expense_tracker/screens/expenses_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 96, 59, 181));

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final poppinsTextStyle = GoogleFonts.poppins();
  runApp(
    MaterialApp(
      title: 'Flutter Expense App',
      theme: ThemeData().copyWith(
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,
          ),
        ),
        textTheme: TextTheme(
          // bodyLarge: poppinsTextStyle.copyWith(
          //     fontSize: 24,
          //     fontWeight: FontWeight.normal,
          //
          //     color: kColorScheme.onPrimaryContainer
          //
          // ),
          bodyMedium: poppinsTextStyle.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: kColorScheme.onSecondaryContainer),
          // bodySmall: poppinsTextStyle.copyWith(
          //     fontSize: 14,
          //     fontWeight: FontWeight.normal,
          //
          //     color: kColorScheme.onPrimaryContainer
          //
          // ),
          // headlineLarge: poppinsTextStyle.copyWith(
          //     fontSize: 20,
          //     fontWeight: FontWeight.normal,
          //
          //     color: kColorScheme.onPrimaryContainer
          //
          // ),
          // headlineMedium: poppinsTextStyle.copyWith(
          //     fontSize: 14,
          //     fontWeight: FontWeight.normal,
          //
          //     color: kColorScheme.onPrimaryContainer
          //
          // ),
          // headlineSmall: poppinsTextStyle.copyWith(
          //     fontSize: 14,
          //     fontWeight: FontWeight.normal,
          //
          //     color: kColorScheme.onPrimaryContainer
          //
          // ),
          titleLarge: poppinsTextStyle.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: kColorScheme.onSecondaryContainer),
          titleSmall: poppinsTextStyle.copyWith(
              fontSize: 24,
              fontWeight: FontWeight.normal,
              color: kColorScheme.onPrimaryContainer),
        ),
      ),
      home: const ExpensesScreen(),
    ),
  );
}

///write a program of reversing two no in dart
