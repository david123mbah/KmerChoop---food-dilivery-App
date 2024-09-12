import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.light(
    surface: Colors.white, // A clean and bright background
    primary: Colors.blueGrey.shade600, // A more vibrant and modern primary color
    secondary: Colors.blueAccent.shade100, // A soft secondary color that complements the primary
    tertiary: Colors.grey.shade50, // A light tertiary color for subtle highlights
    inversePrimary: Colors.blueGrey.shade800, // A darker shade for contrast in inverse situations
  ),
  appBarTheme: AppBarTheme(
    color: Colors.blueGrey.shade600, // Matches the primary color for consistency
    elevation: 0, // Flat design for a modern look
    iconTheme: const IconThemeData(color: Colors.white), // White icons for contrast
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.blueGrey.shade600, // Consistent button color
    textTheme: ButtonTextTheme.primary, // Ensure button text contrasts with the button color
  ),
  cardTheme: CardTheme(
    color: Colors.white, // Bright card background
    shadowColor: Colors.grey.shade300, // Soft shadows for a modern aesthetic
    elevation: 3, // Slight elevation for depth
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: Colors.blueGrey.shade900, fontSize: 16), // Enhanced readability
    bodyMedium: TextStyle(color: Colors.blueGrey.shade900, fontSize: 14),
    displayLarge: TextStyle(color: Colors.blueGrey.shade800, fontWeight: FontWeight.bold, fontSize: 24),
  ),
);
