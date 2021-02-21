import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:seniorhelp/model/question.dart';

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int totalQuestion = quiz.length + 1;
  int questionNumber = 0;
  Question question;
  @override
  void initState() {
    super.initState();
  }

  String getAnswer() {
    return quiz[questionNumber].answer;
  }

  void nextQuestion(BuildContext context) {
    if (questionNumber < quiz.length - 1) {
      setState(() {
        questionNumber++;
      });
    } else {}
  }

  List<Icon> score = [];
  Color chosenColor = Color(0xFF243151);

  void checkAnswer(String userPickedAnswer) {
    String correctAnswer = getAnswer();
    setState(() {
      if (userPickedAnswer == correctAnswer) {
        score.add(
          Icon(
            Icons.check,
            color: Colors.green,
          ),
        );
      } else {
        score.add(
          Icon(
            Icons.close,
            color: Colors.red,
          ),
        );
      }

      nextQuestion(context);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Memory Jogger"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
                flex: 7,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          style: TextStyle(color: Color(0xFF8E98BD)),
                          children: [
                            TextSpan(
                                text: 'Question  ${questionNumber + 1}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 30)),
                            TextSpan(
                                text: "/$totalQuestion",
                                style: TextStyle(fontSize: 18))
                          ],
                        ),
                      ),
                      Text(
                        '- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -',
                        style:
                            TextStyle(color: Color(0xFF8E98BD), fontSize: 10),
                      ),
                    ],
                  ),
                )),
            Expanded(
                flex: 7,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      quiz[questionNumber].question,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ],
                )),
            Expanded(
              flex: 24,
              child: Column(
                children: <Widget>[
                  option(MediaQuery.of(context).size,
                      quiz[questionNumber].options[0].text),
                  option(MediaQuery.of(context).size,
                      quiz[questionNumber].options[1].text),
                  option(MediaQuery.of(context).size,
                      quiz[questionNumber].options[2].text),
                  option(MediaQuery.of(context).size,
                      quiz[questionNumber].options[3].text),
                ],
              ),
            ),
            SingleChildScrollView(
                dragStartBehavior: DragStartBehavior.down,
                physics: BouncingScrollPhysics(),
                reverse: true,
                scrollDirection: Axis.horizontal,
                child: Row(children: score)),
          ],
        ),
      ),
    );
  }

  GestureDetector option(Size size, String text) {
    return GestureDetector(
      onTap: () {
        checkAnswer(text);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
          width: size.width,
          height: size.height * 0.08,
          decoration: BoxDecoration(
            color: Colors.blueGrey,
            border: Border.all(color: Colors.black54, width: 5),
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  text,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
