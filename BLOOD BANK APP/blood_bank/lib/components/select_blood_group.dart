import 'package:blood_bank/constants/colors.dart';
import 'package:blood_bank/providers/blood_type_provider.dart';
// import 'package:blood_bank/inherited_widget/blood_type_data.dart';
import 'package:blood_bank/screens/select_blood_group_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectBloodGroup extends StatelessWidget {
  const SelectBloodGroup({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // DISPLAY BLOOD GROUP
        Container(
          alignment: const Alignment(0, 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[300],
          ),
          width: 120,
          height: 50,
          child: Consumer<BloodTypeProvider>(
            builder: (context, value, child) {
              return Text(
                value.bloodType,
                style: const TextStyle(
                  fontSize: 18,
                  // color: Color(0XFF333333),
                  color: red1,
                  fontWeight: FontWeight.bold,
                ),
              );
            },
          ),
        ),
        // SELECT BLOOD GROUP
        GestureDetector(
          onTap: () => Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              // return const SelectBloodGroupPage();
              return const SelectBloodGroupPage();
            },
          )),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: red1,
            ),
            alignment: const Alignment(0, 0),
            width: 220,
            height: 50,
            child: const Text(
              "Select Blood Group",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
