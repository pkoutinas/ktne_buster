import 'package:flutter/material.dart';

import 'Configurator.dart';
import 'helper.dart';

class SimonScreen extends StatefulWidget {
  final Configurator config;
  SimonScreen({Key key, @required this.config}) : super(key: key);
  @override
  _SimonScreenState createState() => new _SimonScreenState();
}

class _SimonScreenState extends State<SimonScreen> {

  void _setStrikes(int newStrikes){
    setState(() {
      widget.config.strikes = newStrikes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body:
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
            Text("Current Strikes: "+widget.config.strikes.toString()),
            StrikerWidget(defaultValue: widget.config.strikes, onChanged: _setStrikes),
          ],)
    );
  }
}
