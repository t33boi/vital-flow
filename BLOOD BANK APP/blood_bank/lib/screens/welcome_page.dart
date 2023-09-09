import 'package:blood_bank/asset_manager/asset_manager.dart';
import 'package:blood_bank/constants/colors.dart';
import 'package:blood_bank/screens/intro_page.dart';
import 'package:flutter/material.dart';

class BloodBankWelcomeScreen extends StatelessWidget {
  const BloodBankWelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // app logo
              Container(
                child: Image.asset(
                  AssetManager.appLogo,
                  width: 300,
                  height: 300,
                ),
              ),
              // get started button
              GestureDetector(
                // onTap: () => Navigator.pushNamed(context, "/intro"),
                onTap: () => Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return IntroPage();
                  },
                )),
                child: Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.red[600],
                      borderRadius: BorderRadius.circular(5)),
                  child: const Center(
                    child: Text(
                      "Get Started",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
