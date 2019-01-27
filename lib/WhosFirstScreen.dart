import 'package:flutter/material.dart';

import 'Configurator.dart';
import 'helper.dart';

class WhosFirstScreen extends StatefulWidget {
  final Configurator config;

  WhosFirstScreen({Key key, @required this.config}) : super(key: key);
  @override
  _WhosFirstScreenState createState() => new _WhosFirstScreenState();
}

class _WhosFirstScreenState extends State<WhosFirstScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title:Text("Who's on First"),
          backgroundColor: Colors.red,
        ),
        body: Text("HI")
    );
  }
}

