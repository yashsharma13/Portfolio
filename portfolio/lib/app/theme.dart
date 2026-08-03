// import 'package:flutter/material.dart';

// final ThemeData appTheme = ThemeData.dark().copyWith(
//   primaryColor: Colors.teal,
//   colorScheme: ColorScheme.dark(
//     primary: Colors.teal,
//     secondary: Colors.tealAccent,
//   ),
//   cardTheme: CardThemeData(
//     elevation: 4,
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(12),
//       // margin: const EdgeInsets.all(8),
//     ),
//   ),
// );

import 'package:flutter/material.dart';

// final ThemeData darkTheme = ThemeData.dark().copyWith(
//   primaryColor: Colors.teal,
//   colorScheme: const ColorScheme.dark(
//     primary: Colors.teal,
//     secondary: Colors.tealAccent,
//   ),
//   scaffoldBackgroundColor: const Color(0xFF0F172A),
//   cardTheme: CardThemeData(
//     elevation: 4,
//     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//   ),
// );

// final ThemeData lightTheme = ThemeData.light().copyWith(
//   primaryColor: Colors.teal,
//   colorScheme: const ColorScheme.light(
//     primary: Colors.teal,
//     secondary: Colors.tealAccent,
//   ),
//   scaffoldBackgroundColor: const Color(0xFFF8FAFC),
//   cardTheme: CardThemeData(
//     elevation: 3,
//     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//   ),
// );

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  fontFamily: 'Manrope',
  primaryColor: Colors.teal,
  colorScheme: const ColorScheme.dark(
    primary: Colors.teal,
    secondary: Colors.tealAccent,
  ),
  scaffoldBackgroundColor: const Color(0xFF0F172A),
);

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  fontFamily: 'Manrope',
  primaryColor: Colors.teal,
  colorScheme: const ColorScheme.light(
    primary: Colors.teal,
    secondary: Colors.tealAccent,
  ),
  scaffoldBackgroundColor: const Color(0xFFF8FAFC),
);
