import 'package:flutter/material.dart';

import 'Configurator.dart';

class MemoryScreen extends StatefulWidget {
  final Configurator config;

  MemoryScreen({Key key, @required this.config}) : super(key: key);
  @override
  _MemoryScreenState createState() => new _MemoryScreenState();
}

class _MemoryScreenState extends State<MemoryScreen> {
  Map<int,List<int>> memoryMap;
  int _currentStep = 0;

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

  void _resetProgress(){
    setState(() {
      _currentStep=0;
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
                              (this._currentStep!=this._mySteps().length-1)
                                  ?FlatButton(
                                      onPressed: onStepContinue,
                                      color: Colors.red,
                                      child: const Text('Next'))
                                  : FlatButton(
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
                                  Container(
                                    width: 246,
                                    height: 130,
                                    alignment: Alignment(0, 0),
                                    decoration: BoxDecoration(color: Colors.black),
                                    child: Text("HI"),
                                  )),
                            ]),
                        Row( //TODO: why is spacing between tiles lost since it moved to stack?
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                width: 60,
                                alignment: Alignment(0, 0),
                                decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                                padding: EdgeInsets.only(top:20,left:2,right: 2, bottom: 30),
                                child: Text("HI", style: TextStyle(color: Colors.black),),
                              ),
                              Container(
                                width: 60,
                                alignment: Alignment(0, 0),
                                decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                                padding: EdgeInsets.only(top:20,left:2,right: 2, bottom: 30),
                                child: Text("HI", style: TextStyle(color: Colors.black),),
                              ),
                              Container(
                                width: 60,
                                alignment: Alignment(0, 0),
                                decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                                padding: EdgeInsets.only(top:20,left:2,right: 2, bottom: 30),
                                child: Text("HI", style: TextStyle(color: Colors.black),),
                              ),
                              Container(
                                width: 60,
                                alignment: Alignment(0, 0),
                                decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                                padding: EdgeInsets.only(top:20,left:2,right: 2, bottom: 30),
                                child: Text("HI", style: TextStyle(color: Colors.black),),
                              ),
                            ]),
                      ]),
                ),
              ),
        ])
    ));
  }
}

