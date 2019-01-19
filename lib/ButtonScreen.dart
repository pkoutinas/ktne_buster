import 'package:flutter/material.dart';

import 'colour_picker.dart';
import 'Configurator.dart';
import 'helper.dart';

class ButtonScreen extends StatefulWidget {
  final Configurator config;
  ButtonScreen({Key key, @required this.config}) : super(key: key);
  @override
  _ButtonScreenState createState() => new _ButtonScreenState();
}

class _ButtonScreenState extends State<ButtonScreen> {
  Color currentColor = Color(0xff443a49);
  ValueChanged<Color> onColorChanged;

  changeColor(Color color) => setState(() {
        currentColor = color;
        Navigator.of(context).pop();
      });

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
