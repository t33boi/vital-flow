import 'package:blood_bank/constants/colors.dart';
import 'package:blood_bank/models/patient_model.dart';
import 'package:blood_bank/screens/location_page.dart';
import 'package:flutter/material.dart';

class PatientDetails extends StatelessWidget {
  final PatientsModel patient;
  const PatientDetails({super.key, required this.patient});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title:  Text(
          patient.patientName,
          style: const TextStyle(
            color: appBarColor,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: appBarColor),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
             Padding(
              padding: EdgeInsets.only(left: 20),
              child: Row(
                children: [
                 const Text(
                    "Patient Name : ",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.red,
                    ),
                  ),
                  Text(
                    patient.patientName,
                    style:const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Patient Details : ",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.red,
                    ),
                  ),
                  Container(
                    // width: MediaQuery.of(context).size.width * 0.6,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: const Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the1500s, when an unknown printer took a galley of type  and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                      style: TextStyle(
                        // fontSize: 10,
                        fontWeight: FontWeight.bold,
                        // overflow: TextOverflow.clip
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                // Navigator.pushNamed(context, "/location");
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const LocationPage();
                  },
                ));
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 25,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.red,
                ),
                child: const Text(
                  "Get Location",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
