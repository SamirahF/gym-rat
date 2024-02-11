import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/percent_indicator.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key});

  @override
  _TimerScreen createState() {
    return _TimerScreen();
  }
}

class _TimerScreen extends State<TimerScreen> {
  double precent = 0;
  static int TimeInMin = 25;
  int TimeInSec = TimeInMin * 60;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 39, 39, 39),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Timer",
              style: TextStyle(color: Colors.white),
            ),
            CircularPercentIndicator(
              radius: 100.0,
              percent: 0.5,
              lineWidth: 50,
              progressColor: const Color.fromARGB(255, 199, 248, 86),
              backgroundColor: const Color.fromARGB(255, 81, 81, 81),
              center: const Text(
                'Set Timer',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              height: 80,
            ),
            Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () {}, child: Text('Go')),
                SizedBox(
                  width: 90,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Stop'),
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 81, 81, 81)),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 199, 248, 86))),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
