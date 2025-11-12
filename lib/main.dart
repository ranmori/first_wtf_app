import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:first_wtf_app/bottom_navigation.dart';
import 'package:first_wtf_app/firebase_options.dart';
import 'package:first_wtf_app/pages/forgot_password_page.dart';
import 'package:first_wtf_app/pages/login_page.dart';
import 'package:first_wtf_app/pages/onboarding_page.dart';
import 'package:first_wtf_app/pages/signup_page.dart';
import 'package:first_wtf_app/provider/hospital_notifier.dart';
import 'package:first_wtf_app/provider/user_notifier.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await GoogleSignIn.instance.initialize(
    clientId: Platform.isAndroid
        ? "915556525451-8o529t9tt97qmvlihf5ls0gp8io396hn.apps.googleusercontent.com"
        : "915556525451-b2a1u3ql6a7r07emm1ut75trh18of22a.apps.googleusercontent.com",
    serverClientId:
        "915556525451-jlbpidtr6oavum8hu9vnjvbsk89mja2o.apps.googleusercontent.com",
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=> HospitalNotifier(),
      child: ChangeNotifierProvider(
        create: (context) => UserNotifier(),
        child: MaterialApp(
          title: 'Save A Life',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
            textTheme: GoogleFonts.robotoTextTheme(),
          ),
          debugShowCheckedModeBanner: false,
          routes: {
            "/o": (context) => OnboardingPage(),
            "/home": (context) => BottomNavigation(),
            "/login": (context) => LoginPage(),
            "/signup": (context) => SignupPage(),
            "/forgot": (context) => ForgotPasswordPage(),
          },
          initialRoute: "/login",
          // home: BottomNavigation()
        ),
      ),
    );
  }
}
