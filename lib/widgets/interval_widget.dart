import 'package:flutter/material.dart';

class InvertalWidget extends StatefulWidget {
  const InvertalWidget({super.key});

  @override
  _InvertalWidget createState() {
    return _InvertalWidget();
  }
}

class _InvertalWidget extends State<InvertalWidget> {
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
