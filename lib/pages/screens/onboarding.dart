import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:variegata_project/auth/login_page.dart';
import 'package:variegata_project/pages/screens/onboarding/features_page.dart';
import 'package:variegata_project/pages/screens/onboarding/getstarted_page.dart';
import 'package:variegata_project/pages/screens/onboarding/welcome_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  //controller to keep track which page we're on
  PageController _controller = PageController();
  //keep track of we are on the last page or not
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _controller,
                onPageChanged: (index) {
                  setState(() {
                    onLastPage = (index == 2);
                  });
                },
                children: [
                  WelcomePage(),
                  FeaturesPage(),
                  GetStartedPage(),
                ],
              ),
            ),

            //penanda page / dot indicator
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: SmoothPageIndicator(
                      controller: _controller,
                      count: 3,
                      effect: ExpandingDotsEffect(
                        activeDotColor: Color(0xFFAEC2B6),
                        dotColor: Color(0xFFD9D9D9),
                        dotWidth: 6,
                        dotHeight: 6,
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    child: onLastPage
                        ? GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return LoginPage();
                                  },
                                ),
                              );
                            },
                            child: Container(
                              width: 82,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Color(0xFFAEC2B6),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: Center(
                                child: Text(
                                  "Start",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              _controller.nextPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeIn,
                              );
                            },
                            child: Container(
                              width: 82,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Color(0xFFAEC2B6),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: Center(
                                child: Text(
                                  "Next",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
