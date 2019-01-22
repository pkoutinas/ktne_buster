import 'package:flutter/material.dart';
import 'colour_picker.dart';

class PlusMinusWidget extends StatefulWidget {
  final String name;
  final int defaultValue;
  final ValueChanged<int> onChanged;

  PlusMinusWidget(
      {Key key,
      @required this.name,
      @required this.defaultValue,
      @required this.onChanged})
      : super(key: key);

  _PlusMinusWidgetState createState() => _PlusMinusWidgetState();
}

class _PlusMinusWidgetState extends State<PlusMinusWidget> {
  _PlusMinusWidgetState();

  void _increaseCount() {
    widget.onChanged(widget.defaultValue + 1);
  }

  void _decreaseCount() {
    if (widget.defaultValue > 0) {
      widget.onChanged(widget.defaultValue - 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          width: 100.0,
          child: Container(
            child: Text(
              widget.name,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(0.0),
          child: IconButton(
            icon: Icon(Icons.remove),
            color: Colors.white,
            onPressed: _decreaseCount,
          ),
        ),
        SizedBox(
          width: 18.0,
          child: Container(
            child: Text(
              widget.defaultValue.toString(),
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(0.0),
          child: IconButton(
            icon: Icon(Icons.add),
            color: Colors.white,
            onPressed: _increaseCount,
          ),
        ),
      ],
    );
  }
}

class SerialWidget extends StatefulWidget {
  final String defaultValue;
  final ValueChanged<String> onChanged;

  SerialWidget({Key key, @required this.defaultValue, @required this.onChanged})
      : super(key: key);

  _SerialWidgetState createState() => _SerialWidgetState();
}

class _SerialWidgetState extends State<SerialWidget> {
  _SerialWidgetState();

  void _setSerial(String newValue) {
    widget.onChanged(newValue);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 250.0,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                width: 130.0,
                child: Container(
                  child: Text("Serial Number: "),
                ),
              ),
              Container(
                child: Flexible(
                  child: TextField(
                    textCapitalization: TextCapitalization.characters,
                    textInputAction: TextInputAction.done,
                    autocorrect: false,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: widget.defaultValue,
                      hintStyle: widget.defaultValue == "Enter Value"
                          ? TextStyle(
                              color: Colors.grey, fontStyle: FontStyle.italic)
                          : TextStyle(
                              color: Colors.white,
                            ),
                    ),
                    onChanged: (text) {
                      _setSerial(text);
                    },
                  ),
                ),
              ),
            ]));
  }
}

class PortWidget extends StatefulWidget {
  final Map<String, bool> defaultValue;
  final ValueChanged<String> onChanged;

  PortWidget({Key key, @required this.defaultValue, @required this.onChanged})
      : super(key: key);

  _PortWidgetState createState() => _PortWidgetState();
}

class _PortWidgetState extends State<PortWidget> {

  void _togglePort(String name) {
    widget.onChanged(name);
    widget.defaultValue[name] = !widget.defaultValue[name];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        margin: const EdgeInsets.only(top: 5.0, bottom: 15.0),
        padding: const EdgeInsets.all(8.0),
        width: 325.0,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      width: 200.0,
                      child: Container(
                        child: Text(
                          "Ports present: ",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                        padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                        child: GestureDetector(
                            onTap: () {
                              _togglePort("DVI");
                            },
                            child: Opacity(
                                opacity: widget.defaultValue["DVI"] ? 1 : 0.3,
                                child: Image.asset(
                                  'images/controls/ports/dvi.png',
                                  width: 100,
                                )))),
                    Container(
                        padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                        child: GestureDetector(
                            onTap: () {
                              _togglePort("Parallel");
                            },
                            child: Opacity(
                                opacity:
                                    widget.defaultValue["Parallel"] ? 1 : 0.3,
                                child: Image.asset(
                                  'images/controls/ports/parallel.png',
                                  width: 165,
                                )))),
                  ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                        padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                        child: GestureDetector(
                            onTap: () {
                              _togglePort("PS2");
                            },
                            child: Opacity(
                                opacity: widget.defaultValue["PS2"] ? 1 : 0.34,
                                child: Image.asset(
                                  'images/controls/ports/ps2.png',
                                  width: 50,
                                )))),
                    Container(
                        padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                        child: GestureDetector(
                            onTap: () {
                              _togglePort("RJ45");
                            },
                            child: Opacity(
                                opacity: widget.defaultValue["RJ45"] ? 1 : 0.3,
                                child: Image.asset(
                                    'images/controls/ports/rj45.png',
                                    width: 60)))),
                    Container(
                        padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                        child: GestureDetector(
                            onTap: () {
                              _togglePort("Serial");
                            },
                            child: Opacity(
                                opacity:
                                    widget.defaultValue["Serial"] ? 1 : 0.3,
                                child: Image.asset(
                                  'images/controls/ports/serial.png',
                                  width: 100,
                                )))),
                    Container(
                        padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                        child: GestureDetector(
                            onTap: () {
                              _togglePort("Stereo");
                            },
                            child: Opacity(
                                opacity:
                                    widget.defaultValue["Stereo"] ? 1 : 0.3,
                                child: Image.asset(
                                  'images/controls/ports/stereo.png',
                                  width: 30,
                                )))),
                  ]),
            ]));
  }
}

bool useWhiteForeground(Color color) {
  return 1.05 / (color.computeLuminance() + 0.05) > 4.5;
}

class LabelView extends StatelessWidget{
  final MapEntry<String, bool> label;
  final bool fullSize;

  LabelView({Key key, @required this.label, @required this.fullSize}):super(key:key);

