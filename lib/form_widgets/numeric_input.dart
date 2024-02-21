import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumericInputField extends StatefulWidget {
  final void Function(int) onValueChanged;
  const NumericInputField({required this.onValueChanged, super.key});

  @override
  _NumericInputFieldState createState() => _NumericInputFieldState();
}

class _NumericInputFieldState extends State<NumericInputField> {
  TextEditingController weightController = TextEditingController();

  int _value = 0;

  @override
  void initState() {
    super.initState();
    weightController.addListener(weightListener);
  }

  void weightListener() {
    setState(() {
      // to check if the weight is empty
      bool isWeightEmpty = weightController.text.isEmpty;
      // to check if the weight is not numerical
      int? weight = int.tryParse(weightController.text);
      if (isWeightEmpty || weight == null) {
        _value = 0;
      } else {
        _value = weight;
      }
      updateValue();
    });
  }

  void _increment() {
    setState(() {
      _value++;
      weightController.text = _value.toString();
      updateValue();
    });
  }

  void _decrement() {
    setState(() {
      if (_value > 0) {
        _value--;
        weightController.text = _value.toString();
        updateValue();
      }
    });
  }

  void updateValue() {
    return widget.onValueChanged(_value);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: const Icon(
            Icons.remove,
            color: Color.fromARGB(255, 199, 248, 86),
          ),
          onPressed: _decrement,
        ),
        SizedBox(
          width: 90,
          child: TextFormField(
            inputFormatters: [
              FilteringTextInputFormatter.allow(
                  RegExp(r'[0-9]')), // Allow only numbers
            ],
            style: const TextStyle(color: Colors.white),
            readOnly: false,
            textAlign: TextAlign.center,
            controller: weightController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              hintText: "0",
              hintStyle: TextStyle(color: Colors.white),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),
          ),
        ),
        IconButton(
          icon: const Icon(
            Icons.add,
            color: Color.fromARGB(255, 199, 248, 86),
          ),
          onPressed: _increment,
        ),
        IconButton(
          icon: const Icon(
            Icons.delete_forever,
            color: Colors.red,
          ), // Icon widget
          onPressed: () {
            weightController.clear();
            // Add your button functionality here
          },
        ),
      ],
    );
  }
}
