import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import 'database.dart';
import 'login_page.dart';

class SellPage extends StatefulWidget {
  const SellPage({Key? key}) : super(key: key);

  @override
  State<SellPage> createState() => _SellPageState();
}

GlobalKey<FormState> key = GlobalKey<FormState>();

class _SellPageState extends State<SellPage> {
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
        appBar: AppBar(
          backgroundColor: navyBlue,
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
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("asset/bg3.png"),
              fit: BoxFit.fitHeight,
              opacity: 0.6,
            ),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Center(
              child: Form(
                key: key,
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
                          child: const Text("Select Image"),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side:
                                const BorderSide(color: Colors.white, width: 4),
                          ),
                        ),
                      ],
                    ),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        label: Text("Title"),
                        prefixIcon: Icon(Icons.house_outlined),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Contact number is mandatory';
                        }
                        return null;
                      },
                      controller: titleController,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        label: Text("Description"),
                        prefixIcon: Icon(Icons.description_outlined),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Description is mandatory';
                        }
                        return null;
                      },
                      controller: descController,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        label: Text("Owner Name"),
                        prefixIcon:
                            Icon(Icons.supervised_user_circle_outlined),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Owner name is mandatory';
                        }
                        return null;
                      },
                      controller: nameController,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        label: Text("Area of Property (Sqft)"),
                        prefixIcon: Icon(Icons.architecture),
                        suffixText: "Sqft",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Area is mandatory';
                        }
                        return null;
                      },
                      controller: areaController,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        label: Text("Price (₹)"),
                        prefixIcon:
                            Icon(Icons.account_balance_wallet_outlined),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Price is mandatory';
                        }
                        return null;
                      },
                      controller: priceController,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ],
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
                              : null;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Contact number is mandatory';
                        }
                        return null;
                      },
                      controller: contactController,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: MaterialButton(
                        color: navyBlue,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        onPressed: () {
                          if (key.currentState!.validate()) {
                            MyDatabase.insertData(
                              titleController.text,
                              descController.text,
                              nameController.text,
                              areaController.text + " sqft",
                              "₹" + priceController.text,
                              contactController.text,
                              imgURL,
                            );
                            final snackBar = SnackBar(
                              content: const Text(
                                "Your property is listed for sale.",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              elevation: 10,
                              backgroundColor: navyBlue,
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                            MyDatabase.selectData().then((value) {
                              Navigator.pop(context);
                            });
                          }
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
      ),
    );
  }
}
