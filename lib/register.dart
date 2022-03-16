import 'package:flutter/material.dart';
import 'package:flutter_project_main/login_page.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String? usernameError;
  String? passError;
  String? confirmPassError;
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
          decoration: BoxDecoration(
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
                    label: Text("Choose Username"),
                    prefixIcon: Icon(Icons.account_box),
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
                  decoration: InputDecoration(
                    label: Text("New Password"),
                    prefixIcon: Icon(Icons.password_rounded),
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
                  decoration: InputDecoration(
                    label: Text("Confirm Password"),
                    prefixIcon: Icon(Icons.password_rounded),
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
                      color: navyblue,
                      elevation: 10,
                      height: 40,
                      child: styledText(label: "Register"),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      onPressed: (){

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
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.white,
        ),
      )
  );
}
