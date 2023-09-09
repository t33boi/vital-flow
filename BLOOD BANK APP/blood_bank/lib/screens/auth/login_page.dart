import 'package:blood_bank/asset_manager/asset_manager.dart';
import 'package:blood_bank/constants/colors.dart';
import 'package:blood_bank/screens/auth/register_page.dart';
import 'package:blood_bank/screens/home_page.dart';
import 'package:blood_bank/widgets/input_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool showPassword = true;

  void togglePassword() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // app logo
                Column(
                  children: [
                    Image.asset(
                      AssetManager.appLogo2,
                      width: 250,
                    ),
                    // login text
                    const Padding(
                      padding: EdgeInsets.only(bottom: 30),
                      child: Text(
                        "LOG IN",
                        style: TextStyle(
                            color: red1, fontSize: 30, fontFamily: "monospace"),
                      ),
                    ),
                  ],
                ),
                // form
                Column(
                  children: [
                    // email field
                    InputField(
                      obscureText: false,
                      icon: const Icon(Icons.email),
                      isPasswordField: false,
                      inputName: "Email",
                      inputType: TextInputType.emailAddress,
                      togglePassword: null,
                      showPassword: showPassword,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    // PASSWORD FIELD
                    InputField(
                        obscureText: true,
                        icon: const Icon(Icons.lock),
                        isPasswordField: true,
                        inputName: "Password",
                        inputType: TextInputType.visiblePassword,
                        togglePassword: togglePassword,
                        showPassword: showPassword),
                    // login btn
                    GestureDetector(
                      onTap: () => Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const HomePage();
                        },
                      )),
                      child: Container(
                        margin: const EdgeInsets.only(top: 30),
                        width: 320,
                        height: 50,
                        alignment: const Alignment(0, 0),
                        decoration: BoxDecoration(
                          color: red1,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          "LOG IN",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      alignment: const Alignment(1, 0),
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Forgot Password?",
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                // already have an account
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't Have an Account?"),
                    TextButton(
                      onPressed: () =>
                          Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const RegisterPage();
                        },
                      )),
                      child: const Text("Register!"),
                    )
                  ],
                ),
                // const SizedBox(
                //   height: 250,
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
