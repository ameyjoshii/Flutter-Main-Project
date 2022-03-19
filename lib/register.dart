import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_main/login_page.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}
GlobalKey<FormState> formKey = GlobalKey<FormState>();

final FirebaseAuth auth = FirebaseAuth.instance;

class _RegisterState extends State<Register> {
  String? passError;
  String? confirmPassError;
  bool pass = true;
  bool cPass = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  String email = '';

  create() async {
    User? user = (await auth.createUserWithEmailAndPassword(
        email: emailController.text, password: passController.text))
        .user;
    email = user!.email!;
    setState(() {});

  }

  @override
  void dispose(){
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

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
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(50),
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      label: Text("Enter Email"),
                      prefixIcon: Icon(Icons.account_box),
                    ),
                    validator: (email) => !EmailValidator.validate(email!)
                        ? 'Enter a valid email'
                        : null,
                    controller: emailController,
                  ),
                  TextFormField(
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password cannot be empty';
                      }
                      return null;
                    },
                    onChanged: (val){
                      setState(() {
                        passError = val.length<6 ? "Password must be minimum 6 characters":null;
                      });
                    },
                    controller: passController,
                  ),
                  TextFormField(
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password cannot be empty';
                      }
                      return null;
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
                          if (formKey.currentState!.validate()) {
                            create();
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
                            ScaffoldMessenger.of(context).showSnackBar(
                                snackBar);
                            Navigator.pop(context);
                          }
                        }
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
