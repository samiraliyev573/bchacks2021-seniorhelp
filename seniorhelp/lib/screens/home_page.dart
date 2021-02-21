import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:seniorhelp/screens/quiz.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  List<DocumentSnapshot> todolist;
  StreamSubscription<QuerySnapshot> todolistsubscription;
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('todos');
  @override
  void initState() {
    super.initState();
    todolistsubscription = collectionReference.snapshots().listen((event) {
      setState(() {
        todolist = event.docs;
      });
    });
  }

  showOptions(context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.WARNING,
      animType: AnimType.SCALE,
      title: 'Emergency Call',
      body: Container(
        height: 40,
        child: Center(
            child: Text(
          'Son',
          style: TextStyle(fontSize: 35),
        )),
      ),
      btnOkText: "Call",
      btnCancelOnPress: () {
        launch("tel://+12504445555");
      },
      btnOkOnPress: () {},
    )..show();
  }

  @override
  void dispose() {
    todolistsubscription?.cancel();
    super.dispose();
  }

  double _mediaHeight;

  double _mediaWidth;

  List<String> boxes = ["Quiz", "Agent", "Emergency", "Child"];

  List<Color> boxesColors = [
    Colors.deepPurpleAccent,
    Colors.indigo,
    Colors.deepOrangeAccent,
    Colors.green
  ];

  @override
  Widget build(BuildContext context) {
    _mediaHeight = MediaQuery.of(context).size.height;
    _mediaWidth = MediaQuery.of(context).size.width;
    CollectionReference list = FirebaseFirestore.instance.collection('todos');
    Future<void> updateTask(String documentid) {
      return list.doc(documentid).update({'isChecked': true});
    }

    return Scaffold(
      backgroundColor: Color(0xffdedddd),
      appBar: AppBar(
        backgroundColor: Color(0Xff48758d),
        title: Text('Senior Help'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Text(
            "To Do:",
            style: TextStyle(
              fontSize: 35,
              color: Colors.white,
            ),
          ),
          todolist != null
              ? Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      padding: EdgeInsets.all(8),
                      itemCount: todolist.length,
                      itemBuilder: (context, index) {
                        String todoName = todolist[index].data()['name'];
                        String todoDate = todolist[index].data()['date'];
                        return Dismissible(
                          key: Key(todolist[index].id),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: ListTile(
                              title: Text(todoName),
                              subtitle: Text(todoDate),
                              trailing: IconButton(
                                onPressed: () {
                                  updateTask(todolist[index].id);
                                },
                                icon: todolist[index].data()['isChecked']
                                    ? Icon(
                                        Icons.done,
                                        color: Colors.greenAccent,
                                      )
                                    : Icon(Icons.done),
                              ),
                            ),
                          ),
                        );
                      }))
              : Expanded(
                  child: Container(
                  child: Center(
                    child: Text("Loading Your Todo List"),
                  ),
                )),
          Row(
            children: [
              SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/quiz');
                },
                child: Container(
                  margin: EdgeInsets.all(20),
                  height: _mediaWidth * 0.20,
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
              ),
              SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/talk');
                },
                child: Container(
                  margin: EdgeInsets.all(20),
                  height: _mediaWidth * 0.20,
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
                onTap: () {
                  showOptions(context);
                },
                child: Container(
                  margin: EdgeInsets.all(20),
                  height: _mediaWidth * 0.20,
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
              Container(
                margin: EdgeInsets.all(20),
                height: _mediaWidth * 0.20,
                width: _mediaWidth * 0.35,
                child: Center(
                  child: Text(
                    "Animals",
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
            ],
          ),
        ],
      ),
    );
  }
}
