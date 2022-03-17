import 'package:flutter/material.dart';
import 'package:flutter_project_main/preferences.dart';

import 'database.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

Color navyBlue = Colors.blueGrey;

class _LoginPageState extends State<LoginPage> {
  String? errorUsername;
  String? errorPassword;
  bool pass = true;

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("asset/bg.jpg"),
                fit: BoxFit.fitHeight,
                opacity: 0.8),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(60),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 90,
                    backgroundColor: Colors.blueGrey,
                    child: CircleAvatar(
                      radius: 85,
                      backgroundColor: Colors.black45,
                      foregroundImage: AssetImage("asset/villa.png"),
                    ),
                  ),
                  TextField(
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      label: const Text("Username"),
                      prefixIcon: const Icon(Icons.account_box),
                      errorText: errorUsername,
                    ),
                    onChanged: (val) {
                      setState(() {
                        errorUsername =
                            val.isEmpty ? 'Enter Valid Username' : null;
                      });
                    },
                    controller: usernameController,
                  ),
                  TextField(
                    keyboardType: TextInputType.name,
                    obscureText: pass,
                    decoration: InputDecoration(
                      label: const Text("Password"),
                      prefixIcon: const Icon(Icons.password_rounded),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            pass = !pass;
                          });
                        },
                        icon: Icon(
                            pass ? Icons.visibility_off : Icons.visibility),
                      ),
                      errorText: errorPassword,
                    ),
                    onChanged: (val) {
                      setState(() {
                        errorPassword =
                            val.isEmpty ? 'Enter Correct Password' : null;
                      });
                    },
                    controller: passwordController,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: MaterialButton(
                      color: navyBlue,
                      height: 45,
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        "LOGIN",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {

                      //  String? userName =   Preferences.getData(key: 'username');
                      //  String? pass =   Preferences.getData(key: 'pass')!;

                        if (usernameController.text == Preferences.getData(key: 'username')
                                &&
                            passwordController.text ==
                                Preferences.getData(key: 'pass')) {
                          Navigator.pushNamed(context, 'second');
                          MyDatabase.selectData();
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, 'fourth');
                      },
                      child: const Text(
                        "New User? Click here to register",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
