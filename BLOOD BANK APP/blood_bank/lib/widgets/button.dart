import 'package:flutter/material.dart';

class IntroButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;

  const IntroButton({
    super.key,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment(0, 0),
        width: 85,
        height: 30,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 15,
            decoration: TextDecoration.none,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
