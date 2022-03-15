import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'database.dart';
import 'login_page.dart';

class SellPage extends StatefulWidget {
  const SellPage({Key? key}) : super(key: key);

  @override
  State<SellPage> createState() => _SellPageState();
}

GlobalKey<FormState> key = GlobalKey<FormState>();
GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class _SellPageState extends State<SellPage> {
  String? errorTitle;
  String? errorName;
  String? errorPrice;
  String? errorArea;
  String? errorDesc;
  String? errorContact;
  TextEditingController titleController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController contactController = TextEditingController();

  String imgURL = 'https://cdn-icons-png.flaticon.com/512/195/195492.png';
  FirebaseStorage storage = FirebaseStorage.instance;

  uploadImage() async {
    ///Pick Image from Gallery
    final ImagePicker _picker = ImagePicker();
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    ///Create folder
    Reference reference =
        storage.ref().child("images/${DateTime.now().toString()}");

    ///Upload Image
    UploadTask uploadTask = reference.putFile(File(image!.path));

    ///Get URL
    await (await uploadTask).ref.getDownloadURL().then((value) {
      imgURL = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          backgroundColor: navyblue,
          title: const Text(
            "Fill Details",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          leading: BackButton(
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("asset/bg3.png"),
              fit: BoxFit.fitHeight,
              opacity: 0.6,
            ),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Column(children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 75,
                    child: CircleAvatar(
                      radius: 70,
                      backgroundImage: NetworkImage(imgURL),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MaterialButton(
                        onPressed: () {
                          uploadImage();
                        },
                        elevation: 20,
                        child: Text("Select Image"),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(color: Colors.white, width: 4),
                        ),
                      ),
                      // MaterialButton(
                      //   onPressed: () {
                      //     MyDatabase.updateData(
                      //       imgURL,
                      //       MyDatabase.dataKey,
                      //     ).then((value) {
                      //       setState(() {});
                      //     });
                      //   },
                      //   elevation: 20,
                      //   child: Text("Update"),
                      //   shape: RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.circular(20),
                      //     side: BorderSide(color: maroon, width: 4),
                      //   ),
                      // ),
                      // MaterialButton(
                      //   onPressed: () {
                      //     MyDatabase.selectData().then((value) {
                      //       setState(() {});
                      //     });
                      //   },
                      //   elevation: 20,
                      //   child: Text("Load Data"),
                      //   shape: RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.circular(20),
                      //     side: BorderSide(color: maroon, width: 4),
                      //   ),
                      // ),
                    ],
                  ),
                  TextField(
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      label: const Text("Title"),
                      prefixIcon: const Icon(Icons.house_outlined),
                      errorText: errorTitle,
                    ),
                    onChanged: (val) {
                      setState(() {
                        errorTitle = val.isEmpty ? 'Enter Title' : '';
                      });
                    },
                    controller: titleController,
                  ),
                  TextField(
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      label: const Text("Description"),
                      prefixIcon: const Icon(Icons.description_outlined),
                      errorText: errorDesc,
                    ),
                    onChanged: (val) {
                      setState(() {
                        errorDesc = val.isEmpty ? 'Enter Description' : '';
                      });
                    },
                    controller: descController,
                  ),
                  TextField(
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      label: const Text("Owner Name"),
                      prefixIcon:
                          const Icon(Icons.supervised_user_circle_outlined),
                      errorText: errorName,
                    ),
                    onChanged: (val) {
                      setState(() {
                        errorName = val.isEmpty ? 'Enter Name' : '';
                      });
                    },
                    controller: nameController,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      label: const Text("Area of Property (Sqft)"),
                      prefixIcon: const Icon(Icons.architecture),
                      suffixText: "Sqft",
                      errorText: errorArea,
                    ),
                    onChanged: (val) {
                      setState(() {
                        errorArea =
                            val.isEmpty ? 'Enter area of property in Sqft' : '';
                      });
                    },
                    controller: areaController,
                  ),
                  TextField(
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      label: const Text("Price (₹)"),
                      prefixIcon:
                          const Icon(Icons.account_balance_wallet_outlined),
                      errorText: errorPrice,
                    ),
                    onChanged: (val) {
                      setState(() {
                        errorPrice = val.isEmpty ? 'Enter Price' : '';
                      });
                    },
                    controller: priceController,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    maxLength: 10,
                    decoration: InputDecoration(
                      label: const Text("Contact Number"),
                      prefixIcon: const Icon(Icons.phone),
                      errorText: errorContact,
                    ),
                    onChanged: (val) {
                      setState(() {
                        errorContact = (val.length != 10 || val.isEmpty)
                            ? 'Enter Valid Contact Number'
                            : '';
                      });
                    },
                    controller: contactController,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: MaterialButton(
                      color: navyblue,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      onPressed: () {
                        MyDatabase.insertData(
                            titleController.text,
                            descController.text,
                            nameController.text,
                            areaController.text + " Sqft",
                            "₹" + priceController.text,
                            contactController.text,
                            imgURL);
                        final snackBar = SnackBar(
                          content: const Text(
                            "Your property is listed for sale.",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          elevation: 10,
                          backgroundColor: navyblue,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        MyDatabase.selectData().then((value) {
                            setState(() {});
                        });
                        setState(() {});
                        Navigator.pushNamedAndRemoveUntil(context, 'second', (route) => false);
                      },
                      child: const Text(
                        "SUBMIT",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
