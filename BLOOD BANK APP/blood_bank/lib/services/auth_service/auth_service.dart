import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AuthService extends ChangeNotifier {
  // instance of auth
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore  _firestore = FirebaseFirestore.instance;

  // signin method
  Future<UserCredential> signInWithEmailandPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
          log(userCredential.toString());
          _firestore.collection("users").doc(userCredential.user!.uid).set({
             "uid": userCredential.user!.uid,
            "email": userCredential.user!.email,
            "notifications":[],
          },SetOptions(merge: true));
      return userCredential;
    } on FirebaseAuthException catch (e) {
      log(e.toString());
      throw Exception(e.code);
    }
  }

  // signin method
  Future<UserCredential> signUpWithEmailandPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      _firestore.collection("users").doc(userCredential.user!.uid).set({
             "uid": userCredential.user!.uid,
            "email": userCredential.user!.email,
            "notifications":[],
          },SetOptions(merge: true));
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.toString());
    }
  }

  // sign out method
  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }
}
