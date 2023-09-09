import 'package:blood_bank/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage2 extends StatelessWidget {
  const IntroPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Lottie.asset("assets/lottie/intro_page_2.json",width: 300,),
          const Text(
            "BLOODS WILL BE TESTED!",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: backgroundColor,
              fontWeight: FontWeight.bold,
              fontSize: 35,
            ),
          ),
        ],
      ),
    );
  }
}
