// Made with <3 by Jimwel Valdez (jimvdz). Copyright (c) 2025. All rights reserved.
// Will contain yung colors to be used sa app

import 'package:flutter/material.dart';

final ThemeData myTheme = ThemeData(
  fontFamily: 'Nunito',
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFF4F46E5),
    brightness: Brightness.dark,
    primary: const Color(0xFF4F46E5),
    onPrimary: Colors.white,
    secondary: const Color(0xFF40317A),
    onSecondary: Colors.white,
    tertiary: const Color(0xFFC1B1FF), // Text card container color
    onTertiary: const Color(0xFF1E1E1E), // Text on text card container
    surface: const Color(0xFF1E1E1E), // App background color
    onSurface: Colors.white,
    surfaceContainerHighest: const Color(0xFF1C182D), // Card background color
    onSurfaceVariant: Colors.white,
    error: Colors.redAccent,
    onError: Colors.white,
  ),
  scaffoldBackgroundColor: const Color(0xFF1E1E1E),
  cardTheme: const CardTheme(
    color: Color(0xFF1C182D),
    shadowColor: Colors.black45,
  ),
  textTheme: TextTheme(
    displayLarge: nunitoBoldTextStyle.copyWith(fontSize: 72), // Winning number
    headlineLarge: nunitoBoldTextStyle.copyWith(fontSize: 36), // Game title
    bodyLarge: nunitoBoldTextStyle.copyWith(fontSize: 24), // Button text / Normal text
    bodyMedium: nunitoBoldTextStyle.copyWith(fontSize: 20), // Hint card text
    bodySmall: nunitoBoldTextStyle.copyWith(fontSize: 16), // Credits page text
    titleLarge: nunitoBoldTextStyle, // App bar
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF1C182D),
    titleTextStyle: nunitoBoldTextStyle,
    iconTheme: IconThemeData(color: Colors.white),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all(const Color(0xFF4F46E5)),
      foregroundColor: WidgetStateProperty.all(Colors.white),
    ),
  ),
);

// For Nunito font, kasi di gumagana fontweight, only fontvariations work
const TextStyle nunitoBoldTextStyle = TextStyle(
  fontFamily: 'Nunito',
  fontVariations: <FontVariation>[FontVariation('wght', 600)],
  color: Colors.white,
);