// import 'package:flutter/foundation.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gym_rat/const.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:audioplayers/audioplayers.dart';

int _currentMin = 0;
int _currentSec = 0;

class TimerWidget extends StatefulWidget {
  const TimerWidget({super.key});

  @override
  _TimerWidget createState() => _TimerWidget();
}

class _TimerWidget extends State<TimerWidget> {
  Widget currScreen = const _SetTimer();
  bool isStartButton = true;

  void switchScreen() {
    setState(() {
      currScreen = const _Countdown();
      isStartButton = false;
    });
  }

  void switchScreen1() {
    setState(() {
      currScreen = const _SetTimer();
      isStartButton = true;
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
                  onPressed: isStartButton
                      ? () {
                          switchScreen();
                        }
                      : null,
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(255, 81, 81, 81)),
                    backgroundColor: isStartButton
                        ? MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 199, 248, 86))
                        : MaterialStateProperty.all<Color>(priText2),
                  ),
                  child: Text("Start")),
              const SizedBox(
                width: 90,
              ),
              ElevatedButton(
                onPressed: !isStartButton
                    ? () {
                        switchScreen1();
                      }
                    : null,
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 81, 81, 81)),
                  backgroundColor: !isStartButton
                      ? MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 199, 248, 86))
                      : MaterialStateProperty.all<Color>(priText2),
                ),
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
  const _SetTimer({super.key});
  @override
  State<_SetTimer> createState() {
    return _SetTimerState();
  }
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
  const _Countdown({super.key});
  @override
  State<_Countdown> createState() {
    return _CountdownState();
  }
}

class _CountdownState extends State<_Countdown> {
  late String _timerDisplay;
  Timer? _timer;
  int seconds = 0;

  void startTimer() {
    seconds = _currentMin * 60 + _currentSec;
    final player = AudioCache();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        if (seconds > 0) {
          seconds--;
          _timerDisplay = _formatDuration(Duration(seconds: seconds));
        } else {
          player.play('timerAlarm.mp3');
          _timer?.cancel();
        }
      });
    });
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  @override
  void initState() {
    _timerDisplay = '00:00';
    startTimer();
    // We first need to call the super init state.
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer to avoid memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 25),
          child: CircularPercentIndicator(
            animation: true,
            animateFromLastPercent: true,
            animationDuration: 1000,
            backgroundWidth: 30,
            radius: 160.0,
            percent: 1 - (seconds / (_currentMin * 60 + _currentSec)),
            lineWidth: 20,
            circularStrokeCap: CircularStrokeCap.round,
            progressColor: const Color.fromARGB(255, 199, 248, 86),
            backgroundColor: const Color.fromARGB(255, 81, 81, 81),
            center: Text(
              _timerDisplay,
              style: const TextStyle(color: Colors.white, fontSize: 50),
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
