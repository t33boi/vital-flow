import 'package:blood_bank/constants/colors.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final bool obscureText;
  final Widget? icon;
  final bool isPasswordField;
  final String inputName;
  final TextInputType inputType;
  final Function()? togglePassword;
  final bool showPassword;

  const InputField({
    super.key,
    required this.obscureText,
    required this.icon,
    required this.isPasswordField,
    required this.inputName,
    required this.inputType,
    required this.togglePassword,
    required this.showPassword,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      keyboardType: inputType,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: red1,
            width: 3,
          ),
        ),
        // icon: Icon(Icons.email),
        prefixIcon: icon,
        prefixIconColor: red1,
        suffixIcon: isPasswordField
            ? IconButton(
                onPressed: togglePassword,
                icon: Icon(
                  showPassword
                      ? Icons.remove_red_eye
                      : Icons.remove_red_eye_outlined,
                  color: red1,
                ))
            : null,
        focusColor: red1,
        label: Text(
          inputName,
          style: const TextStyle(
            color: red1,
          ),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: red1,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
