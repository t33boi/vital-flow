import 'dart:developer';

import 'package:blood_bank/constants/colors.dart';
import 'package:blood_bank/models/hospital_model.dart';
import 'package:blood_bank/models/patient_model.dart';
import 'package:blood_bank/services/auth_service/auth_service.dart';
import 'package:blood_bank/widgets/notification_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../services/firestore.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = false;
  final Firestore _firestore = Firestore();
  @override
  void initState() {
    super.initState();
    loadHomePage();
  }

  loadHomePage() async {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        setState(() {
          isLoading = true;
        });
      },
    );
  }

  void signout() async {
    final authservice = Provider.of<AuthService>(context, listen: false);
    authservice.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        // width: 300,
        width: MediaQuery.of(context).size.width * 0.8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: signout,
              icon: const Icon(
                Icons.logout,
                size: 50,
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        // leading: const SizedBox(),
        titleTextStyle: TextStyle(
          fontSize: MediaQuery.of(context).size.width * 0.07,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Container(
              // width: 20,
              // height: 20,
              child: Stack(
                alignment: AlignmentDirectional.topEnd,
                children: [
                  // notification button
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notifications,
                      size: 30,
                    ),
                  ),
                  // number of notification
                  Container(
                    width: 25,
                    height: 25,
                    alignment: const Alignment(0, 0),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                    child: const Text(
                      "7",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
        backgroundColor: appBarColor,

        elevation: 0,
        title: const Text("Vital Flow"),
        centerTitle: true,
      ),
      body: Visibility(
        visible: isLoading,
        replacement: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset(
              "assets/lottie/loading_blood.json",
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.8,
            ),
          ],
        ),
        child: StreamBuilder<QuerySnapshot>(
          stream: _firestore.getPatientes(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              log("no");
              return const Text("No Notification...");
            } else {
              log("yes");
              List patients = snapshot.data!.docs;
              return ListView.builder(
                itemCount: patients.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot document = patients[index];
                  Map<String, dynamic> data =
                      document.data() as Map<String, dynamic>;
                  int patientId = index;
                  String patientName = data["patientName"];
                  String bloodNeeded = data["bloodNeeded"];
                  HospitalModel hospital = HospitalModel(
                      hospitalId: index, hospitalName: data["hospital"]);
                  final PatientsModel patient = PatientsModel(
                      patientId: patientId,
                      patientName: patientName,
                      bloodNeeded: bloodNeeded,
                      hospital: hospital);

                  return NotificationTile(
                    patient: patient,
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
