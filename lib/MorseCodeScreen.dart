import 'package:flutter/material.dart';

import 'Configurator.dart';

class MorseCodeScreen extends StatefulWidget {
  final Configurator config;
  MorseCodeScreen({Key key, @required this.config}) : super(key: key);
  @override
  _MorseCodeScreenState createState() => new _MorseCodeScreenState();
}

class _MorseCodeScreenState extends State<MorseCodeScreen> {

  Map <String,String> _solutions = {"shell":"3.505 MHz","halls":"3.515 MHz",
        "slick":"3.522 MHz","trick":"3.532 MHz","boxes":"3.535 MHz",
        "leaks":"3.542 MHz","strobe":"3.545 MHz","bistro":"3.552 MHz",
        "flick":"3.555 MHz","bombs":"3.565 MHz","break":"3.572 MHz",
        "brick":"3.575 MHz","steak":"3.582 MHz","sting":"3.592 MHz",
        "vector":"3.595 MHz","beats":"3.600 MHz"};
  Map<List<bool>,String> _alphabet = {[true,false]:"a", [false,true,true]:"b",
        [false,true,false,true]:"c", [true]:"e", [true,true,false,true]:"f",
        [true,true,true,true]:"h", [true,true]:"i", [false,true,false]:"k",
        [true,false,true,true]:"l", [false,false]:"m", [false,true]:"n",
        [false,false,false]: "o", [true,false,true]:"r", [true,true,true]:"s",
        [false]:"t", [true,true,true,false]:"v", [false,true,true,false]:"x" };
  int _tapCounter = 0;
  List<bool> _tapList = new List();
  Set<String> _possible = new Set();
  String _frequency = "0.000 MHz";
  String _likelyAnswer = "";
  String _certainty = "";
  List<String> _displayTaps = new List();

  void _storeTaps(bool _tap){
    //(_tap)?debugPrint("short"):debugPrint("long");
    _tapList.add(_tap);
    if(_displayTaps.length<10) {
      _displayTaps.add((_tap) ? ". " : "_ ");
    } else {
      _displayTaps.removeAt(0);
      _displayTaps.add((_tap) ? ". " : "_ ");
    }
    _processTaps();
    _tapCounter += 1;
  }

  void _processTaps(){
    List<String> _options = new List();
    String _temp;

    setState(() {
      for (int i=1;i<=4;i++){
        if(_tapList.length>=i) {
          _temp = _letterFound(_tapList.getRange(_tapCounter+1-i, _tapCounter+1).toList());
          if(_temp!=""){
            _options.add(_temp);
          }
        }
      }
      if(_tapCounter<4&&_temp.length==1){
        _possible.add(_temp);
      }
      //debugPrint("Options: "+_options.toString());

      if(_tapCounter>=4) {
        for (int i = 0; i < _options.length; i++) {
          for (int j = 0; j < _possible.length; j++) {
            _temp = _possible.elementAt(j) + _options[i];
            (_sequenceFound(_temp))
                ? _possible.add(_temp)
                : {};
          }
        }
      }
      //debugPrint("Possible: "+_possible.toString());
    });
  }

  String _letterFound(List<bool> _input){
    String _answer="";

    for (int i=0; i<_alphabet.length;i++){
      (_alphabet.keys.elementAt(i).toString()==_input.toString())
          ? _answer = _alphabet.values.elementAt(i)
          : {};
    }
    return _answer;
  }

  bool _sequenceFound(String _input){
    int _foundCount=0;
    int _foundIndex=-1;

    for (int i=0; i<_solutions.length;i++){
      if(_solutions.keys.elementAt(i).contains(_input)){
        _foundCount += 1;
        _foundIndex =i;
      }
    }
    if (_input.length>=3 && _foundCount==1){
      _certainty = (100*_input.length/_solutions.keys.elementAt(_foundIndex).length).toStringAsFixed(0);
      _likelyAnswer = _solutions.keys.elementAt(_foundIndex) + " ("
          +_certainty+"% certainty)";
      _frequency = _solutions.values.elementAt(_foundIndex);
    }
    return (_foundCount>0)?true:false;
  }

  void _resetProgress(){
    setState(() {
      _tapCounter = 0;
      _certainty = "";
      _frequency = "0.000 MHz";
      _likelyAnswer = "";
      _tapList = new List();
      _possible = new Set();
      _displayTaps = new List();
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
        title:Text("Morse Code"),
        backgroundColor: Colors.red,
      ),
      body: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                    alignment: Alignment(0, -1),
                    padding: EdgeInsets.only(top: 50, bottom: 50),
                    child:
                    Text(_frequency, style: TextStyle(fontSize: 40),)
                ),
                GestureDetector(
                  onTap: (){(_certainty!="100")?_storeTaps(true):{};},
                  onLongPress: (){(_certainty!="100")?_storeTaps(false):{};},
                  child:
                  Container(
                    margin: EdgeInsets.all(0),
                    height: 250,
                    width: 250,
                    child:
                    Stack(
                        alignment: Alignment(0, 0),
                        children: <Widget>[
                          Positioned(
                              top: 0,
                              child:
                              CircleAvatar(backgroundColor: (_certainty!="100")?Colors.red:Colors.grey,radius: 120,)
                          ),
                          Container(
                              margin: EdgeInsets.only(left:0, top:0),
                              child:
                              Text("Tap Me", style: TextStyle(fontSize: 40,
                                  color: Colors.black),
                              )
                          ),
                        ]),
                  )
                ),
                Container(
                    alignment: Alignment(0, -1),
                    padding: EdgeInsets.only(top: 10),
                    child:
                    Text(_displayTaps.toString().replaceAll(RegExp(r'\[|\,|\]'),"") )
                ),
                Container(
                    alignment: Alignment(0, -1),
                    padding: EdgeInsets.only(top: 50, bottom: 50),
                    child:
                    Text(_likelyAnswer)
                ),
              ]),
        ],
      ),
    );
  }
}
