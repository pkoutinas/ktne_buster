import 'package:flutter/material.dart';

import 'Configurator.dart';
import 'package:ktne/uiElements/helper.dart';

class MemoryScreen extends StatefulWidget {
  final Configurator config;

  MemoryScreen({Key key, @required this.config}) : super(key: key);
  @override
  _MemoryScreenState createState() => new _MemoryScreenState();
}

class _MemoryScreenState extends State<MemoryScreen> {
  int _currentStep = 0;
  String _display = "_";  // Current display
  List<String> _labels = ["_","_","_","_"]; // Current labels
  List<Map<int, String>> _taps = new List(5); // List (one position per step) of Position/Value tapped

  List<Step> _mySteps(){
    List<Step> _steps = [
      Step(
        title: Text(""),
        content: Container(height: 220,child:Text("")),
        isActive: _currentStep>=0,
      ),
      Step(
        title: Text(""),
        content: Container(height: 220,child:Text("")),
        isActive: _currentStep>=1,
      ),
      Step(
        title: Text(""),
        content: Container(height: 220,child:Text("")),
        isActive: _currentStep>=2,
      ),
      Step(
        title: Text(""),
        content: Container(height: 220,child:Text("")),
        isActive: _currentStep>=3,
      ),
      Step(
        title: Text(""),
        content: Container(height: 220,child:Text("")),
        isActive: _currentStep>=4,
      )
    ];
    return _steps;
  }

  void _setDisplay(String input){
    setState(() {
      Navigator.of(context).pop();
      _display = input;
      (_display!="_"&&_labels.indexOf("_")==-1)
         ?_taps[_currentStep] = _getSolution()
         :{};
    });
  }

  void _setLabel(int index, String input){
    setState(() {
      Navigator.of(context).pop();
      _labels[index] = input;
      (_display!="_"&&_labels.indexOf("_")==-1)
          ?_taps[_currentStep] = _getSolution()
          :{};
    });
  }

  void _resetProgress(){
    setState(() {
      _currentStep=0;
      _display = "_";
      _labels = ["_","_","_","_"];
      _taps = new List(5);
    });
  }

  Map<int, String> _getSolution(){
    if(_currentStep==0){
      if(_display=="1"){
        return { 1:_labels[1]};
      } else if(_display=="2"){
        return { 1:_labels[1]};
      } else if(_display=="3"){
        return { 2:_labels[2]};
      } else if(_display=="4"){
        return { 3:_labels[3]};
      }
    } else if(_currentStep==1){
      if(_display=="1"){
        return { _labels.indexOf("4"):_labels[_labels.indexOf("4")]};
      } else if(_display=="2"){
        return { _taps[0].keys.toList()[0]:_labels[_taps[0].keys.toList()[0]]};
      } else if(_display=="3"){
        return { 0:_labels[0]};
      } else if(_display=="4"){
        return { _taps[0].keys.toList()[0]:_labels[3]};
      }
    } else if(_currentStep==2){
      if(_display=="1"){
        return {_labels.indexOf(_taps[1].values.toList()[0]):_labels[_labels.indexOf(_taps[1].values.toList()[0])]};
      } else if(_display=="2"){
        return {_labels.indexOf(_taps[0].values.toList()[0]):_labels[_labels.indexOf(_taps[0].values.toList()[0])]};
      } else if(_display=="3"){
        return {2:_labels[2]};
      } else if(_display=="4"){
        return { _labels.indexOf("4"):_labels[_labels.indexOf("4")]};
      }
    } else if(_currentStep==3){
      if(_display=="1"){
        return { _taps[0].keys.toList()[0]:_labels[_taps[0].keys.toList()[0]]};
      } else if(_display=="2"){
        return { 0:_labels[0]};
      } else if(_display=="3"){
        return { _taps[1].keys.toList()[0]:_labels[_taps[1].keys.toList()[0]]};
      } else if(_display=="4"){
        return { _taps[1].keys.toList()[0]:_labels[_taps[1].keys.toList()[0]]};
      }
    }else if(_currentStep==4){
      if(_display=="1"){
        return {_labels.indexOf(_taps[0].values.toList()[0]):_labels[_labels.indexOf(_taps[0].values.toList()[0])]};
      } else if(_display=="2"){
        return {_labels.indexOf(_taps[1].values.toList()[0]):_labels[_labels.indexOf(_taps[1].values.toList()[0])]};
      } else if(_display=="3"){
        return {_labels.indexOf(_taps[2].values.toList()[0]):_labels[_labels.indexOf(_taps[2].values.toList()[0])]};
      } else if(_display=="4"){
        return {_labels.indexOf(_taps[3].values.toList()[0]):_labels[_labels.indexOf(_taps[3].values.toList()[0])]};
      }
    }
    return {-1:"EXCEPTION"};
  }

