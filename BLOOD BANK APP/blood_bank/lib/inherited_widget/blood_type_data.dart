// import 'package:flutter/material.dart';

// class BloodTypeData extends InheritedWidget {
//   String? bloodGroup;
//   String? charge;
//   BloodTypeData(
//     this.bloodGroup,
//     this.charge, {
//     super.key,
//     required this.child,
//   }) : super(child: child);

//   final Widget child;

//   static BloodTypeData? of(BuildContext context) {
//     return context.dependOnInheritedWidgetOfExactType<BloodTypeData>();
//   }

//   @override
//   bool updateShouldNotify(BloodTypeData oldWidget) {
//     return (bloodGroup != oldWidget.bloodGroup) && (charge != oldWidget.charge);
//   }
// }
