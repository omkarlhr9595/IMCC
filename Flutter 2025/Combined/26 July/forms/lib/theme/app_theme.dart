import 'package:flutter/material.dart';

class AppTheme {
  // Colors
  static const Color primaryColor = Color(0xFF6366F1);
  static const Color primaryLightColor = Color(0xFF818CF8);
  static const Color primaryDarkColor = Color(0xFF4F46E5);
  static const Color secondaryColor = Color(0xFF10B981);
  static const Color accentColor = Color(0xFFF59E0B);
  static const Color errorColor = Color(0xFFEF4444);
  static const Color warningColor = Color(0xFFF97316);
  static const Color successColor = Color(0xFF22C55E);
  
  static const Color backgroundColor = Color(0xFFF8FAFC);
  static const Color surfaceColor = Color(0xFFFFFFFF);
  static const Color cardColor = Color(0xFFFFFFFF);
  static const Color dividerColor = Color(0xFFE2E8F0);
  
  static const Color textPrimaryColor = Color(0xFF1E293B);
  static const Color textSecondaryColor = Color(0xFF64748B);
  static const Color textHintColor = Color(0xFF94A3B8);
  
  static const Color inputBorderColor = Color(0xFFCBD5E1);
  static const Color inputFocusedBorderColor = Color(0xFF6366F1);
  static const Color inputErrorBorderColor = Color(0xFFEF4444);

  // Text Styles
  static const TextStyle headingStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: textPrimaryColor,
    letterSpacing: -0.5,
  );

  static const TextStyle subheadingStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: textPrimaryColor,
    letterSpacing: -0.3,
  );

  static const TextStyle bodyStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: textPrimaryColor,
  );

  static const TextStyle captionStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: textSecondaryColor,
  );

  static const TextStyle buttonStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: surfaceColor,
    letterSpacing: 0.5,
  );

  // Input Decoration
  static InputDecoration inputDecoration({
    required String labelText,
    String? hintText,
    IconData? prefixIcon,
    Widget? suffixIcon,
    bool isError = false,
  }) {
    return InputDecoration(
      labelText: labelText,
      hintText: hintText,
      prefixIcon: prefixIcon != null ? Icon(prefixIcon, color: textSecondaryColor) : null,
      suffixIcon: suffixIcon,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: inputBorderColor, width: 1.5),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: isError ? inputErrorBorderColor : inputBorderColor,
          width: 1.5,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: inputFocusedBorderColor, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: inputErrorBorderColor, width: 1.5),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: inputErrorBorderColor, width: 2),
      ),
      filled: true,
      fillColor: surfaceColor,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      labelStyle: const TextStyle(color: textSecondaryColor),
      hintStyle: const TextStyle(color: textHintColor),
    );
  }

  // Card Decoration
  static BoxDecoration cardDecoration = BoxDecoration(
    color: cardColor,
    borderRadius: BorderRadius.circular(16),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.05),
        blurRadius: 10,
        offset: const Offset(0, 4),
      ),
    ],
  );

  // Button Styles
  static ButtonStyle primaryButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: primaryColor,
    foregroundColor: surfaceColor,
    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    elevation: 2,
    shadowColor: primaryColor.withOpacity(0.3),
  );

  static ButtonStyle secondaryButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: surfaceColor,
    foregroundColor: primaryColor,
    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
      side: const BorderSide(color: primaryColor, width: 1.5),
    ),
    elevation: 0,
  );

  // Slider Theme
  static SliderThemeData sliderTheme = SliderThemeData(
    activeTrackColor: primaryColor,
    inactiveTrackColor: inputBorderColor,
    thumbColor: primaryColor,
    overlayColor: primaryColor.withOpacity(0.2),
    trackHeight: 4,
    thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8),
    overlayShape: const RoundSliderOverlayShape(overlayRadius: 16),
  );

  // Dropdown Theme
  static InputDecoration dropdownDecoration = InputDecoration(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: inputBorderColor, width: 1.5),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: inputBorderColor, width: 1.5),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: inputFocusedBorderColor, width: 2),
    ),
    filled: true,
    fillColor: surfaceColor,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
  );

  // App Bar Theme
  static AppBarTheme appBarTheme = const AppBarTheme(
    backgroundColor: primaryColor,
    foregroundColor: surfaceColor,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: surfaceColor,
    ),
  );

  // Scaffold Theme
  static const Color scaffoldBackgroundColor = backgroundColor;

  // Spacing
  static const double spacingXS = 4.0;
  static const double spacingS = 8.0;
  static const double spacingM = 16.0;
  static const double spacingL = 20.0;
  static const double spacingXL = 24.0;
  static const double spacingXXL = 32.0;

  // Border Radius
  static const double borderRadiusS = 8.0;
  static const double borderRadiusM = 12.0;
  static const double borderRadiusL = 16.0;
  static const double borderRadiusXL = 20.0;
} 