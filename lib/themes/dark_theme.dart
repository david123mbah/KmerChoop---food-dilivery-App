import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface: const Color(0xFF1E1E1E),     // Slightly lighter than background for cards
    primary: const Color(0xFF8E97FD),     // A soft indigo
    secondary: const Color(0xFF03DAC6),   // A vibrant teal
    tertiary: const Color(0xFF2F2F2F),    // For elevated surfaces
    inversePrimary: Colors.grey.shade200, // Light grey for text
    error: const Color(0xFFCF6679),       // Soft red for errors
  ),
  scaffoldBackgroundColor: const Color(0xFF121212),
  appBarTheme: AppBarTheme(
    backgroundColor: const Color(0xFF1E1E1E),
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.grey.shade200),
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: Colors.grey.shade300),
    bodyMedium: TextStyle(color: Colors.grey.shade400),
    titleLarge: TextStyle(color: Colors.grey.shade200, fontWeight: FontWeight.bold),
  ),
  iconTheme: IconThemeData(color: Colors.grey.shade400),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF8E97FD),
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
  ),
  cardTheme: CardTheme(
    color: const Color(0xFF1E1E1E),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    elevation: 4,
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: const Color(0xFF2F2F2F),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Color(0xFF8E97FD), width: 2),
    ),
  ),
  dividerColor: Colors.grey.shade800,
  switchTheme: SwitchThemeData(
    thumbColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
      if (states.contains(WidgetState.selected)) {
        return const Color(0xFF8E97FD);
      }
      return Colors.grey.shade400;
    }),
    trackColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
      if (states.contains(WidgetState.selected)) {
        return const Color(0xFF8E97FD).withOpacity(0.5);
      }
      return Colors.grey.shade700;
    }),
  ),
);