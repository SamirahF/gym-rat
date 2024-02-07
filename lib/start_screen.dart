import 'package:flutter/material.dart';
import 'package:gym_rat/home_Screen.dart';
// import 'package:gym_rat/home_Screen.dart';
import 'scroller_indicator.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  _StartScreenState createState() {
    return _StartScreenState();
  }
}

class _StartScreenState extends State<StartScreen> {
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
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            // Scrollable images with indicators
            Expanded(
              child: PageView(
                // Link the page view with the page co
                controller: pageController,
                children: [
                  Image.asset(
                    'assets/images/sport2.png',
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'assets/images/sport1.png',
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'assets/images/sport3.png',
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            // Indicators
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
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                print('h');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 199, 248, 86),
                  foregroundColor: Colors.black,
                  minimumSize: const Size(250, 40)),
              child: const Text("Get Started"),
            ),

            const SizedBox(
              height: 80,
            ),
          ],
        ),
      ),
    );
  }
}
