import 'package:firebase_database/firebase_database.dart';

class MyDatabase {
  static List<Map> data = [];
  static DatabaseReference db = FirebaseDatabase.instance.ref('Properties');
  static String dataKey = '';

  static Future insertData(String title , String desc, String name, String area, String price, String contact, String image) async{

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

  // static deleteData(String key){
  //   db.child(key).remove();
  // }

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