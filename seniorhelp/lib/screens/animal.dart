import 'package:flutter/material.dart';

class Animal extends StatefulWidget {
  @override
  _AnimalState createState() => _AnimalState();
}

class _AnimalState extends State<Animal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Animal"),
        ),
        body: Center(
          child: Text("Not Implemented Yet"),
        ));
  }
}
