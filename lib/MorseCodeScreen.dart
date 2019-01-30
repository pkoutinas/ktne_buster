import 'package:flutter/material.dart';

import 'Configurator.dart';
import 'helper.dart';

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
  List<bool> _tapGroup1 = new List();
  List<bool> _tapGroup2 = new List();
  List<bool> _tapGroup3 = new List();
  List<bool> _tapGroup4 = new List();
  List<String> _optGroup1 = new List();
  List<String> _optGroup2 = new List();
  List<String> _optGroup3 = new List();
  List<String> _optGroup4 = new List();

  void _storeTaps(bool _tap){
    (_tap)?debugPrint("short"):debugPrint("long");
    _tapCounter += 1;
    (_tapCounter>=4)?_tapGroup4.add(_tap):{};
    (_tapCounter>=3)?_tapGroup3.add(_tap):{};
    (_tapCounter>=2)?_tapGroup2.add(_tap):{};
    (_tapCounter>=1)?_tapGroup1.add(_tap):{};
    _processTaps();
  }

  void _processTaps(){
    List<bool> len1, len2, len3, len4;

    setState(() {
      if(_tapCounter>=4){       //At least 4 taps in each group
        len1 = [_tapGroup1[_tapCounter-1]];
        len2 = [_tapGroup1[_tapCounter-2],_tapGroup1[_tapCounter-1]];
        len3 = [_tapGroup1[_tapCounter-3],_tapGroup1[_tapCounter-2],_tapGroup1[_tapCounter-1]];
        len4 = [_tapGroup1[_tapCounter-4],_tapGroup1[_tapCounter-3],_tapGroup1[_tapCounter-2],_tapGroup1[_tapCounter-1]];
      }
    });
  }

  void _resetProgress(){
    setState(() {
      _tapCounter = 0;
      _tapGroup1 = new List();
      _tapGroup2 = new List();
      _tapGroup3 = new List();
      _tapGroup4 = new List();
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
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                GestureDetector(
                  onTap: (){_storeTaps(true);},
                  onLongPress: (){_storeTaps(false);},
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
                              CircleAvatar(backgroundColor: Colors.red,radius: 120,)
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
              ]),
        ],
      ),
    );
  }
}
