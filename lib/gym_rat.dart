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
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: StartScreen(), // Wrap StartScreen inside MaterialApp
    );
  }
}
