import 'package:blood_bank/constants/colors.dart';
import 'package:blood_bank/screens/auth/register_page.dart';
import 'package:blood_bank/screens/intro_pages/intro_page_1.dart';
import 'package:blood_bank/screens/intro_pages/intro_page_2.dart';
import 'package:blood_bank/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'intro_pages/intro_page_3.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  PageController pageController = PageController();

  bool onLastPage = false;

  void checkLastPage(int index) {
    setState(() {
      onLastPage = (index == 2);
    });
  }

  final List<Widget> _pages = const [
    IntroPage1(),
    IntroPage2(),
    IntroPage3(),
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
          onPageChanged: (index) => checkLastPage(index),
          controller: pageController,
          children: [
            IntroPage1(),
            IntroPage2(),
            IntroPage3(),
          ],
        ),
        Container(
          alignment: Alignment(0, 0.75),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // skip button
              onLastPage
                  ? const SizedBox(
                      width: 85,
                    )
                  : IntroButton(
                      text: "Skip",
                      onTap: () {
                        pageController.jumpToPage(2);
                      },
                    ),
              // indicator
              SmoothPageIndicator(
                controller: pageController,
                count: _pages.length,
                effect: const WormEffect(
                  activeDotColor: appBarColor,
                  dotColor: Colors.red,
                ),
              ),
              // skip button
              onLastPage
                  ? IntroButton(
                      text: "Done",
                      onTap: () {
                        // Navigator.pushNamed(context, "/home");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const RegisterPage();
                            },
                          ),
                        );
                      },
                    )
                  : IntroButton(
                      text: "Next",
                      onTap: () {
                        pageController.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.linear,
                        );
                      },
                    )
            ],
          ),
        )
      ],
    );
  }
}
