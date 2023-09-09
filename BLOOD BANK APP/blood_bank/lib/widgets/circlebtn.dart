import 'package:flutter/material.dart';

class ImageBtn extends StatelessWidget {
  final String imagePath;
  final double? width;
  final double? height;
  final void Function()? onTap;
  const ImageBtn({
    super.key,
    required this.imagePath,
    this.width,
    this.height,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        child: Image.asset(
          imagePath,
          width: width,
          height: height,
        ),
      ),
    );
  }
}
