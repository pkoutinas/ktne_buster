import 'package:flutter/material.dart';

import 'Configurator.dart';
import 'helper.dart';

class WhosFirstScreen extends StatefulWidget {
  final Configurator config;
  final Map<String,Map<int,int>> headLabel = {
    "YES":{0:1},"FIRST":{1:0}, "DISPLAY":{1:2},"OKAY":{1:0},"SAYS":{1:2},
    "NOTHING":{0:1},"":{0:2},"BLANK":{1:1},"NO":{1:2},"LED":{0:1},"LEAD":{1:2},
    "READ":{1:1},"RED":{1:1},"REED":{0:2},"LEED":{0:2},"HOLD ON":{1:2},
    "YOU":{1:1},"YOU ARE":{1:2},"YOUR":{1:1},"YOU'RE":{1:1},"UR":{0:0},
    "THERE":{1:2},"THEY'RE":{0:2},"THEIR":{1:1},"THEY ARE":{0:1},"SEE":{1:2},
    "C":{1:0},"CEE":{1:2}};
  final Map<String,List<String>> tableMap ={
    "READY":["YES","OKAY","WHAT","MIDDLE","LEFT","PRESS","RIGHT","BLANK","READY","NO","FIRST","UHHH","NOTHING","WAIT"],
    "FIRST":["LEFT","OKAY","YES","MIDDLE","NO","RIGHT","NOTHING","UHHH","WAIT","READY","BLANK","WHAT","PRESS","FIRST"],
    "NO":["BLANK","UHHH","WAIT","FIRST","WHAT","READY","RIGHT","YES","NOTHING","LEFT","PRESS","OKAY","NO","MIDDLE"],
    "BLANK":["WAIT","RIGHT","OKAY","MIDDLE","BLANK","PRESS","READY","NOTHING","NO","WHAT","LEFT","UHHH","YES","FIRST"],
    "NOTHING":["UHHH","RIGHT","OKAY","MIDDLE","YES","BLANK","NO","PRESS","LEFT","WHAT","WAIT","FIRST","NOTHING","READY"],
    "YES":["OKAY","RIGHT","UHHH","MIDDLE","FIRST","WHAT","PRESS","READY","NOTHING","YES","LEFT","BLANK","NO","WAIT"],
    "WHAT":["UHHH","WHAT","LEFT","NOTHING","READY","BLANK","MIDDLE","NO","OKAY","FIRST","WAIT","YES","PRESS","RIGHT"],
    "UHHH":["READY","NOTHING","LEFT","WHAT","OKAY","YES","RIGHT","NO","PRESS","BLANK","UHHH","MIDDLE","WAIT","FIRST"],
    "LEFT":["RIGHT","LEFT","FIRST","NO","MIDDLE","YES","BLANK","WHAT","UHHH","WAIT","PRESS","READY","OKAY","NOTHING"],
    "RIGHT":["YES","NOTHING","READY","PRESS","NO","WAIT","WHAT","RIGHT","MIDDLE","LEFT","UHHH","BLANK","OKAY","FIRST"],
    "MIDDLE":["BLANK","READY","OKAY","WHAT","NOTHING","PRESS","NO","WAIT","LEFT","MIDDLE","RIGHT","FIRST","UHHH","YES"],
    "OKAY":["MIDDLE","NO","FIRST","YES","UHHH","NOTHING","WAIT","OKAY","LEFT","READY","BLANK","PRESS","WHAT","RIGHT"],
    "WAIT":["UHHH","NO","BLANK","OKAY","YES","LEFT","FIRST","PRESS","WHAT","WAIT","NOTHING","READY","RIGHT","MIDDLE"],
    "PRESS":["RIGHT","MIDDLE","YES","READY","PRESS","OKAY","NOTHING","UHHH","BLANK","LEFT","FIRST","WHAT","NO","WAIT"],
    "YOU":["SURE","YOU ARE","YOUR","YOU'RE","NEXT","UH HUH","UR","HOLD","WHAT?","YOU","UH UH","LIKE","DONE","U"],
    "YOU ARE":["YOUR","NEXT","LIKE","UH HUH","WHAT?","DONE","UH UH","HOLD","YOU","U","YOU'RE","SURE","UR","YOU ARE"],
    "YOUR":["UH UH","YOU ARE","UH HUH","YOUR","NEXT","UR","SURE","U","YOU'RE","YOU","WHAT?","HOLD","LIKE","DONE"],
    "YOU'RE":["YOU","YOU'RE","UR","NEXT","UH UH","YOU ARE","U","YOUR","WHAT?","UH HUH","SURE","DONE","LIKE","HOLD"],
    "UR":["DONE","U","UR","UH HUH","WHAT?","SURE","YOUR","HOLD","YOU'RE","LIKE","NEXT","UH UH","YOU ARE","YOU"],
    "U":["UH HUH","SURE","NEXT","WHAT?","YOU'RE","UR","UH UH","DONE","U","YOU","LIKE","HOLD","YOU ARE","YOUR"],
    "UH HUH":["UH HUH","YOUR","YOU ARE","YOU","DONE","HOLD","UH UH","NEXT","SURE","LIKE","YOU'RE","UR","U","WHAT?"],
    "UH UH":["UR","U","YOU ARE","YOU'RE","NEXT","UH UH","DONE","YOU","UH HUH","LIKE","YOUR","SURE","HOLD","WHAT?"],
    "WHAT?":["YOU","HOLD","YOU'RE","YOUR","U","DONE","UH UH","LIKE","YOU ARE","UH HUH","UR","NEXT","WHAT?","SURE"],
    "DONE":["SURE","UH HUH","NEXT","WHAT?","YOUR","UR","YOU'RE","HOLD","LIKE","YOU","U","YOU ARE","UH UH","DONE"],
    "NEXT":["WHAT?","UH HUH","UH UH","YOUR","HOLD","SURE","NEXT","LIKE","DONE","YOU ARE","UR","YOU'RE","U","YOU"],
    "HOLD":["YOU ARE","U","DONE","UH UH","YOU","UR","SURE","WHAT?","YOU'RE","NEXT","HOLD","UH HUH","YOUR","LIKE"],
    "SURE":["YOU ARE","DONE","LIKE","YOU'RE","YOU","HOLD","UH HUH","UR","SURE","U","WHAT?","NEXT","YOUR","UH UH"],
    "LIKE":["YOU'RE","NEXT","U","UR","HOLD","DONE","UH UH","WHAT?","UH HUH","YOU","LIKE","SURE","YOU ARE","YOUR"]
};

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

  void _findAnswer(String inputLabel){
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
                items: widget.headLabel.keys.map((String ddValue) {
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
            FirstWidget(x: widget.headLabel[_display].keys.elementAt(0),
                        y: widget.headLabel[_display].values.elementAt(0),
                        labels: widget.tableMap.keys.toList(),
                        pickedLabel: _findAnswer),
          ])
    ))),
            Text("Answer: "+_answer)
          ])
    );
  }
}

