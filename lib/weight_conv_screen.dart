import 'package:flutter/material.dart';
import 'form_widgets/numeric_input.dart';

class WeightConvertorScreen extends StatefulWidget {
  const WeightConvertorScreen({super.key});

  @override
  _WeightConvertorScreen createState() {
    return _WeightConvertorScreen();
  }
}

class _WeightConvertorScreen extends State<WeightConvertorScreen> {
  int inputValue = 0;
  String placeholderText = "Kg";
  String pageTitle = "Convert Kilograms to Pounds";
  double result = 0.0;

  // convert the weight from pounds to kg
  double convertFromLbstoKg(weight) {
    return weight / 2.205;
  }

  // convert the weight from kg to pounds
  double convertFromKgtoLbs(weight) {
    return weight * 2.205;
  }

  void swap() {
    setState(() {
      if (placeholderText == "Kg") {
        placeholderText = "Lbs";
        pageTitle = "Convert Pounds to Kilograms";
      } else {
        placeholderText = "Kg";
        pageTitle = "Convert Kilograms to Pounds";
      }
      calculateResult();
    });
  }

  void calculateResult() {
    if (placeholderText == "Kg") {
      setState(() {
        result = convertFromKgtoLbs(inputValue);
      });

      return;
    }
    setState(() {
      result = convertFromLbstoKg(inputValue);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weight Convertor",
            style: TextStyle(color: Colors.black)),
        backgroundColor: const Color.fromARGB(255, 199, 248, 86),
      ),
      backgroundColor: const Color.fromARGB(255, 39, 39, 39),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage(
                'assets/images/weight.jpeg'), // Change the path to your image
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.2), // Adjust the opacity level here
              BlendMode.dstATop, // Apply the color filter
            ),
            // Adjust the fit as needed
          ),
        ),
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              pageTitle,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 80,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(25, 0, 5, 0),
                  height: 40,
                  width: 45,
                  child: Text(
                    placeholderText,
                    style: const TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
                NumericInputField(
                  onValueChanged: (value) {
                    setState(() {
                      inputValue = value;
                    });
                  },
                ),
                const SizedBox(
                  width: 20,
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                    style: const ButtonStyle(
                        fixedSize: MaterialStatePropertyAll(Size(100, 40)),
                        backgroundColor: MaterialStatePropertyAll(
                            Color.fromARGB(255, 199, 248, 86))),
                    onPressed: calculateResult,
                    child: const Text(
                      "Convert",
                      style: TextStyle(color: Colors.black),
                    )),
                const SizedBox(
                  width: 30,
                ),
                OutlinedButton(
                    style: const ButtonStyle(
                        fixedSize: MaterialStatePropertyAll(Size(100, 40)),
                        backgroundColor: MaterialStatePropertyAll(
                            Color.fromARGB(255, 199, 248, 86))),
                    onPressed: swap,
                    child: const Text(
                      "Swap",
                      style: TextStyle(color: Colors.black),
                    )),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Text("Result: ${double.parse(result.toStringAsFixed(2))}",
                style: const TextStyle(color: Colors.white, fontSize: 22))
          ]),
        ),
      ),
    );
  }
}
