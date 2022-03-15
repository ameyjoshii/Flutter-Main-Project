import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

Color maroon = Colors.red.shade900;

class _LoginPageState extends State<LoginPage> {
  String errorUsername = '';

  String errorPassword = '';

  TextEditingController usernameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.red.shade50,
        appBar: AppBar(
          backgroundColor: maroon,
          toolbarHeight: 75,
          title: const Text(
            "GharDekho.com",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          elevation: 10,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: GestureDetector(
                child: const CircleAvatar(
                  radius: 22,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage("asset/user.png"),
                  ),
                ),
                onTap: () {},
              ),
            ),
          ],
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(50),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 77,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 70,
                      backgroundColor: Colors.black12,
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
                        errorUsername = val.isEmpty ? 'Enter Valid Username' : '';
                      });
                    },
                    controller: usernameController,
                  ),
                  TextField(
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      label: const Text("Password"),
                      prefixIcon: const Icon(Icons.password_rounded),
                      errorText: errorPassword,
                    ),
                    onChanged: (val) {
                      setState(() {
                        errorPassword =
                            val.isEmpty ? 'Enter Correct Password' : '';
                      });
                    },
                    controller: passwordController,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: MaterialButton(
                      color: maroon,
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
                        Navigator.pushNamed(context, 'second');
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: GestureDetector(
                      onTap: () {},
                      child: const Text(
                        "New User? Click here to register",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 14,
                          color: Colors.black,
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
