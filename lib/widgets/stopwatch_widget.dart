import 'dart:async';

import 'package:flutter/material.dart';

import '../const.dart';

class StopwatchWidget extends StatefulWidget {
  const StopwatchWidget({super.key});

  @override
  _StopwatchWidget createState() {
    return _StopwatchWidget();
  }
}

class _StopwatchWidget extends State<StopwatchWidget> {
  late String _timerDisplay;
  Timer? _timer;
  int seconds = 0;
  bool isStartTimer = false;
  @override
  void initState() {
    _timerDisplay = '00:00';
    // We first need to call the super init state.
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer to avoid memory leaks
    super.dispose();
  }

  void startTimer() {
    if (!isStartTimer) {
      _timer = Timer.periodic(const Duration(seconds: 1), (_) {
        setState(() {
          seconds++;
          _timerDisplay = _formatDuration(Duration(seconds: seconds));
          // } else {
          //   _timer?.cancel();
          // }
        });
      });
    }
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
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _timerDisplay.toString(),
              style: const TextStyle(color: Colors.white, fontSize: 70),
            ),
            const SizedBox(
              height: 80,
            ),
            const Divider(color: Colors.grey, height: 32),
            const SizedBox(height: 10),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: !isStartTimer
                          ? () {
                              setState(() {
                                startTimer();
                                isStartTimer = true;
                              });
                            }
                          : () {
                              setState(() {
                                _timer?.cancel();
                                isStartTimer = false;
                                print('hhhh');
                              });
                            },
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 81, 81, 81)),
                        backgroundColor: !isStartTimer
                            ? MaterialStateProperty.all<Color>(
                                const Color.fromARGB(255, 199, 248, 86))
                            : MaterialStateProperty.all<Color>(a5),
                      ),
                      child: Text(!isStartTimer ? "Start" : "Stop")),
                  const SizedBox(
                    width: 90,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        seconds = 0;
                        _timerDisplay = '00:00';
                      });
                    },
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 81, 81, 81)),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(priText2),
                    ),
                    child: const Text('Reset'),
                  )
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
