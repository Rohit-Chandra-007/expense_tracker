import 'package:expense_tracker/screens/expenses_screen.dart';
import 'package:expense_tracker/themes/expense_theme.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      title: 'Flutter Expense App',
      theme: GlobalThemeData.lightThemeData,
      darkTheme: GlobalThemeData.darkThemeData,
      home: const ExpensesScreen(),
    ),
  );
}
