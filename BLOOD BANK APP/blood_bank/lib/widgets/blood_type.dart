import 'package:blood_bank/constants/colors.dart';
import 'package:flutter/material.dart';

class BloodGroupCard extends StatelessWidget {
  final String bloodType;
  final bool isActive;
  final void Function()? onTap;
  BloodGroupCard({
    super.key,
    required this.bloodType,
    this.isActive = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isActive ? red1 : Colors.grey[300],
          ),
          alignment: const Alignment(0, 0),
          width: 100,
          height: 100,
          child: Text(
            bloodType,
            style: TextStyle(
              color: isActive ? Colors.white : red1,
              fontSize: 30,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
    );
  }
}

class BloodCharge extends StatelessWidget {
  final String chargeName;
  final bool selectedCharge;
  final void Function()? onTap;
  const BloodCharge({
    super.key,
    required this.chargeName,
    this.selectedCharge = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 80,
        height: 80,
        alignment: const Alignment(0, 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: selectedCharge ? red1 : Colors.grey[400],
        ),
        child: Text(
          chargeName,
          style: TextStyle(
            color: selectedCharge ? Colors.white : red1,
            fontSize: 20,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}