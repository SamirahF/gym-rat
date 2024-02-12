import 'package:flutter/material.dart';

class StopwatchWidget extends StatefulWidget {
  const StopwatchWidget({super.key});

  @override
  _StopwatchWidget createState() {
    return _StopwatchWidget();
  }
}

class _StopwatchWidget extends State<StopwatchWidget> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Stopatch'),
      ],
    );
  }
}
