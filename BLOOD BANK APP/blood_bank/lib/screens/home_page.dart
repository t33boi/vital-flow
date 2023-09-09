import 'package:blood_bank/constants/colors.dart';
import 'package:blood_bank/providers/patients_provider.dart';
import 'package:blood_bank/widgets/notification_tile.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    loadHomePage();
  }

  loadHomePage() async {
    Future.delayed(
      const Duration(seconds: 5),
      () {
        setState(() {
          isLoading = true;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        // width: 300,
        width: MediaQuery.of(context).size.width * 0.8,
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
        child: Consumer<PatientsProvider>(
          builder: (context, value, child) {
            return ListView.builder(
              itemCount: value.patients.length,
              itemBuilder: (context, index) {
                return NotificationTile(patient: value.patients[index]);
              },
            );
          },
        ),
      ),
    );
  }
}
