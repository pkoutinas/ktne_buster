import 'package:flutter/material.dart';

import 'Configurator.dart';
import 'package:ktne/uiElements/helper.dart';

class SimonScreen extends StatefulWidget {
  final Configurator config;

  SimonScreen({Key key, @required this.config}) : super(key: key);
  @override
  _SimonScreenState createState() => new _SimonScreenState();
}

class _SimonScreenState extends State<SimonScreen> {
  List<Color> flashSequence = new List();
  List<Color> tapSequence = new List();

  void _setStrikes(int newStrikes){
    setState(() {
      widget.config.strikes = newStrikes;
    });
  }

  void _setSerial(String newValue){
    setState(() {
      widget.config.serial = newValue;
    });
  }

  void _resetProgress(){
    setState(() {
      flashSequence.clear();
      tapSequence.clear();
    });
  }

  void _addColour(Color newColour){
    setState(() {
      flashSequence.add(newColour);
      tapSequence.add(_lookupTapColour(newColour));
    });
  }

  Color _lookupTapColour(Color newColour) {
    if (widget.config.hasVowel()) {
      if (widget.config.strikes == 0) {
        if (newColour.value == Colors.red.value) {
          return Colors.blue;
        } else if (newColour.value == Colors.blue.value) {
          return Colors.red;
        }
        if (newColour.value == Colors.green.value) {
          return Colors.yellow;
        }
        if (newColour.value == Colors.yellow.value) {
          return Colors.green;
        }
      } else if (widget.config.strikes == 1) {
        if (newColour.value == Colors.red.value) {
          return Colors.yellow;
        } else if (newColour.value == Colors.blue.value) {
          return Colors.green;
        }
        if (newColour.value == Colors.green.value) {
          return Colors.blue;
        }
        if (newColour.value == Colors.yellow.value) {
          return Colors.red;
        }
      } else if (widget.config.strikes == 2) {
        if (newColour.value == Colors.red.value) {
          return Colors.green;
        } else if (newColour.value == Colors.blue.value) {
          return Colors.red;
        }
        if (newColour.value == Colors.green.value) {
          return Colors.yellow;
        }
        if (newColour.value == Colors.yellow.value) {
          return Colors.blue;
        }
      }
    } else { // No vowels in serial number
        if (widget.config.strikes == 0) {
          if (newColour.value == Colors.red.value) {
            return Colors.blue;
          } else if (newColour.value == Colors.blue.value) {
            return Colors.yellow;
          }
          if (newColour.value == Colors.green.value) {
            return Colors.green;
          }
          if (newColour.value == Colors.yellow.value) {
            return Colors.red;
          }
        } else if (widget.config.strikes == 1) {
          if (newColour.value == Colors.red.value) {
            return Colors.red;
          } else if (newColour.value == Colors.blue.value) {
            return Colors.blue;
          }
          if (newColour.value == Colors.green.value) {
            return Colors.yellow;
          }
          if (newColour.value == Colors.yellow.value) {
            return Colors.green;
          }
        } else if (widget.config.strikes == 2) {
          if (newColour.value == Colors.red.value) {
            return Colors.yellow;
          } else if (newColour.value == Colors.blue.value) {
            return Colors.green;
          }
          if (newColour.value == Colors.green.value) {
            return Colors.blue;
          }
          if (newColour.value == Colors.yellow.value) {
            return Colors.red;
          }
        }
        return null;
      }

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
          title:Text("Simon Says"),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
      body:
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                Container(
                  padding:EdgeInsets.only(left:10, right: 10, top:5, bottom: 10),
                  child:
                  StrikerWidget(defaultValue: widget.config.strikes, onChanged: _setStrikes),
                ),
                Container(padding: EdgeInsets.only(right: 20), child:
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                          return AlertDialog(
                            actions: <Widget>[
                              // usually buttons at the bottom of the dialog
                              new FlatButton(
                                child: new Text("Close", style: TextStyle(color: Colors.black),),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          content: SerialWidget(defaultValue: "Enter Value", onChanged: _setSerial, defaultColour: Colors.black)
                          );
                    },);},
                  child: Row(children:[
                Text("Serial number set:  "),
                Icon((widget.config.serial!=""?Icons.check_circle_outline:Icons.error_outline),
                  color: (widget.config.serial!=""?Colors.white:Colors.red),
                  size: 40,)
                ]),)),
              ],),
              Row(
                children: <Widget>[
                  SizedBox(width: 100, child:
                    Container(margin: EdgeInsets.only(left: 10, ) ,child:
                      Text("Tap on last flashing colour",softWrap: true,),
                  ),),
                  Container(
                      margin: EdgeInsets.all(50),
                      child:
                          RotationTransition(
                              turns: new AlwaysStoppedAnimation(45 / 360),
                              child:
                          //Transform.rotate(angle: 0.5 , child:
                      Column(children: <Widget>[
                        Row(children: <Widget>[
                          Container(
                            child:
                            SizedBox(width: 80, height: 80,child:
                                GestureDetector(
                                    onTap: (){widget.config.serial!=""? _addColour(Colors.blue):{};},
                                    child:
                            DecoratedBox(decoration: ShapeDecoration(shape: Border.all(), color: Colors.blue))),
                          )),
                          Container(
                            child:
                            SizedBox(width: 80, height: 80,child:
                            GestureDetector(
                                onTap: (){widget.config.serial!=""? _addColour(Colors.yellow):{};},
                                child:
                            DecoratedBox(decoration: ShapeDecoration(shape: Border.all(), color: Colors.yellow))),
                            )),
                        ],),
                        Row(children: <Widget>[
                          Container(
                            child:
                            SizedBox(width: 80, height: 80,child:
                            GestureDetector(
                                onTap: (){widget.config.serial!=""? _addColour(Colors.red):{};},
                                child:
                            DecoratedBox(decoration: ShapeDecoration(shape: Border.all(), color: Colors.red))),
                            )),
                          Container(
                            child:
                            SizedBox(width: 80, height: 80,child:
                            GestureDetector(
                                onTap: (){widget.config.serial!=""? _addColour(Colors.green):{};},
                                child:
                            DecoratedBox(decoration: ShapeDecoration(shape: Border.all(), color: Colors.green))),
                            )),
                        ],),
                    ],)
                  )),
                ]),
              Container(margin: EdgeInsets.only(top:15,bottom: 10), child:
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                 SizedBox(width: 100, child:
                  Container(width: 50, padding: EdgeInsets.only(left: 10), child:
                    Text("Flashing sequence: ", softWrap: true,),
                  ),),
                new SequenceWidget(sequence: flashSequence)
                ]),
              ),
              Container(margin: EdgeInsets.only(top:15,bottom: 10), child:
              Row(
                children: <Widget>[
                  SizedBox(width: 100, child:
                    Container(width: 50, padding: EdgeInsets.only(left: 10) ,child:
                      Text("Tap the following: ", softWrap: true,),
                  ),),
                  SequenceWidget(sequence: tapSequence)
                ]),
              ),

          ],)
    );
  }
}
