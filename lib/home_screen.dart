import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_project_main/login_page.dart';
import 'package:flutter_project_main/preferences.dart';
import 'package:flutter_project_main/register.dart';

import 'database.dart';

GlobalKey<FormState> key = GlobalKey<FormState>();
GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    MyDatabase.selectData().then((value) {
      MyDatabase.selectAllData().then((value) {
        Timer(const Duration(seconds: 5), () {
          setState(() {});
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    MyDatabase.selectAllData();
    MyDatabase.selectData();
    // print("**all****${MyDatabase.allData}");
    // print("**sell****${MyDatabase.data}");
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          backgroundColor: navyBlue,
          title: const Text(
            "Housify.com",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          actions: [
            IconButton(
              onPressed: () {
                Preferences.dispose();
                if (auth.currentUser != null) auth.signOut();
                Navigator.pushReplacementNamed(context, 'first');
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.white,
              ),
            )
          ],
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("asset/bg3.png"),
                fit: BoxFit.fitHeight,
                opacity: 0.3),
          ),
          child: TabBarView(controller: tabController, children: [
            Center(
              child: ListView.builder(
                  itemCount: MyDatabase.allData.length,
                  itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(4),
                        child: ListTile(
                          onTap: () {
                            Navigator.pushNamed(context, 'fifth',
                                arguments: MyDatabase.allData[index]);
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          tileColor: navyBlue,
                          leading: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 30,
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  '${MyDatabase.allData[index]['image']}'),
                              radius: 26.5,
                            ),
                          ),
                          title: Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: tileText(
                                label:
                                    "${MyDatabase.allData[index]['title']} (${MyDatabase.allData[index]['area']})"),
                          ),
                          trailing: Padding(
                            padding: const EdgeInsets.all(10),
                            child: tileText(
                                label: "${MyDatabase.allData[index]['price']}"),
                          ),
                        ),
                      )),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: MyDatabase.data.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(4),
                        child: ListTile(
                          onTap: () {
                            Navigator.pushNamed(context, 'fifth',
                                arguments: MyDatabase.data[index]);
                          },
                          onLongPress: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                backgroundColor: navyBlue,
                                elevation: 10,
                                title: tileText(label: "Warning!!"),
                                content: const Text("Delete Item?"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      MyDatabase.deleteData(
                                              MyDatabase.data[index]['key'] ??
                                                  '')
                                          .then((value) {
                                        Navigator.pop(context);
                                      });
                                    },
                                    child: tileText(label: "Delete"),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: tileText(label: "Cancel"),
                                  ),
                                ],
                              ),
                            ).then((value) {
                              Timer(const Duration(seconds: 3), () {
                                setState(() {});
                              });
                            });
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          tileColor: navyBlue,
                          leading: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 30,
                            child: CircleAvatar(
                              backgroundImage:
                                  NetworkImage(MyDatabase.data[index]['image']),
                              radius: 26.5,
                            ),
                          ),
                          title: tileText(
                              label:
                                  "${MyDatabase.data[index]['title']} (${MyDatabase.data[index]['area']})"),
                          trailing:
                              tileText(label: MyDatabase.data[index]['price']),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: FloatingActionButton(
                      elevation: 10,
                      backgroundColor: navyBlue,
                      child:
                          const Icon(Icons.add, color: Colors.white, size: 30),
                      onPressed: () {
                        Navigator.pushNamed(context, 'third').then((value) {
                          Timer(const Duration(seconds: 2), () {
                            setState(() {});
                          });
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
        bottomNavigationBar: Container(
          color: navyBlue,
          child: TabBar(
            unselectedLabelColor: Colors.black54,
            labelColor: Colors.white,
            indicatorColor: Colors.white,
            controller: tabController,
            tabs: [
              textStyle(
                label: "BUY",
              ),
              textStyle(
                label: "SELL",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget drawerItem({String label = ''}) {
  return (Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      MaterialButton(
        onPressed: () {},
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    ],
  ));
}

Widget textStyle({String label = ''}) {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: (Text(
      label,
      style: const TextStyle(
        fontSize: 20,
      ),
    )),
  );
}

Widget tileText({String label = ''}) {
  return (Text(
    label,
    style: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  ));
}
