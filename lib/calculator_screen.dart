import 'package:flutter/material.dart';
import 'package:gym_rat/bmi_screen.dart';
import 'package:gym_rat/const.dart';
import 'weight_conv_screen.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text(
          "Calculator",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: primary2,
      ),
      body: Center(
        child: Column(
          children: [
            const Divider(
              thickness: 10,
              height: 1,
              color: primary1,
            ),
            const SizedBox(
              height: 100,
            ),
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BMICalculator()),
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
                    fixedSize: const Size(200, 200)),
                child: const Text("Weight Convertor"),
              )
            ]),
          ],
        ),
      ),
    );
  }
}