  @override
  Widget build(BuildContext context ) {
  return Column(mainAxisSize: MainAxisSize.min, children: [
  Container(
    padding: const EdgeInsets.only(left: 4.0, right: 4.0),
    width: 170.0,
    child:
      Stack(
        children: <Widget>[
      Image.asset(
          label.value ? 'images/controls/label_on.png'
        : 'images/controls/label_off.png',
        width: 150,
      ),
          Container(
              //margin: const EdgeInsets.only(left: 58.0),
              padding: EdgeInsets.only(left: fullSize?73.0:55.0, top: fullSize?22.0:16.0),
              child:
                Text(label.key, style: TextStyle(color: Colors.white, fontSize: fullSize?20.0:16.0))
          ),
    ],
  ))
  ]);
  }
}

class LabelWidget extends StatefulWidget {

  LabelWidget({Key key}) : super(key: key);

  _LabelWidgetState createState() => _LabelWidgetState();
}

class _LabelWidgetState extends State<LabelWidget> {
  bool _isSet = false;
  String _defaultValue = "___";

  void _toggleImage() {
    _isSet = !_isSet;
  }

  void _setLabelValue(String value) {
    _defaultValue = value;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
      Container(
          padding: const EdgeInsets.only(left: 4.0, right: 4.0),
          width: 170.0,
          child: Stack(children: [
            GestureDetector(
                onTap: () {
                  setState(() {
                    _toggleImage();
                  });
                },
                child: Image.asset(
                  _isSet
                      ? 'images/controls/label_on.png'
                      : 'images/controls/label_off.png',
                  width: 150,
                )),
            Container(
                margin: const EdgeInsets.only(left: 58.0),
                padding: const EdgeInsets.only(top: 11.0),
                width: 80,
                child: TextField(
                  textCapitalization: TextCapitalization.characters,
                  textInputAction: TextInputAction.done,
                  maxLength: 3,
                  autocorrect: false,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: _defaultValue,
                    hintStyle: _defaultValue == "___"
                        ? TextStyle(
                            color: Colors.grey, fontStyle: FontStyle.italic)
                        : TextStyle(color: Colors.white, fontSize: 10.0),
                  ),
                  onChanged: (text) {
                    _setLabelValue(text);
                  },
                )),
          ])),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        new FlatButton(
          child: new Text('Back', style: TextStyle(color: Colors.red),),
          onPressed: () {
            setState(() {Navigator.of(context).pop({_defaultValue:_isSet});
            });
          },
        ),
        new FlatButton(
          child: new Text('Ready', style: TextStyle(fontWeight: FontWeight.bold)),
          onPressed: () {
            setState(() {
              (_defaultValue.length == 3 && _defaultValue != "___")
                  ? Navigator.of(context).pop({_defaultValue:_isSet})
                  : {};
            });
          },
        ),
      ])
    ]);
  }
}

class ButtonConfig extends StatefulWidget {
  final ValueChanged<MaterialColor> changedColour;
  final ValueChanged<String> changedLabel;

  ButtonConfig({Key key, @required this.changedColour,@required this.changedLabel}) : super(key: key);

  _ButtonConfigState createState() => _ButtonConfigState();
}

class _ButtonConfigState extends State<ButtonConfig> {
  MaterialColor changedColour = Colors.grey;
  String _label = "label";

  changeColor(Color colour) => setState(() {
    debugPrint("colour: "+colour.toString());
    changedColour = MaterialColor(colour.value,{1:colour});
    debugPrint("colour2: "+colour.toString());
    widget.changedColour(MaterialColor(colour.value,{1:colour}) );
    debugPrint("colour3: "+colour.toString());
    Navigator.of(context).pop();
  });

  setConfig(Color colour, String label) {
    widget.changedLabel(label);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Pick the colour and label"),
          Row(
            children: <Widget>[
              SizedBox(
                  height: 145 ,
                  child:
                      Container(
                          margin: EdgeInsets.all(5),
                          child:
                  Stack(
                    alignment: Alignment(0, 0),
                    children: <Widget>[
                      Image.asset('images/activities/Button/just_button.png', scale: 0.7),
                      Positioned(
                          top: 19.7,
                          child:
                      CircleAvatar(backgroundColor: this.changedColour,radius: 51.5,)
                        ),
                      Container(
                        margin: EdgeInsets.only(left:1, top:10),
                          child:
                          Text(_label, style: TextStyle(fontSize: 18,
                            color: useWhiteForeground(this.changedColour)
                              ? Colors.white
                                : Colors.black),
                      )),
                    ],
                  ))
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //Text("Select:"),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                    Text('Colour'),
                  RaisedButton(
                    shape: CircleBorder(side: BorderSide(color: changedColour, width: 10)),
                    elevation: 3.0,
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Select a colour'),
                            content: SingleChildScrollView(
                              child: BlockPicker(
                                pickerColor: changedColour,
                                onColorChanged: changeColor,
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Text(''),
                  ),
                ]
              ),
                  DropdownButton(
                    items:  <String>['ABORT', 'DETONATE', 'HOLD'].map((String ddValue) {
                      return new DropdownMenuItem<String>(
                        value: ddValue,
                        child: new Text(ddValue, style: TextStyle(color: Colors.white)),
                      );
                    }).toList(),
                    hint: Text(_label),
                    onChanged: (String newLabel){
                      setState(() {
                        _label = newLabel;
                        setConfig(changedColour, _label);
                      });
                    },
                  )
                ]
              )
            ],
          ),
        ]);
  }
}

String getColourName(MaterialColor colourValue){

  if (colourValue == Colors.red){
    return "red";
  }else if (colourValue == Colors.blue){
    return "blue";
  }else if (colourValue == Colors.yellow){
    return "yellow";
  }else if (colourValue == Colors.white){
    return "white";
  }else if (colourValue == Colors.black){
    return "black";
  }else
    return ""; //Should catch this error more elegantly
}