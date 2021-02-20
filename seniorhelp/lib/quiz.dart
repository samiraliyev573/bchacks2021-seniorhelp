import 'package:flutter/material.dart';



class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}
// START PAGE
// DARKER THEME
// QUIZ
// TALK Agent
// Emergency
class _QuizState extends State<Quiz> {

  double _mediaHeight;
  double _mediaWidth;

  List<String> boxes = ["Quiz","Agent","Emergency","Child"];
  List<Color> boxesColors = [Colors.deepPurpleAccent,Colors.indigo,Colors.deepOrangeAccent,Colors.green];

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
          SizedBox(height: _mediaHeight*0.01),
          Wrap(
            runSpacing: 25.0,
            spacing: 25.0,
            children: [
              for(int i=0;i<boxes.length;i++)...{
                SizedBox(width:10),
                Container(
                  height: _mediaWidth*0.35,
                  width: _mediaWidth*0.35,
                  child: Center(
                    child: Text(
                      boxes[i],
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)
                    ),
                    color: boxesColors[i],
                  ),
                ),
              },
            ],
          )
        ]
      )
    );
  }
}
