import 'package:flutter/material.dart';

import 'package:ktne/uiElements/colour_picker.dart';
import 'Configurator.dart';
import 'package:ktne/uiElements/helper.dart';

class WiresScreen extends StatefulWidget {
  final Configurator config;
  WiresScreen({Key key, @required this.config}) : super(key: key);
  @override
  _WiresScreenState createState() => new _WiresScreenState();
}

class _WiresScreenState extends State<WiresScreen> {
  Color currentColor = Color(0xff443a49);
  ValueChanged<Color> onColorChanged;

  List<String> _wires;


  changeColor(Color color) => setState(() {
        currentColor = color;
        Navigator.of(context).pop();
      });

  _3Wires(){
    if (_colourCount("red") == 0)
        return 2;
    else if (_wires[_wires.length-1] == "white")
      return _wires.length;
    else if (_colourCount("blue")<=1)
      return _lastWireColour("blue");
    else
      return _wires.length;
  }

  _4Wires(){
    if (_colourCount("red")>1 && !widget.config.lastDigitEven())
      return _lastWireColour("red");
    else if (_lastWireColour("yellow") && _colourCount("red")==0 || _colourCount("blue")==1 ) // Combining conditions 2 and 3 for simplicity
      return 1;
    else if ( _colourCount("yellow")>1)
      return _wires.length;
    else
      return 2;
  }

  _5Wires(){
    if (_wires[_wires.length-1] == "black" && !widget.config.lastDigitEven())
      return 4;
    else if (_colourCount("red")==1 && _colourCount("yellow")>1 ) // Combining conditions 2 and 3 for simplicity
      return 1;
    else if ( _colourCount("black")==0)
      return 2;
    else
      return 1;
  }

  _6Wires(){
    if (_colourCount("yellow")==0 && !widget.config.lastDigitEven())
      return 3;
    else if (_colourCount("yellow")==1 && _colourCount("white")>1)
      return 4;
    else if (_colourCount("red")==0)
      return _wires.length;
    else
      return 4;
  }

  _lastWireColour(String colour) {
    return _wires.lastIndexOf(colour);
  }

  _colourCount(String colour){
    return _wires.where((wire) => wire == colour).toList().length;
  }

  _resetProgress() {
    _wires.clear();
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
        title:Text("Wires"),
        backgroundColor: Colors.red,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: RaisedButton(
              elevation: 3.0,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Select a color'),
                      content: SingleChildScrollView(
                        child: BlockPicker(
                          pickerColor: currentColor,
                          onColorChanged: changeColor,
                        ),
                      ),
                    );
                  },
                );
              },
              child: Text('Select Colour'),
              color: currentColor,
              textColor: useWhiteForeground(currentColor)
                  ? Colors.white//const Color(0xffffffff)
                  : Colors.black, //const Color(0xff000000),
            ),
          ),
          Center(
            child: Text(
              'Selected Colour: ' + currentColor.value.toString(),
            ),
          ),
          Center(
            child: Text(
              'Number of modules:  ' + widget.config.modules.toString(),
            ),
          ),
          Center(
            child: Text(
              'Serial:  ' + widget.config.serial,
            ),
          ),
          Center(
            child: Text(
              'Is last even? ' +
                  widget.config.lastDigitEven().toString(),
            ),
          ),
        ],
      ),
    );
  }
}
