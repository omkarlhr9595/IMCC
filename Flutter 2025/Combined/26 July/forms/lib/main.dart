import 'package:flutter/material.dart';
import 'package:forms/Forms/forms_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form TextField Demo',
      theme: ThemeData(
        primaryColor: AppTheme.primaryColor,
        scaffoldBackgroundColor: AppTheme.scaffoldBackgroundColor,
        appBarTheme: AppTheme.appBarTheme,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: AppTheme.primaryButtonStyle,
        ),
        sliderTheme: AppTheme.sliderTheme,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppTheme.inputBorderColor, width: 1.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppTheme.inputBorderColor, width: 1.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppTheme.inputFocusedBorderColor, width: 2),
          ),
          filled: true,
          fillColor: AppTheme.surfaceColor,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        ),
        cardTheme: CardTheme(
          color: AppTheme.cardColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      home: const FormScreen(),
    );
  }
}
