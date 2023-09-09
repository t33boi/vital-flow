import 'package:blood_bank/asset_manager/asset_manager.dart';
import 'package:blood_bank/models/patient_model.dart';
import 'package:blood_bank/screens/patient_details.dart';
import 'package:blood_bank/widgets/circlebtn.dart';
import 'package:flutter/material.dart';

class NotificationTile extends StatelessWidget {
  final PatientsModel patient;
  const NotificationTile({super.key, required this.patient});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: 100,
        child: Column(
          children: [
            ListTile(
              // blood image
              leading: CircleAvatar(
                child: Image.asset(
                  "assets/images/blood-drop.png",
                  // width: 300,
                  // height: 300,
                ),
              ),

              // title + hospital name
              title: Text("Needs ${patient.bloodNeeded}"),
              subtitle: Text("At ${patient.hospital.hospitalName}"),

              // accept + decline button
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // accept btn
                  ImageBtn(
                    onTap: () {
                      // Navigator.pushNamed(context, "/patient_details");
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return PatientDetails(patient: patient);
                        },
                      ));
                      const snackBar = SnackBar(
                        content: Text(
                          "ACCEPTED",
                          textAlign: TextAlign.center,
                        ),
                        backgroundColor: Colors.green,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    imagePath: AssetManager.acceptbtn,
                    width: 60,
                    height: 60,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  // decline button
                  ImageBtn(
                    imagePath: AssetManager.declineBtn,
                    width: 60,
                    height: 60,
                    onTap: () {
                      const snackBar = SnackBar(
                        content: Text(
                          "DECLINED",
                          textAlign: TextAlign.center,
                        ),
                        backgroundColor: Colors.red,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Divider(
                thickness: 3,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
