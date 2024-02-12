// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gym_rat/const.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

int _currentMin = 0;
int _currentSec = 0;

class TimerWidget extends StatefulWidget {
  const TimerWidget({super.key});

  @override
  _TimerWidget createState() => _TimerWidget();
}

class _TimerWidget extends State<TimerWidget> {
  Widget currScreen = _SetTimer();

  void switchScreen() {
    setState(() {
      currScreen = _Countdown();
    });
  }

  void switchScreen1() {
    setState(() {
      currScreen = _SetTimer();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary2,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            height: 430,
            child: currScreen,
          ),
          const Divider(color: Colors.grey, height: 32),
          const SizedBox(height: 10),
          Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      switchScreen();
                    });
                  },
                  child: const Text('Start')),
              const SizedBox(
                width: 90,
              ),
              ElevatedButton(
                onPressed: () {
                  switchScreen1();
                },
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(255, 81, 81, 81)),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(255, 199, 248, 86))),
                child: const Text('Stop'),
              )
            ],
          ))
        ],
      ),
    );
  }
}

class _SetTimer extends StatefulWidget {
  @override
  _SetTimerState createState() => _SetTimerState();
}

class _SetTimerState extends State<_SetTimer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NumberPicker(
              itemWidth: 50,
              value: _currentMin,
              minValue: 0,
              maxValue: 59,
              step: 1,
              haptics: true,
              onChanged: (value) => setState(() => _currentMin = value),
              textStyle: const TextStyle(color: Colors.white54, fontSize: 20),
              selectedTextStyle:
                  const TextStyle(color: Colors.white, fontSize: 30),
            ),
            const Text(
              "min",
              style: TextStyle(
                color: Colors.white54,
                fontSize: 15,
              ),
            ),
            const SizedBox(width: 16),
            const Text(
              ":",
              style: TextStyle(
                color: Color.fromARGB(255, 199, 248, 86),
                fontSize: 40,
              ),
            ),
            const SizedBox(width: 16),
            NumberPicker(
              itemWidth: 50,
              value: _currentSec,
              minValue: 0,
              maxValue: 59,
              step: 1,
              haptics: true,
              onChanged: (value) => setState(() => _currentSec = value),
              textStyle: const TextStyle(color: Colors.white54, fontSize: 20),
              selectedTextStyle:
                  const TextStyle(color: Colors.white, fontSize: 30),
            ),
            const Text(
              "sec",
              style: TextStyle(
                color: Colors.white54,
                fontSize: 15,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

class _Countdown extends StatefulWidget {
  @override
  _CountdownState createState() => _CountdownState();
}

class _CountdownState extends State<_Countdown> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 25),
          child: CircularPercentIndicator(
            backgroundWidth: 30,
            radius: 160.0,
            percent: 0.25,
            lineWidth: 20,
            progressColor: const Color.fromARGB(255, 199, 248, 86),
            backgroundColor: const Color.fromARGB(255, 81, 81, 81),
            center: const Text(
              'set timer',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(
          height: 80,
        ),
      ],
    );
  }
}
