import 'package:flutter/material.dart';

class WeightConvertorScreen extends StatelessWidget {
  const WeightConvertorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "Weight Convertor Screen",
            style: TextStyle(color: Colors.black),
          )
        ]),
      ),
    );
  }
}
