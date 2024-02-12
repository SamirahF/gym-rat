import 'package:flutter/material.dart';

class BMICalculator extends StatefulWidget {
  const BMICalculator({super.key});

  @override
  _BMICalculatorState createState() {
    return _BMICalculatorState();
  }
}

class _BMICalculatorState extends State<BMICalculator> {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  final String imagePath = "assets/images/bmi.jpeg";
  String? selectedAge;
  String scoreClassification = "";
  double bmiResult = 0.0;
  String gender = "Female";
  Map<double, String> classifications = {
    15: "Severe Thiness",
    17: "Moderate Thiness",
    18.5: "Mild Thiness",
    25: "Normal",
    30: "Overweight",
    35: "Obese Class I",
    40: "Obese Class II",
    41: "Obese Class III"
  };
  bool isHeightValid = false;
  bool isWeightValid = false;

  @override
  void initState() {
    super.initState();
    heightController.addListener(heightlistiner);
    weightController.addListener(weightListiner);
  }

  void heightlistiner() {
    setState(() {
      bool isHeightEmpty = heightController.text.isEmpty;
      double? height = double.tryParse(heightController.text);
      if (isHeightEmpty || height == null) {
        isHeightValid = false;
      } else {
        isHeightValid = true;
        calculateBMI();
      }
      print("isHeight Empty ${isHeightEmpty}");
      print("is height number ${height}");
      print("is height valid? ${isHeightValid}");
    });
  }

  void weightListiner() {
    setState(() {
      bool isWeightEmpty = weightController.text.isEmpty;
      double? weight = double.tryParse(weightController.text);
      if (isWeightEmpty || weight == null) {
        isWeightValid = false;
      } else {
        isWeightValid = true;
        calculateBMI();
      }
      print("isWeight Empty ${isWeightEmpty}");
      print("is weight number ${weight}");
      print("is weight valid? ${isWeightValid}");
    });
  }

  void calculateBMI() {
    if (heightController.text != "" && weightController.text != "") {
      double height = double.parse(heightController.text) / 100;
      double weight = double.parse(weightController.text);
      setState(() {
        bmiResult = weight / (height * height);
        for (var key in classifications.keys) {
          if (bmiResult <= key) {
            scoreClassification = classifications[key] ?? "-";
            break;
          }
          scoreClassification = classifications[41] ?? "-";
        }
      });
    } else {
      scoreClassification = "";
    }
  }

  // @TODO: Form validation
  @override
  Widget build(BuildContext context) {
    Widget leadDialog = Dialog(
        child: Image.asset(
      imagePath,
      height: 350,
    ));

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "BMI Calculator",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: const Color.fromARGB(255, 199, 248, 86),
      ),
      backgroundColor: const Color.fromARGB(255, 39, 39, 39),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Gender',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
              ),
              const SizedBox(width: 18),
              RadioMenuButton(
                  value: "Female",
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value.toString();
                    });
                  },
                  child: const Text(
                    "Female",
                    style: TextStyle(color: Colors.white),
                  )),
              RadioMenuButton(
                  value: "Male",
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value.toString();
                    });
                  },
                  child: const Text(
                    "Male",
                    style: TextStyle(color: Colors.white),
                  )),
            ],
          ),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Age',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
              ),
              const SizedBox(width: 50),
              DropdownButton(
                dropdownColor: const Color.fromARGB(255, 39, 39, 39),
                hint: const Text(
                  "Select your age",
                  style: TextStyle(color: Colors.white),
                ),
                items: [
                  '20-25 years',
                  '26-30 years',
                  '31-40 years',
                  '40-50 years',
                  '50+ years'
                ].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: const TextStyle(color: Colors.white),
                    ),
                  );
                }).toList(),
                value: selectedAge,
                onChanged: (String? value) {
                  setState(() {
                    selectedAge = value;
                  });
                },
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Height',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
              ),
              const SizedBox(width: 25),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    autovalidateMode: AutovalidateMode.always,
                    child: TextFormField(
                      controller: heightController,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter a value";
                        }
                        if (double.tryParse(value) == null) {
                          return "Please enter a valid value";
                        }
                        return null;
                      },
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                          hintText: 'Height (cm)',
                          hintStyle: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Weight',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
              ),
              const SizedBox(width: 25),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    autovalidateMode: AutovalidateMode.always,
                    child: TextFormField(
                      controller: weightController,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter a value";
                        }
                        if (double.tryParse(value) == null) {
                          return "Please enter a valid value";
                        }
                        return null;
                      },
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                          hintText: 'Weight (kg)',
                          hintStyle: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const SizedBox(height: 30),
          Text(
            isWeightValid && isHeightValid
                ? 'BMI Score: ${bmiResult.round()} (kg/m\u00B2)'
                : '',
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            isHeightValid && isWeightValid ? scoreClassification : "",
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: scoreClassification == "Normal"
                    ? Colors.green
                    : scoreClassification == "Severe Thiness" ||
                            scoreClassification == "Obese Class III"
                        ? Colors.red
                        : scoreClassification == "Moderate Thiness" ||
                                scoreClassification == "Obese Class II"
                            ? Colors.orange
                            : scoreClassification == "Mild Thiness" ||
                                    scoreClassification == "Obese Class I"
                                ? Colors.yellow
                                : scoreClassification == "Overweight"
                                    ? Colors.blue
                                    : Colors.white
                // Provide a default color
                ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) => leadDialog);
              },
              child: const Text("Click to display BMI Chart"))
        ],
      ),
    );
  }
}
