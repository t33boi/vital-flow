import 'package:cloud_firestore/cloud_firestore.dart';

class Firestore
{
  // get collection
  final CollectionReference patients = FirebaseFirestore.instance.collection("patients");
  // CREATE
  // READ 
  Stream<QuerySnapshot> getPatientes()
  {
    final patientStream = patients.snapshots();
    return patientStream;
  }
}