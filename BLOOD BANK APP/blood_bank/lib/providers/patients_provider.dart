import 'package:blood_bank/models/patient_model.dart';
import 'package:blood_bank/providers/hospital_provider.dart';
import 'package:flutter/material.dart';

class PatientsProvider extends ChangeNotifier {
  List<PatientsModel> patient = [
    PatientsModel(
      patientId: 1,
      patientName: "UNKNOWN 1",
      bloodNeeded: "AB+",
      hospital: HospitalProvider.hospitals[0],
    ),
    PatientsModel(
      patientId: 2,
      patientName: "UNKNOWN 2",
      bloodNeeded: "AB+",
      hospital: HospitalProvider.hospitals[4],
    ),
    PatientsModel(
      patientId: 3,
      patientName: "UNKNOWN 3",
      bloodNeeded: "AB+",
      hospital: HospitalProvider.hospitals[2],
    ),
    PatientsModel(
      patientId: 4,
      patientName: "UNKNOWN 4",
      bloodNeeded: "AB+",
      hospital: HospitalProvider.hospitals[1],
    ),
    PatientsModel(
      patientId: 5,
      patientName: "UNKNOWN 5",
      bloodNeeded: "AB+",
      hospital: HospitalProvider.hospitals[3],
    ),
    PatientsModel(
      patientId: 6,
      patientName: "UNKNOWN 6",
      bloodNeeded: "AB+",
      hospital: HospitalProvider.hospitals[2],
    ),
  ];
  get patients => patient;
}
