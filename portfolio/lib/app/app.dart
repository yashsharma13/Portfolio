// import 'package:flutter/material.dart';
// import 'package:portfolio/app/theme.dart';
// import 'package:portfolio/screens/home_screen.dart';

// class MyPortfolioApp extends StatelessWidget {
//   const MyPortfolioApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Yash Sharma',
//       theme: appTheme,
//       debugShowCheckedModeBanner: false,
//       home: const HomeScreen(),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:portfolio/app/theme.dart';
import 'package:portfolio/screens/home_screen.dart';

class MyPortfolioApp extends StatefulWidget {
  const MyPortfolioApp({super.key});

  @override
  State<MyPortfolioApp> createState() => _MyPortfolioAppState();
}

class _MyPortfolioAppState extends State<MyPortfolioApp> {
  ThemeMode _themeMode = ThemeMode.dark;

  void toggleTheme() {
    setState(() {
      _themeMode =
          _themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yash Sharma',
      debugShowCheckedModeBanner: false,

      themeMode: _themeMode,

      theme: ThemeData(
        brightness: Brightness.light,
        colorSchemeSeed: Colors.teal,
        scaffoldBackgroundColor: Colors.white,
      ),

      // darkTheme: appTheme,
      darkTheme: darkTheme,

      home: HomeScreen(
        toggleTheme: toggleTheme,
        isDark: _themeMode == ThemeMode.dark,
      ),
    );
  }
}
