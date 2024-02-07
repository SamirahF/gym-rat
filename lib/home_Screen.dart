import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:gym_rat/nav_screens.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreen createState() {
    return _HomeScreen();
  }
}

class _HomeScreen extends State<HomeScreen> {
  Widget activeScreen = const TimerScreen();
  void switchScreen(index) {
    if (index == 0) {
      setState(() {
        activeScreen = const TimerScreen();
      });
    }

    if (index == 1) {
      setState(() {
        activeScreen = const LibraryScreen();
      });
    }

    if (index == 2) {
      setState(() {
        activeScreen = const CalculatorScreen();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 39, 39, 39),
      body: activeScreen,
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: const Color.fromARGB(255, 199, 248, 86),
        color: const Color.fromARGB(255, 39, 39, 39),
        buttonBackgroundColor: const Color.fromARGB(255, 54, 54, 54),
        items: const <Widget>[
          Icon(
            Icons.access_alarm,
            size: 30,
            color: Color.fromARGB(255, 199, 248, 86),
          ),
          Icon(
            Icons.fitness_center_sharp,
            size: 30,
            color: Color.fromARGB(255, 199, 248, 86),
          ),
          Icon(
            Icons.calculate,
            size: 30,
            color: Color.fromARGB(255, 199, 248, 86),
          ),
        ],
        onTap: (index) {
          switchScreen(index);
        },
      ),
    );
  }
}
