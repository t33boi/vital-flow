import 'package:blood_bank/models/hospital_model.dart';

class PatientsModel {
  final int patientId;
  final String patientName;
  final String bloodNeeded;
  final HospitalModel hospital;

  PatientsModel({
    required this.patientId,
    required this.patientName,
    required this.bloodNeeded,
    required this.hospital,
  });
}
