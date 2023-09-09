import 'package:blood_bank/providers/blood_type_provider.dart';
import 'package:blood_bank/providers/patients_provider.dart';
// import 'package:blood_bank/screens/home_page.dart';
// import 'package:blood_bank/screens/intro_page.dart';
// import 'package:blood_bank/screens/auth/login_page.dart';
// import 'package:blood_bank/screens/auth/register_page.dart';
// import 'package:blood_bank/screens/location_page.dart';
import 'package:blood_bank/screens/welcome_page.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const BloodBankApp());
}

class BloodBankApp extends StatelessWidget {
  const BloodBankApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PatientsProvider>(
            create: (context) => PatientsProvider()),
        ChangeNotifierProvider<BloodTypeProvider>(
            create: (context) => BloodTypeProvider()),
      ],
      builder: (context, child) {
        return const MaterialApp(
          home: BloodBankWelcomeScreen(),
          // home: HomePage(),
          // home: LocationPage(),
          // home: LoginPage(),
          // home: RegisterPage(),
          // home: IntroPage(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
