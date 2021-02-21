import 'package:flutter/material.dart';
import 'package:seniorhelp/screens/animal.dart';
import 'screens/home_page.dart';
import 'screens/quiz.dart';
import 'screens/talk_page.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => HomePage(),
          '/talk': (context) => TalkPage(),
          '/quiz': (context) => Quiz(),
          '/animal': (context) => Animal(),
        });
  }
}
