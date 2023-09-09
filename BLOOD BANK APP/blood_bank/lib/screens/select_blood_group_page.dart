import 'dart:developer';

import 'package:blood_bank/constants/colors.dart';
// import 'package:blood_bank/inherited_widget/blood_type_data.dart';
import 'package:blood_bank/providers/blood_type_provider.dart';
import 'package:blood_bank/widgets/blood_type.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectBloodGroupPage extends StatefulWidget {
  // final String bloogGroup;
  // final String charge;
  const SelectBloodGroupPage({
    super.key,
    // required this.bloogGroup,
    // required this.charge,
  });

  @override
  State<SelectBloodGroupPage> createState() => _SelectBloodGroupPageState();
}

class _SelectBloodGroupPageState extends State<SelectBloodGroupPage> {
  final List bloodGroup = [
    ["A", false],
    ["B", false],
    ["AB", false],
    ["O", false],
    // ["HH", false],
  ];
  final List bloodCharge = [
    ["+", false],
    ["-", false],
  ];
  void selectBloodGroup(int index) {
    for (var blood in bloodGroup) {
      if (blood[1] == true) {
        // print(blood[0]);
        blood[1] = false;
      }
    }
    setState(() {
      bloodGroup[index][1] = !bloodGroup[index][1];
    });
    if (bloodGroup[index][1] == true) {
      Provider.of<BloodTypeProvider>(context, listen: false)
          .getBloodGroup(bloodGroup[index][0]);
      log("Selected : ${bloodGroup[index][0]}", name: "BLOOD GROUP");
    }
    // if ((bloodGroup[index][1] == true) && (bloodCharge[index][1] == true)) {
    //   log("${bloodGroup[index][0]} ${bloodCharge[index][0]}");
    // }
  }

  void selectCharge(int index) {
    for (var charge in bloodCharge) {
      if (charge[1] == true) {
        charge[1] = false;
      }
    }
    setState(() {
      bloodCharge[index][1] = !bloodCharge[index][1];
    });
    if (bloodCharge[index][1] == true) {
      Provider.of<BloodTypeProvider>(context, listen: false)
          .getCharge(bloodCharge[index][0]);
      log("Selected Charge : ${bloodCharge[index][0]}", name: "CHARGE");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "SELECT YOUR BLOOD GROUP",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: red1,
            fontSize: 14,
          ),
        ),
        // leading: IconButton(
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        //   icon: const Icon(Icons.arrow_back),
        // ),
        iconTheme: const IconThemeData(
          color: red1,
        ),
      ),
      // body: BloodGroupCard(),
      // body: BloodCharge(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: GridView.builder(
                itemCount: bloodGroup.length,
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: .1 / .1,
                ),
                itemBuilder: (context, index) {
                  return BloodGroupCard(
                    bloodType: bloodGroup[index][0],
                    isActive: bloodGroup[index][1],
                    onTap: () => selectBloodGroup(index),
                  );
                },
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BloodCharge(
                  chargeName: bloodCharge[0][0],
                  selectedCharge: bloodCharge[0][1],
                  onTap: () => selectCharge(0),
                ),
                const SizedBox(width: 10),
                BloodCharge(
                  chargeName: bloodCharge[1][0],
                  selectedCharge: bloodCharge[1][1],
                  onTap: () => selectCharge(1),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              margin: const EdgeInsets.only(top: 30),
              width: 320,
              height: 50,
              alignment: const Alignment(0, 0),
              decoration: BoxDecoration(
                color: red1,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                "Continue",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
