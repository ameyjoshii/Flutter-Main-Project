import 'package:flutter/material.dart';
import 'package:flutter_project_main/login_page.dart';
import 'package:flutter_project_main/preferences.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String? usernameError;
  String? passError;
  String? confirmPassError;
  bool pass = true;
  bool cPass = true;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: styledText(label: "Register Yourself"),
          leading: BackButton(
            color: Colors.white,
            onPressed:() {
              Navigator.pop(context);
            }
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("asset/bg3.png"),fit: BoxFit.fill, opacity: 0.3,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(50),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    label: const Text("Choose Username"),
                    prefixIcon: const Icon(Icons.account_box),
                    errorText: usernameError,
                  ),
                  onChanged: (val){
                    setState(() {
                      if(val.isEmpty){
                        usernameError = "Invalid Username";
                      }
                      // else if(val == prefs(key)){
                      //   usernameError = "Username already taken";
                      // }
                      else {
                        usernameError = null;
                      }
                    });
                  },
                  controller: usernameController,
                ),
                TextField(
                  obscureText: pass,
                  decoration: InputDecoration(
                    label: const Text("New Password"),
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
                    errorText: passError,
                  ),
                  onChanged: (val){
                    setState(() {
                      passError = val.isEmpty || val.length<6 ? "Invalid Password":null;
                    });
                  },
                  controller: passController,
                ),
                TextField(
                  obscureText: cPass,
                  decoration: InputDecoration(
                    label: const Text("Confirm Password"),
                    prefixIcon: const Icon(Icons.password_rounded),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          cPass = !cPass;
                        });
                      },
                      icon: Icon(
                          cPass ? Icons.visibility_off : Icons.visibility),
                    ),
                    errorText: confirmPassError,
                  ),
                  onChanged: (val){
                    setState(() {
                      confirmPassError = val!=passController.text ? "Password Mismatch": null;
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: MaterialButton(
                      color: navyBlue,
                      elevation: 10,
                      height: 40,
                      child: styledText(label: "Register"),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      onPressed: () {
                        Preferences.addData(
                            key: 'username',
                            value: usernameController.text,
                        );
                        Preferences.addData(
                          key: 'pass',
                          value: passController.text,
                        );
                        final snackBar = SnackBar(
                          content: const Text(
                            "You have been registered successfully.",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          elevation: 10,
                          backgroundColor: navyBlue,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        Navigator.pop(context);
                      }
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget styledText({String label = ''}) {
  return (
      Text(label,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.white,
        ),
      )
  );
}
