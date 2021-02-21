import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatelessWidget {
  double _mediaHeight;
  double _mediaWidth;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  List<String> boxes = ["Quiz", "Agent", "Emergency", "Child"];
  List<Color> boxesColors = [
    Colors.deepPurpleAccent,
    Colors.indigo,
    Colors.deepOrangeAccent,
    Colors.green
  ];

  showOptions(context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.WARNING,
      animType: AnimType.SCALE,
      title: 'Emergency Call',
      body:Container(
            height: 40,
            child: Center(
                child:
                Text(
                  'Son',
                  style: TextStyle(
                      fontSize: 35
                  ),
                )
            ),
      ),
      btnOkText: "Call",
      btnCancelOnPress: () {
        launch("tel://+12504445555");
      },
      btnOkOnPress: () {},
    )..show();
  }


  @override
  Widget build(BuildContext context) {
    _mediaHeight = MediaQuery.of(context).size.height;
    _mediaWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Color(0xffdedddd),
        appBar: AppBar(
          backgroundColor: Color(0Xff48758d),
          title: Text('Senior Help'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Row(
              children: [
                SizedBox(width: 10),
                Container(
                  margin: EdgeInsets.all(20),
                  height: _mediaWidth * 0.35,
                  width: _mediaWidth * 0.35,
                  child: Center(
                    child: Text(
                      "Quiz",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.deepPurpleAccent,
                  ),
                ),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/talk');
                  },
                  child: Container(
                    margin: EdgeInsets.all(20),
                    height: _mediaWidth * 0.35,
                    width: _mediaWidth * 0.35,
                    child: Center(
                      child: Text(
                        "Agent",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.indigo,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(width: 10),
                GestureDetector(
                  onTap: (){
                    showOptions(context);
                  },
                  child: Container(
                    margin: EdgeInsets.all(20),
                    height: _mediaWidth * 0.35,
                    width: _mediaWidth * 0.35,
                    child: Center(
                      child: Text(
                        "Emergency",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.deepOrangeAccent,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: (){
                    CollectionReference _customersFB = FirebaseFirestore.instance.collection('customers');
                    return _customersFB
                        .doc("userId")
                        .set({
                        "isUsta":0,
                      });
                    },
                  child: Container(
                    margin: EdgeInsets.all(20),
                    height: _mediaWidth * 0.35,
                    width: _mediaWidth * 0.35,
                    child: Center(
                      child: Text(
                        "Child",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.green,
                    ),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
