import 'package:flutter/material.dart';
import 'package:gym_rat/const.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'dart:async';
import 'package:audioplayers/audioplayers.dart';

int _currentMinWorking = 0;
int _currentSecWorking = 0;

int _currentMinResting = 0;
int _currentSecResting = 0;

int _currentInterval = 1;

class CountDown extends StatefulWidget {
  const CountDown({super.key});

  @override
  _CountDownState createState() {
    return _CountDownState();
  }
}

class _CountDownState extends State<CountDown> {
  late Timer timer;
  int countdown = 10;
  final player = AudioCache();
  bool isPaused = false;
  String text = "Pause";

  void startCountdown() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (!isPaused) {
          countdown--;
          if (countdown == 3) {
            player.play("countDown.mp3");
          }
          if (countdown == 0) {
            timer.cancel();
            Navigator.of(context).pop();
          }
        }
      });
    });
  }

  @override
  void initState() {
    startCountdown();
    // We first need to call the super init state.
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Countdown \u{1F525} \u{1F4AA}",
          style: TextStyle(
              color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 60,
        ),
        Container(
          width: 150,
          height: 150,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: primary1,
          ),
          child: Center(
            child: Text(
              countdown.toString(),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 80,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: primary1, // Change background color here
            ),
            onPressed: () {
              // Close the dialog
              isPaused = !isPaused;
              if (isPaused) {
                setState(() {
                  text = "Resume";
                });
              } else {
                setState(() {
                  text = "Pause";
                });
              }
            },
            child: Text(text),
          ),
          const SizedBox(
            width: 50,
          ),
          ElevatedButton(
            onPressed: () {
              // Close the dialog
              if (player.fixedPlayer != null) {
                player.fixedPlayer!.stop();
              }
              Navigator.of(context).pop();
            },
            child: const Text('Skip'),
          ),
        ]),
      ],
    );
  }
}

class IntervalWidget extends StatefulWidget {
  const IntervalWidget({super.key});

  @override
  _IntervalWidgetState createState() {
    return _IntervalWidgetState();
  }
}

class _IntervalWidgetState extends State<IntervalWidget> {
  void start() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          // Return the pop-up widget
          return AlertDialog(
              contentPadding: EdgeInsets.zero,
              content: FractionallySizedBox(
                widthFactor: 1.3, // Adjust as needed
                heightFactor: 1.0, // Adjust as needed
                child: Container(
                  color: primary2,
                  child: CountDown(),
                ),
              ));
        }).then((value) => showDialog(
        context: context,
        builder: (BuildContext context) {
          // Return the pop-up widget
          return AlertDialog(
            contentPadding: EdgeInsets.zero,
            content: FractionallySizedBox(
              widthFactor: 1.3, // Adjust as needed
              heightFactor: 1.0, // Adjust as needed
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                color: primary2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _Timer(
                        workingTime:
                            _currentMinWorking * 60 + _currentSecWorking,
                        restTime: _currentMinResting * 60 + _currentSecResting,
                        intervals: _currentInterval),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Close the dialog
                        Navigator.of(context).pop();
                      },
                      child: const Text('Close'),
                    ),
                  ],
                ),
              ),
            ),
          );
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 15,
        ),
        const Text(
          'Working Time',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NumberPicker(
                itemWidth: 50,
                value: _currentMinWorking,
                minValue: 0,
                maxValue: 59,
                step: 1,
                haptics: true,
                onChanged: (value) =>
                    setState(() => _currentMinWorking = value),
                textStyle: const TextStyle(color: Colors.white54, fontSize: 15),
                selectedTextStyle:
                    const TextStyle(color: Colors.white, fontSize: 20),
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
                value: _currentSecWorking,
                minValue: 0,
                maxValue: 59,
                step: 1,
                haptics: true,
                onChanged: (value) =>
                    setState(() => _currentSecWorking = value),
                textStyle: const TextStyle(color: Colors.white54, fontSize: 15),
                selectedTextStyle:
                    const TextStyle(color: Colors.white, fontSize: 20),
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
        ),
        const Text(
          'Resting Time',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NumberPicker(
                itemWidth: 50,
                value: _currentMinResting,
                minValue: 0,
                maxValue: 59,
                step: 1,
                haptics: true,
                onChanged: (value) =>
                    setState(() => _currentMinResting = value),
                textStyle: const TextStyle(color: Colors.white54, fontSize: 15),
                selectedTextStyle:
                    const TextStyle(color: Colors.white, fontSize: 20),
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
                value: _currentSecResting,
                minValue: 0,
                maxValue: 59,
                step: 1,
                haptics: true,
                onChanged: (value) =>
                    setState(() => _currentSecResting = value),
                textStyle: const TextStyle(color: Colors.white54, fontSize: 15),
                selectedTextStyle:
                    const TextStyle(color: Colors.white, fontSize: 20),
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
        ),
        const Text(
          'Intervals',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Center(
          child: NumberPicker(
            itemWidth: 50,
            value: _currentInterval,
            minValue: 1,
            maxValue: 10,
            step: 1,
            haptics: true,
            onChanged: (value) => setState(() => _currentInterval = value),
            textStyle: const TextStyle(color: Colors.white54, fontSize: 15),
            selectedTextStyle:
                const TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        ElevatedButton(
            onPressed: start,
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(primary1)),
            child: const Text(
              "Start",
              style: TextStyle(color: Colors.black),
            )),
      ],
    );
  }
}

class _Timer extends StatefulWidget {
  final int workingTime;
  final int restTime;
  final int intervals;

  const _Timer({
    required this.workingTime,
    required this.restTime,
    required this.intervals,
  });

  @override
  _TimerState createState() => _TimerState();
}

class _TimerState extends State<_Timer> {
  late String _timerDisplay;
  Timer? timer;
  int intervalsCompleted = 1;
  bool isWorkingTime = true;
  int seconds = 0;

  void startTimer() {
    seconds = isWorkingTime ? widget.workingTime : widget.restTime;
    _timerDisplay = _formatDuration(Duration(seconds: seconds));
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        final player = AudioCache();

        if (seconds > 0) {
          seconds--;
          _timerDisplay = _formatDuration(Duration(seconds: seconds));
        } else {
          if (intervalsCompleted < widget.intervals * 2) {
            isWorkingTime = !isWorkingTime;
            player.play('timerAlarm.mp3');
            intervalsCompleted++;
            seconds = isWorkingTime ? widget.workingTime : widget.restTime;
            _timerDisplay = _formatDuration(Duration(seconds: seconds));
          } else {
            timer?.cancel();
            player.play('timerAlarm.mp3');
          }
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
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          isWorkingTime ? "Working Time" : "Rest Time",
          style: const TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 25),
          child: CircularPercentIndicator(
            restartAnimation: false,
            animation: true,
            animateFromLastPercent: true,
            animationDuration: (1 -
                        (seconds /
                            (isWorkingTime
                                ? widget.workingTime
                                : widget.restTime))) ==
                    0
                ? 0
                : 1000,
            backgroundWidth: 30,
            radius: 160.0,
            percent: 1 -
                (seconds /
                    (isWorkingTime ? widget.workingTime : widget.restTime)),
            lineWidth: 20,
            circularStrokeCap: CircularStrokeCap.round,
            progressColor: isWorkingTime
                ? const Color.fromARGB(255, 199, 248, 86)
                : Colors.blue,
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
