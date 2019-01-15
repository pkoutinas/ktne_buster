import 'package:flutter/material.dart';

import 'colour_picker.dart';
import 'Configurator.dart';
import 'helper.dart';

class WiresScreen extends StatefulWidget {
  final Configurator config;
  WiresScreen({Key key, @required this.config}) : super(key: key);
  @override
  _WiresScreenState createState() => new _WiresScreenState();
}

class _WiresScreenState extends State<WiresScreen> {
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
                  ? const Color(0xffffffff)
                  : const Color(0xff000000),
            ),
          ),
          Center(
            child: Text(
              'Selected Colour: ' + currentColor.value.toString(),
              style: TextStyle(color: Colors.white),
            ),
          ),
          Center(
            child: Text(
              'Is last even? ' +
                  (new RegExp(r'.*([2|4|6|8|0])$')
                          .hasMatch(currentColor.value.toString()))
                      .toString(),
              style: TextStyle(color: Colors.white),
            ),
          ),
          Center(
            child: Text(
              'Number of modules:  ' + widget.config.modules.toString(),
              style: TextStyle(color: Colors.white),
            ),
          ),
          Center(
            child: Text(
              'Serial:  ' + widget.config.serial,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
