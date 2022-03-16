import 'package:firebase_database/firebase_database.dart';

class MyDatabase {
  static List<Map> data = [];
  static DatabaseReference db = FirebaseDatabase.instance.ref('Properties');
  static DatabaseReference dbBuy = FirebaseDatabase.instance.ref('Buy');
  static DatabaseReference dbRent = FirebaseDatabase.instance.ref('Rent');
  static String dataKey = '';

  static insertData(String title , String desc, String name, String area, String price, String contact, String image) {

    dataKey = db.push().key!;

    db.child(dataKey).set({
      'title': title,
      'desc': desc,
      'name': name,
      'area': area,
      'price': price,
      'contact': contact,
      'image': image,
      'key': dataKey,
    });
  }

  // static updateData(String image, String dataKey){
  //   db.child(dataKey).update({
  //     'image': image,
  //     'key': dataKey,
  //   });
  // }

  static Future deleteData(String key) async{
    db.child(key).remove().then((value) => selectData());
  }

  static Future selectData() async{
    Map temp = {};
    db.once().then((value){
      temp = value.snapshot.value as Map;
      data.clear();
      temp.forEach((key, value) {
        data.add(value);
      });
      return data;
    });


  }


}