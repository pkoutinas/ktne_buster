import 'package:flutter/material.dart';

import 'Configurator.dart';
import 'package:ktne/uiElements/helper.dart';

class WhosFirstScreen extends StatefulWidget {
  final Configurator config;
  final Map<String,Map<int,int>> headLabel = {
    "YES":{0:1},"FIRST":{1:0}, "DISPLAY":{1:2},"OKAY":{1:0},"SAYS":{1:2},
    "NOTHING":{0:1},"":{0:2},"BLANK":{1:1},"NO":{1:2},"LED":{0:1},"LEAD":{1:2},
    "READ":{1:1},"RED":{1:1},"REED":{0:2},"LEED":{0:2},"HOLD ON":{1:2},
    "YOU":{1:1},"YOU ARE":{1:2},"YOUR":{1:1},"YOU'RE":{1:1},"UR":{0:0},
    "THERE":{1:2},"THEY'RE":{0:2},"THEIR":{1:1},"THEY ARE":{0:1},"SEE":{1:2},
    "C":{1:0},"CEE":{1:2}};

  WhosFirstScreen({Key key, @required this.config}) : super(key: key);
  @override
  _WhosFirstScreenState createState() => new _WhosFirstScreenState();
}

class _WhosFirstScreenState extends State<WhosFirstScreen> {
  String _display = "Select";
  String _answer = "";

  void _resetProgress(){
    setState(() {
      _display = "Select";
      _answer = "";
    });
  }

  void _showAnswer(String inputLabel){
    setState(() {
      _answer = inputLabel;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          //RaisedButton(
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
        title:Text("Who's First"),
    backgroundColor: Colors.red,
    ),
    body:
        Column(
          children: <Widget>[
        Container(
          alignment: Alignment(0, -1),
            padding: EdgeInsets.only(top: 40),
            child:
        SizedBox(width: 250,height: 277.6, child:
            Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.white)),
            child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                      child:
                  Container(
                      padding: EdgeInsets.only(top: 10,bottom: 5),
                      alignment: Alignment(0, -1),
                      color: Colors.white,
                      child:
              DropdownButton(
                items: widget.headLabel.keys.toList().map((String ddValue) {
                  return new DropdownMenuItem<String>(
                    value: ddValue,
                    child: new Text(ddValue, style: TextStyle(color: Colors.white)),
                  );
                }).toList(),
                hint: Text(_display, style: TextStyle(color: Colors.black, fontSize: 30)),
                onChanged: (String newLabel){
                  setState(() {
                    _display = newLabel;
                  });
                },
              )))
            ]),
            (_display!="Select")
            ? FirstWidget(x: widget.headLabel[_display].keys.toList().elementAt(0),
                        y: widget.headLabel[_display].values.toList().elementAt(0),
                        answer: _showAnswer)
            :Container(),
          ])
    ))),
    Container(
    alignment: Alignment(0, -1),
    padding: EdgeInsets.only(top: 20),
    child:
    Text("Tap the tile: "+_answer)
    )
          ])
    );
  }
}

