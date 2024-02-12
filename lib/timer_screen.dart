import 'package:flutter/material.dart';
import 'package:gym_rat/scroller_indicator.dart';
import 'package:gym_rat/widgets/interval_widget.dart';
import 'package:gym_rat/widgets/stopwatch_widget.dart';
// import 'package:gym_rat/widgets/test.dart';
import 'package:gym_rat/widgets/timer_widget.dart';
// import 'package:gym_rat/widgets/timer_widget.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key});

  @override
  _TimerScreen createState() {
    return _TimerScreen();
  }
}

class _TimerScreen extends State<TimerScreen> {
  final PageController pageController = PageController();
  int currentPageIndex = 0;

  @override
  void initState() {
    // We first need to call the super init state.
    super.initState();
    pageController.addListener(_handlePageChange);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  // This method is triggered whenever the page
  // changes in the page view.
  void _handlePageChange() {
    // Calls the build method again
    setState(() {
      // This line retirevs the current page index
      // showing in the page view
      currentPageIndex = pageController.page!.round();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 39, 39, 39),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: PageView(
                // Link the page view with the page co
                controller: pageController,
                children: [
                  // ExampleApp(),
                  TimerWidget(),
                  StopwatchWidget(),
                  InvertalWidget(),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Indicator(active: currentPageIndex == 0),
                const SizedBox(width: 8.0),
                Indicator(active: currentPageIndex == 1),
                const SizedBox(width: 8.0),
                Indicator(active: currentPageIndex == 2),
              ],
            ),
            const SizedBox(
              height: 90,
            ),
          ],
        ),
      ),
    );
  }
}
