import 'package:blood_bank/asset_manager/asset_manager.dart';
import 'package:blood_bank/components/select_blood_group.dart';
import 'package:blood_bank/constants/colors.dart';
// import 'package:blood_bank/inherited_widget/blood_type_data.dart';
import 'package:blood_bank/screens/auth/login_page.dart';
import 'package:blood_bank/screens/home_page.dart';
import 'package:blood_bank/widgets/input_field.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                // applogo
                Image.asset(
                  AssetManager.appLogo2,
                  width: 250,
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 30),
                  child: Text(
                    "REGISTER",
                    style: TextStyle(
                      color: red1,
                      fontSize: 30,
                      fontFamily: "monospace",
                    ),
                  ),
                ),
                // form
                const Row(
                  children: [
                    // FIRST NAME
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                          right: 5,
                        ),
                        child: InputField(
                          obscureText: false,
                          icon: Icon(Icons.person),
                          isPasswordField: false,
                          inputName: "First Name",
                          inputType: TextInputType.text,
                          togglePassword: null,
                          showPassword: false,
                        ),
                      ),
                    ),
                    // LAST NAME
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 5,
                        ),
                        child: InputField(
                          obscureText: false,
                          icon: Icon(Icons.person),
                          isPasswordField: false,
                          inputName: "Last Name",
                          inputType: TextInputType.text,
                          togglePassword: null,
                          showPassword: false,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                // EMAIL FIELD
                const InputField(
                  obscureText: false,
                  icon: Icon(Icons.email),
                  isPasswordField: false,
                  inputName: "Email",
                  inputType: TextInputType.emailAddress,
                  togglePassword: null,
                  showPassword: false,
                ),
                const SizedBox(
                  height: 25,
                ),
                // PASSWORD FIELD
                InputField(
                  obscureText: showPassword,
                  icon: const Icon(Icons.lock),
                  isPasswordField: true,
                  inputName: "Password",
                  inputType: TextInputType.visiblePassword,
                  togglePassword: togglePassword,
                  showPassword: showPassword,
                ),
                const SizedBox(
                  height: 25,
                ),
                // CONFIRM PASSWORD FIELD
                InputField(
                  obscureText: showPassword,
                  icon: const Icon(Icons.lock),
                  isPasswordField: true,
                  inputName: "Confirm Password",
                  inputType: TextInputType.visiblePassword,
                  togglePassword: togglePassword,
                  showPassword: showPassword,
                ),
                const SizedBox(
                  height: 25,
                ),
                // SELECT BLOOD GROUP
                const SelectBloodGroup(),
                const SizedBox(
                  height: 25,
                ),
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
                      "REGISTER",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                // foot
                const SizedBox(
                  height: 30,
                ),
                // already have an account
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already Have an Account?"),
                    TextButton(
                      onPressed: () =>
                          Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const LoginPage();
                        },
                      )),
                      child: const Text("LogIn"),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
