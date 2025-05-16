import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData.dark().copyWith(
  primaryColor: Colors.teal,
  colorScheme: ColorScheme.dark(
    primary: Colors.teal,
    secondary: Colors.tealAccent,
  ),
  cardTheme: CardTheme(
    elevation: 4,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
      // margin: const EdgeInsets.all(8),
    ),
  ),
);
