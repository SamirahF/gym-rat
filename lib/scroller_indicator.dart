import 'package:flutter/material.dart';

class Indicator extends StatelessWidget {
  final bool active;

  const Indicator({super.key, required this.active});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110.0, // Adjust the width as needed
      height: 4.0, // Adjust the height as needed
      decoration: BoxDecoration(
        color: active ? const Color.fromARGB(255, 199, 248, 86) : Colors.grey,
        borderRadius: BorderRadius.circular(4.0),
      ),
    );
  }
}
