import 'package:blood_bank/models/hospital_model.dart';
import 'package:flutter/material.dart';

class HospitalProvider extends ChangeNotifier {
  static List<HospitalModel> hospitals = [
    HospitalModel(
      hospitalId: 1,
      hospitalName: "Aptech Hospital 1",
    ),
    HospitalModel(
      hospitalId: 2,
      hospitalName: "Aptech Hospital 2",
    ),
    HospitalModel(
      hospitalId: 3,
      hospitalName: "Aptech Hospital 3",
    ),
    HospitalModel(
      hospitalId: 4,
      hospitalName: "Aptech Hospital 4",
    ),
    HospitalModel(
      hospitalId: 5 ,
      hospitalName: "Aptech Hospital 5",
    ),
  ];
}
