import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 39, 39, 39),
      body: const Center(
        child: Text(
          'Welcome to the Home Page!',
          style: TextStyle(
              fontSize: 24.0, color: Color.fromARGB(255, 199, 248, 86)),
        ),
      ),
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
          //Handle button tap
        },
      ),
    );
  }
}
