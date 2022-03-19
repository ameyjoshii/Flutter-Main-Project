import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_project_main/login_page.dart';

class MyDatabase {
  static List<Map> data = [];
  static List<Map> allData = [];
  static CollectionReference sellFirestore =
      FirebaseFirestore.instance.collection('Sell');

  static insertData(String title, String desc, String name, String area,
      String price, String contact, String image) {
    String key = DateTime.now().toString();
    sellFirestore.doc(key).set({
      'title': title,
      'desc': desc,
      'name': name,
      'area': area,
      'price': price,
      'contact': contact,
      'image': image,
      'user': userEmail,
      'key':key,
    });
  }

  // static updateData(String image, String dataKey){
  //   db.child(dataKey).update({
  //     'image': image,
  //     'key': dataKey,
  //   });
  // }

  static Future deleteData(String key) async {
    sellFirestore.doc(key).delete().then((value) {
      selectData();
    });
  }

  static Future selectData() async {
    sellFirestore.where('user', isEqualTo: userEmail).get().then((value) {
      data.clear();
      value.docs.forEach((element) {
        data.add(element.data() as Map);
      });
    });
  }

  static Future selectAllData() async {
    sellFirestore.get().then((value) {
      allData.clear();
      value.docs.forEach((element) {
        Map temp = element.data() as Map;
        if (userEmail != temp['user']) allData.add(temp);
      });
    });
  }
}
