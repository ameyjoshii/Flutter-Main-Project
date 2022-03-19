import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_main/details_page.dart';
import 'package:flutter_project_main/login_page.dart';
import 'package:flutter_project_main/preferences.dart';
import 'package:flutter_project_main/register.dart';
import 'package:flutter_project_main/sell_page.dart';

import 'home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Preferences.initPrefs();
  String? msg = Preferences.getData();


  runApp(
    MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      iconTheme: const IconThemeData(color: Colors.blueGrey,opacity: 100),
      colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: navyBlue,
          onPrimary: Colors.blueGrey,
          secondary: Colors.blueGrey.shade300,
          onSecondary: Colors.white,
          error: Colors.blueGrey.shade700,
          onError: Colors.blueGrey.shade700,
          background: Colors.blueGrey.shade300,
          onBackground: Colors.blueGrey.shade300,
          surface: Colors.blueGrey,
          onSurface: Colors.blueGrey),
    ),
    initialRoute: msg == 'success' ? 'second' : 'first',
    routes: {
      'first': (context) => const LoginPage(),
      'second': (context) => const HomeScreen(),
      'third': (context) => const SellPage(),
      'fourth': (context) => const Register(),
      'fifth': (context) => const DetailsPage(),
    },
  ),
  );
}

