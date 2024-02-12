import 'package:flutter/material.dart';
// import 'package:gym_rat/home_Screen.dart';
import 'package:gym_rat/start_screen.dart';

class GymRat extends StatefulWidget {
  const GymRat({super.key});

  @override
  State<GymRat> createState() {
    return _GymRatState();
  }
}

class _GymRatState extends State<GymRat> {
  ThemeData myTheme = ThemeData(
    // Other theme properties...
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0)), // Button shape
      ),
    ),
    // Define themes for TextButton and OutlinedButton similarly
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: myTheme,

      home: const StartScreen(), // Wrap StartScreen inside MaterialApp
    );
  }
}
