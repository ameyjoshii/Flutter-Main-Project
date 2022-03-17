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
  await Preferences.initPrefs();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        iconTheme: IconThemeData(color: Colors.blueGrey,opacity: 100),
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
      initialRoute: 'first',
      routes: {
        'first': (context) => const LoginPage(),
        'second': (context) => const HomeScreen(),
        'third': (context) => const SellPage(),
        'fourth': (context) => const Register(),
        'fifth': (context) => const DetailsPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return const Scaffold(
    );
  }
}
