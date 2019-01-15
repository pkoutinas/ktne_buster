import 'package:flutter/material.dart';

class PlusMinusWidget extends StatefulWidget {

  final String name;
  final int defaultValue;
  final ValueChanged<int> onChanged;

  PlusMinusWidget({Key key, @required this.name , @required  this.defaultValue,@required this.onChanged})
      : super(key: key);

  _PlusMinusWidgetState createState() => _PlusMinusWidgetState();
}

class _PlusMinusWidgetState extends State<PlusMinusWidget> {

  _PlusMinusWidgetState();

  void _increaseCount() {
    widget.onChanged( widget.defaultValue + 1 );
  }

  void _decreaseCount() {
      if (widget.defaultValue > 0) {
        widget.onChanged( widget.defaultValue - 1 );
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
    widget.onChanged( newValue );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
      SizedBox(
      width: 200.0,
      child: Container(
        child: Text(
          "Serial Number: ",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    ),Container(
      child: Flexible(
        child: TextField(
          textCapitalization: TextCapitalization.characters,
          textInputAction: TextInputAction.done,
          autocorrect: false,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
          cursorColor: Colors.red,
          decoration: InputDecoration(
            hintText: widget.defaultValue,
            hintStyle: TextStyle(color: Colors.white),
          ),
          onChanged: (text) {_setSerial(text);},
        ),
      ),
    ),
    ]);
  }
}

bool useWhiteForeground(Color color) {
  return 1.05 / (color.computeLuminance() + 0.05) > 4.5;
}