import 'package:flutter/material.dart';
import 'package:gym_rat/bmi_screen.dart';
import 'weight_conv_screen.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const BMICalculator()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 199, 248, 86),
            foregroundColor: Colors.black,
          ),
          child: const Text("BMI Calculator"),
        ),
        const SizedBox(
          height: 50,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const WeightConvertorScreen()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 199, 248, 86),
            foregroundColor: Colors.black,
          ),
          child: const Text("Weight Convertor"),
        )
      ]),
    );
  }
}
