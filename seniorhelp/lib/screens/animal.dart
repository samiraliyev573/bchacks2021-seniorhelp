import 'package:flutter/material.dart';
import 'package:echoar_package/echoar_package.dart';
import 'package:echoar_package/EchoArEntry.dart';

import 'package:flutter_3d_obj/flutter_3d_obj.dart';

class Animal extends StatefulWidget {
  EchoAR echoAR;
  @override
  _AnimalState createState() => _AnimalState();
}

class _AnimalState extends State<Animal> {
  int _counter = 0;

  String _modelHologramPath = "";

  String value;

  void _incrementCounter() async {
    if (widget.echoAR == null)
      widget.echoAR = EchoAR(apiKey: "billowing-moon-5827");

    String path = await widget.echoAR.getModelFromEntryId("Cat.glb");

    setState(() {
      _modelHologramPath = path;

      _counter++;
    });
  }

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
