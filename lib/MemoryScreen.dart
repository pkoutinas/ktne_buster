import 'package:flutter/material.dart';

import 'Configurator.dart';
import 'helper.dart';

class MemoryScreen extends StatefulWidget {
  final Configurator config;

  MemoryScreen({Key key, @required this.config}) : super(key: key);
  @override
  _MemoryScreenState createState() => new _MemoryScreenState();
}

class _MemoryScreenState extends State<MemoryScreen> {

  void _resetProgress(){
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16.0))),
          child: Icon(
            Icons.autorenew,
            size: 50,
          ),
          onPressed: () {
            _resetProgress();
          },
        ),
        appBar: AppBar(
          title:Text("Memory"),
          backgroundColor: Colors.red,
        ),
        body:
        Column(
            children: <Widget>[

            ])
    );
  }
}

