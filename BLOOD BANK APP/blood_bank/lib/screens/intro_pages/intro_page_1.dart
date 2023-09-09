import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset("assets/lottie/intro_page_1.json"),
            Text("1"),
          ],
        ),
      ),
    );
  }
}