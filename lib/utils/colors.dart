import 'package:flutter/material.dart';

class AppColors {
  // Primary color - Deep Blue
  static const Color primary = Color(0xFF0D47A1);
  
  // Secondary color - Orange
  static const Color secondary = Color(0xFFFF8F00);
  
  // Background color
  static const Color background = Color(0xFFF5F7FA);
  
  // Text colors
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textWhite = Color(0xFFFFFFFF);
  
  // Additional colors
  static const Color cardBackground = Color(0xFFFFFFFF);
  static const Color borderColor = Color(0xFFE0E0E0);
  
  // Utility Tool Colors
  static const Color utilityBlue = Color(0xFF2196F3);
  static const Color utilityGreen = Color(0xFF4CAF50);
  static const Color utilityOrange = Color(0xFFFF9800);
  static const Color utilityPurple = Color(0xFF9C27B0);
  static const Color utilityPink = Color(0xFFE91E63);
  
  // Gradient helpers
  static LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primary, const Color(0xFF1565C0)],
  );
  
  static LinearGradient secondaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [secondary, const Color(0xFFE65100)],
  );
  
  // Shadow colors
  static Color shadowColor = Colors.black.withOpacity(0.1);
  static Color shadowColorDark = Colors.black.withOpacity(0.2);
}
