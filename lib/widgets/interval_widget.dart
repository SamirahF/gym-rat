import 'package:flutter/material.dart';

class IntervalWidget extends StatefulWidget {
  const IntervalWidget({super.key});

  @override
  _IntervalWidgetState createState() {
    return _IntervalWidgetState();
  }
}

class _IntervalWidgetState extends State<IntervalWidget> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Invertal'),
      ],
    );
  }
}
