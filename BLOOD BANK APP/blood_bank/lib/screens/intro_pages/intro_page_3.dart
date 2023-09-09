import 'package:blood_bank/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage3 extends StatelessWidget {
  const IntroPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Lottie.asset("assets/lottie/intro_page_3.json", width: 250),
            const SizedBox(height: 40),
           const Text(
              "YOU WOULD BE DIRECTED TO THE NEAREST HOSPITAL",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: backgroundColor,
                fontWeight: FontWeight.bold,
                fontSize: 35,

              ),
            ),
          ],
        ),
      ),
    );
  }
}
