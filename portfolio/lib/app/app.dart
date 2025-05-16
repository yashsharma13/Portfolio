import 'package:flutter/material.dart';
import 'package:portfolio/app/theme.dart';
import 'package:portfolio/screens/home_screen.dart';

class MyPortfolioApp extends StatelessWidget {
  const MyPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yash Sharma | Portfolio',
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
