import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context)!.settings.arguments as Map;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: item(styleText: "Details"),
            leading: BackButton(
                color: Colors.white,
                onPressed:() {
                  Navigator.pop(context);
                }
            ),
          ),
        body: Container(
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("asset/bg3.png"),
                opacity: 0.4,
                fit: BoxFit.fill,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Align(
                        alignment: Alignment.topCenter,
                        child: Image(image: NetworkImage(data['image']),
                          height: 300,
                          width: 400,
                          fit: BoxFit.fill,
                        ),
                    ),
                  ),
                  item(styleText: "Title: ",descText:"${data['title']}"),
                  item(styleText: "Description: ",descText:"${data['desc']}"),
                  item(styleText: "Owner Name: ",descText:"${data['name']}"),
                  item(styleText: "Price: ",descText:"${data['price']}"),
                  item(styleText: "Area: ",descText:"${data['area']}"),
                  item(styleText: "Contact: ",descText:"${data['contact']}"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget item({String styleText = '', String descText = ''}) {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            styleText,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            descText,
            textWidthBasis: TextWidthBasis.parent,
            overflow: TextOverflow.visible,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
      ],
    ),
  );
}
