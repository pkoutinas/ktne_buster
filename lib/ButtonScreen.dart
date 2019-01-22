import 'package:flutter/material.dart';

import 'Configurator.dart';
import 'helper.dart';

class ButtonScreen extends StatefulWidget {
  final Configurator config;

  ButtonScreen({Key key, @required this.config}) : super(key: key);
  @override
  _ButtonScreenState createState() => new _ButtonScreenState();
}

class _ButtonScreenState extends State<ButtonScreen> {
  MaterialColor _colour;
  String _label;
  int stepCounter = 0;

  void _setColour(MaterialColor colour) => setState(() {
      _colour = colour;
  });

  void _setLabel(String label)  => setState(() {
    _label = label;
  });

  void _batteriesChanged(int newValue) {
    setState(() {
      widget.config.batteries = newValue;
    });
  }

  _addLabel(BuildContext context) async {
    final Map<String, bool> result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AlertDialog(
              title: new Text('Create Label: '), content: LabelWidget()),
        ));
    setState(() {
      result.isNotEmpty && !result.containsKey("___")
          ? widget.config.labels.addAll(result)
          : {};
    });
  }

  void _removeLabel(String myValue) {
    setState(() {
      widget.config.labels.remove(myValue);
    });
  }

  Widget _returnAction(){
    // Case 1
    if (getColourName(_colour)=="blue" && _label == "ABORT" ){
      return _returnPressAndPray();
    // Case 2
    } else if (widget.config.batteries > 1 && _label=="DETONATE" ) {
      return Container(
          margin: EdgeInsets.only(top: 20.0, bottom: 20.0, right: 15.0),
          child:
          Text("Press and immediately release the button",
              style: TextStyle(fontSize: 20.0), textAlign: TextAlign.center)
      );
    // Case 3
    } else if (getColourName(_colour)=="white" && widget.config.getLabel("CAR",true) ){
      return _returnPressAndPray();
    // Case 4
    } else if (widget.config.batteries > 2 && widget.config.getLabel("FRK",true) ) {
    return Container(
      margin: EdgeInsets.only(top: 20.0, bottom: 20.0, right: 15.0),
        child:
        Text("Press and immediately release the button", style: TextStyle(fontSize: 20.0), textAlign: TextAlign.center)
    );
    // Case 5
    } else if (getColourName(_colour)=="yellow" ){
      return _returnPressAndPray();
    // Case 6
    } else if (getColourName(_colour)=="red" && _label=="HOLD" ){
      return Container(
          margin: EdgeInsets.only(top: 20.0, bottom: 20.0, right: 15.0),
          child:
          Text("Press and immediately release the button", style: TextStyle(fontSize: 20.0), textAlign: TextAlign.center)
      );
    } else {return  _returnPressAndPray();}
    //widget.config.batteries > 2 && widget.config.getLabel("FRK",true)?"The FRK is true":"BULLSHIT"

  }

  Widget _returnPressAndPray(){
    return Column(children: <Widget>[
        Row(mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
              width: 140,
              child:
              Text("If you see: ",softWrap: true,),),
              Container(
                margin: EdgeInsets.only(top:0, left:5, right: 5, bottom: 10),
                child: 
                  SizedBox(width: 30, height: 150,child:
                  DecoratedBox(decoration: ShapeDecoration(shape: Border.all(), color: Colors.blue))),),
              Container(
                margin: EdgeInsets.only(top:0, left:5, right: 5, bottom: 10),
                child:
                SizedBox(width: 30, height: 150,child:
                DecoratedBox(decoration: ShapeDecoration(shape: Border.all(), color: Colors.yellow))),),
              Container(
                margin: EdgeInsets.only(top:0, left:5, right: 5, bottom: 10),
                child:
                SizedBox(width: 30, height: 150, child:
                RotatedBox(quarterTurns: 1, child:
                    Container(alignment: Alignment(0, 0),decoration: ShapeDecoration(shape: Border.all(color: Colors.white)), child:
                Text("Any other...",softWrap: true)),),),
              ),
            ]),
        Row(mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 140,
                child:
              Text("Release when the timer contains: ",softWrap: true),),
              Container(
                margin: EdgeInsets.only(top:0, left:5, right: 5, bottom: 0),
                child:
                SizedBox(width: 30, height: 30,child:
                Container(alignment: Alignment(0, 0),decoration: ShapeDecoration(shape: Border.all(color: Colors.white)), child:
                Text("4",softWrap: true)),),),
              Container(
                margin: EdgeInsets.only(top:0, left:5, right: 5, bottom: 0),
                child:
                SizedBox(width: 30, height: 30,child:
                Container(alignment: Alignment(0, 0),decoration: ShapeDecoration(shape: Border.all(color: Colors.white)), child:
                Text("5",softWrap: true)),),),
              Container(
                margin: EdgeInsets.only(top:0, left:5, right: 5, bottom: 0),
                child:
                SizedBox(width: 30, height: 30, child:
                Container(alignment: Alignment(0, 0),decoration: ShapeDecoration(shape: Border.all(color: Colors.white)), child:
                Text("1",softWrap: true)),),),
            ]),
    ]);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
       appBar: AppBar(
          title:Text("The Button"),
          backgroundColor: Colors.red,
        ),
        body:
        Container(
          child: Stepper(
            controlsBuilder:
                (BuildContext context, {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
              return stepCounter!=2 // Workaround: Hardcoded '2' as last step
                  ? Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FlatButton(
                    onPressed: onStepCancel,
                    child: stepCounter!=0?const Text('Previous', style: TextStyle(color: Colors.white),):Text(''),
                  ),
                  _label != null && _colour != null
                  ? FlatButton(
                  onPressed: onStepContinue,
                  color: Colors.red,
                  child: const Text('Next'))
                  : Container(
                  child: const Text('Check Input', style: TextStyle(color: Colors.red)))
                ],
              )
                  :Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FlatButton(
                    onPressed: onStepCancel,
                    child: const Text('Previous', style: TextStyle(color: Colors.white),),
                  )
                ],
              );
            },
            currentStep: this.stepCounter,
            steps: [
              Step(
                title: Text("'The Button'", style: TextStyle(color: Colors.white)),
                content: new ButtonConfig(changedColour: _setColour, changedLabel: _setLabel,),
                isActive: true,
              ),
              Step(
                title: Text("Configuration Check", style: TextStyle(color: Colors.white)),
                content: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text("Check that the battery count and labels are correct:"),
                    PlusMinusWidget(
                        name: 'Batteries: ',
                        defaultValue: widget.config.batteries,
                        onChanged: _batteriesChanged),
                    Column(children: [
                      Stack(
                          alignment: Alignment(1, -1),
                          children: [
                            Container(
                                alignment: Alignment(-1.0, -1.0),
                                padding: EdgeInsets.only(left: 32.0),
                                child: Text("Labels: ",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ))),
                            Container(
                                margin: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0,bottom: 10),
                                padding: EdgeInsets.only(top: 0.0, left: 10.0, right: 10.0,bottom: 1 ),
                                decoration:
                                BoxDecoration(border: Border.all(color: Colors.white)),
                                child: GridView.builder(
                                  gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 0,childAspectRatio: 2),
                                  shrinkWrap: true,

                                  itemCount: widget.config.labels.length,
                                  itemBuilder: (context, position) {
                                    String key = widget.config.labels.keys.elementAt(position);
                                    bool val = widget.config.labels.values.elementAt(position);
                                    return new GestureDetector(
                                        onTap: (){_removeLabel(widget.config.labels.keys.elementAt(position));},
                                        child:
                                        Container(
                                            margin: EdgeInsets.only(top:5.0),
                                            child:
                                            LabelView(label: MapEntry(key, val), fullSize:false)
                                        ));
                                  },
                                )),
                            Container(
                              //alignment: Alignment(1, 1),
                              margin: EdgeInsets.only(right: 0.0),
                              child: FloatingActionButton(
                                  onPressed: () {
                                    _addLabel(context);
                                  },
                                  backgroundColor: Colors.red,
                                  foregroundColor: Colors.black,
                                  child: Icon(Icons.add)),
                            ),
                          ]),
                    ]),
                  ],
                ),
                isActive: true,
                state: StepState.editing,
              ),
              Step(
                title: Text("Button Release Protocol", style: TextStyle(color: Colors.white)),
                content: _returnAction(),
                state: StepState.complete,
                isActive: true,
              ),
            ],
            type: StepperType.vertical,
            onStepCancel: () {
              setState(() {
                stepCounter > 0 ? stepCounter -= 1 : stepCounter = 0;
              });
            },
            onStepContinue: () {
              setState(() {
                stepCounter < 3 ? stepCounter += 1 : stepCounter = stepCounter; // Workaround: Hardcoded '3' as number of steps
              });
            },
          ),
        )

    );
  }
}