  void _nextStep(){
    setState(() {
    //  debugPrint("Current step: "+(_currentStep+1).toString());
    //  debugPrint("Tile #"+(_taps[_currentStep].keys.toList()[0]+1).toString()+" was tapped...");
    //  debugPrint("and it contained: "+_taps[_currentStep].values.toList()[0]);
      _currentStep+=1;
      _display = "_";
      _labels = ["_","_","_","_"];
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
            Container(
              padding: EdgeInsets.all(40),
              child:
            Stack(children: <Widget>[
              Container(
                decoration: BoxDecoration(border: Border.all(color: Colors.white)),
                width: 300,
                height: 380,
                child:
                    Container(
                        decoration: BoxDecoration(color: Colors.white),
                        child:
                    Stepper(
                      type: StepperType.horizontal,
                      currentStep: this._currentStep,
                      controlsBuilder:
                          (BuildContext context, {
                            VoidCallback onStepContinue,
                            VoidCallback onStepCancel}) {
                        return Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              (_display=="_"||_labels.indexOf("_")!=-1)
                                  ? Container(
                                      padding: EdgeInsets.only(top:18),
                                      child: const Text('Check Input', style: TextStyle(color: Colors.red)))
                                  :(this._currentStep!=this._mySteps().length-1)
                                    ?FlatButton(
                                      onPressed: _nextStep,
                                      color: Colors.red,
                                      child: const Text('Next'))
                                    :FlatButton(
                                      onPressed: _resetProgress,
                                      color: Colors.white,
                                      child: const Text("Done",
                                      style: TextStyle(color: Colors.black)))
                            ],
                          );
                        },
                      steps: _mySteps(),
                      onStepTapped: (step){},
                      onStepCancel: (){},
                      onStepContinue: (){
                        setState(() {
                          if(this._currentStep < this._mySteps().length-1){
                            this._currentStep += 1;
                          }
                        });},
                  ))
              ),
              Positioned(
                left: 15,
                top: 100,
                child: Container(
                  child:
                  Column(
                      children: <Widget>[
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                  margin: EdgeInsets.only(bottom:2, left:2, right:2),
                                  child:
                                    Container(width: 246, height: 130,
                                        alignment: Alignment(0, 0),
                                        padding: EdgeInsets.only(top:15),
                                        decoration: BoxDecoration(color: Colors.black),
                                        child: GestureDetector(
                                          onTap: () {
                                            showDialog(
                                                context: context,
                                                builder: (BuildContext context) {
                                                  return AlertDialog(
                                                    content:
                                                    Column(
                                                        mainAxisSize: MainAxisSize.min,
                                                        children: <Widget>[
                                                          new SelectorWidget(selectedItem: _setDisplay,)]),
                                                  );
                                                });
                                          },
                                          child: Text(_display,style: TextStyle(fontSize: 80),),
                                        ))),
                        ]),
                        Row( //TODO: why is spacing between tiles lost since it moved to stack?
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  showDialog(
                                      context: context, builder: (BuildContext context) {
                                    return AlertDialog(
                                      content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            new SelectorWidget(selectedItem:
                                                (input){_setLabel(0,input);},
                                            )
                                          ]),
                                    );
                                  });
                                },
                                child: Container(
                                  width: 60,
                                  alignment: Alignment(0, 0),
                                  decoration: BoxDecoration(
                                      color:(_taps[_currentStep]!=null
                                          && _taps[_currentStep].keys.toList()[0]==0)?( Colors.red):Colors.white,
                                      border: Border.all(color: Colors.black)),
                                  padding: EdgeInsets.only(top:20,left:2,right: 2, bottom: 30),
                                  child: Text(_labels[0],
                                      style: TextStyle(color: Colors.black, fontSize: 20))
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  showDialog(
                                      context: context, builder: (BuildContext context) {
                                    return AlertDialog(
                                      content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            new SelectorWidget(selectedItem:
                                                (input){_setLabel(1,input);},
                                            )
                                          ]),
                                    );
                                  });
                                },
                                child: Container(
                                    width: 60,
                                    alignment: Alignment(0, 0),
                                    decoration: BoxDecoration(
                                        color:(_taps[_currentStep]!=null
                                            && _taps[_currentStep].keys.toList()[0]==1)?( Colors.red):Colors.white,
                                        border: Border.all(color: Colors.black)),
                                    padding: EdgeInsets.only(top:20,left:2,right: 2, bottom: 30),
                                    child: Text(_labels[1],
                                        style: TextStyle(color: Colors.black, fontSize: 20))
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  showDialog(
                                      context: context, builder: (BuildContext context) {
                                    return AlertDialog(
                                      content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            new SelectorWidget(selectedItem:
                                                (input){_setLabel(2,input);},
                                            )
                                          ]),
                                    );
                                  });
                                },
                                child: Container(
                                    width: 60,
                                    alignment: Alignment(0, 0),
                                    decoration: BoxDecoration(
                                        color:(_taps[_currentStep]!=null
                                            && _taps[_currentStep].keys.toList()[0]==2)?( Colors.red):Colors.white,
                                        border: Border.all(color: Colors.black)),
                                    padding: EdgeInsets.only(top:20,left:2,right: 2, bottom: 30),
                                    child: Text(_labels[2],
                                        style: TextStyle(color: Colors.black, fontSize: 20))
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  showDialog(
                                      context: context, builder: (BuildContext context) {
                                    return AlertDialog(
                                      content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            new SelectorWidget(selectedItem:
                                                (input){_setLabel(3,input);},
                                            )
                                          ]),
                                    );
                                  });
                                },
                                child: Container(
                                    width: 60,
                                    alignment: Alignment(0, 0),
                                    decoration: BoxDecoration(
                                        color:(_taps[_currentStep]!=null
                                            && _taps[_currentStep].keys.toList()[0]==3)?( Colors.red):Colors.white,
                                        border: Border.all(color: Colors.black)),
                                    padding: EdgeInsets.only(top:20,left:2,right: 2, bottom: 30),
                                    child: Text(_labels[3],
                                        style: TextStyle(color: Colors.black, fontSize: 20))
                                ),
                              )
                            ]),
                      ]),
                ),
              ),
        ])
    ));
  }
}

