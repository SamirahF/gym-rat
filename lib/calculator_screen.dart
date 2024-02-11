import 'package:flutter/material.dart';
import 'package:gym_rat/bmi_screen.dart';

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
              MaterialPageRoute(builder: (context) => BMICalculator()),
            );
          },
          style: ElevatedButton.styleFrom(
            fixedSize: const Size(200, 200),
            backgroundColor: const Color.fromARGB(255, 199, 248, 86),
            foregroundColor: Colors.black,
          ),
          child: const Text("BMI Calculator"),
        ),
        const SizedBox(
          height: 50,
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 199, 248, 86),
              foregroundColor: Colors.black,
              fixedSize: const Size(200, 200)),
          child: const Text("Weight Convertor"),
        )
      ]),
    );
  }
}
