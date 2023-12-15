import 'package:blood_bank/firebase_options.dart';
import 'package:blood_bank/providers/blood_type_provider.dart';
import 'package:blood_bank/providers/patients_provider.dart';
import 'package:blood_bank/screens/auth/auth_gate.dart';
// import 'package:blood_bank/screens/home_page.dart';
// import 'package:blood_bank/screens/intro_page.dart';
// import 'package:blood_bank/screens/auth/login_page.dart';
// import 'package:blood_bank/screens/auth/register_page.dart';
// import 'package:blood_bank/screens/location_page.dart';
// import 'package:blood_bank/screens/welcome_page.dart';
import 'package:blood_bank/services/auth_service/auth_service.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const BloodBankApp(),
  );
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
        ChangeNotifierProvider<AuthService>(create: (context) => AuthService()),
      ],
      builder: (context, child) {
        return const MaterialApp(
          home: AuthGate(),
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
