import 'package:flutter/material.dart';

class PlusMinusWidget extends StatefulWidget {
  int _defaultValue;
  var _name;

  PlusMinusWidget(var name , int defaultValue){
    this._name = name;
    this._defaultValue = defaultValue;
  }

  @override
  _PlusMinusWidgetState createState() => _PlusMinusWidgetState(_name,_defaultValue);
}

class _PlusMinusWidgetState extends State<PlusMinusWidget> {
  var _label ;
  int _count ;

  _PlusMinusWidgetState(var name , int defaultValue){
    this._label = name;
    this._count = defaultValue;
  }

  void _increaseCount() {
    setState(() {
      _count += 1;
    });
  }

  void _decreaseCount() {
    setState(() {
      if (_count > 0) {
        _count -= 1;
      }
    });
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
              '$_label',
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
              '$_count',
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
