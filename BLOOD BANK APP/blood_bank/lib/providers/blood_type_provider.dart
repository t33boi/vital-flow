import 'dart:developer';

import 'package:flutter/material.dart';

class BloodTypeProvider extends ChangeNotifier {
  // static String bloodGroup = "AB";
  // static String charge = "-";
  // String _bloodType = "$bloodGroup $charge";

  // get bloodType => _bloodType;

  // void getBloodGroup(String bloodGroupp) {
  //   log("blood group $bloodGroupp",level: 2);
  //   bloodGroup = bloodGroupp;
  //   notifyListeners();
  // }

  // void getCharge(String chargee) {
  //   charge = chargee;
  //   notifyListeners();
  // }
  // ignore: prefer_final_fields
  List _bloodType = [
    ["AB", "+"],
  ];
  void getBloodGroup(String bloodGroup) {
    log("blood group $bloodGroup",level: 2);
    _bloodType[0][0] = bloodGroup;
    notifyListeners();
  }
    void getCharge(String charge) {
    _bloodType[0][1] = charge;
    notifyListeners();
  }
  get bloodType => "${_bloodType[0][0]} ${_bloodType[0][1]}";
}
