import 'package:flutter/material.dart';

class Configurator {
  int _modules;
  int _strikes;
  int _batteries;
  String _serial;
  List<Label> _labels;
  bool _has_DVI;
  bool _has_parallel;
  bool _has_ps2;
  bool _has_RJ45;
  bool _has_serial;
  bool _has_stereo;

  Configurator() {
    _modules = 5;
    _strikes = 0;
    _batteries = 0;
    _serial = "";
    _labels = new List(0);
    _has_DVI = false;
    _has_parallel = false;
    _has_ps2 = false;
    _has_RJ45 = false;
    _has_serial = false;
    _has_stereo = false;
  }

  void addLabel(bool led, String label_text) {
    _labels.add(new Label(led, label_text));
  }

  bool last_digit_even() {
    RegExp _regex = new RegExp(r'.*([2|4|6|8|0])$');
    return _regex.hasMatch(_serial);
  }

  int get modules => _modules;

  set modules(int value) {
    _modules = value;
  }

Widget moduleWidget() {
    //return new PlusMinusWidget('Modules: ',_modules);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          width: 100.0,
          child: Container(
            child: Text(
              'Modules: ',
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
            onPressed: () {
                (_modules > 0) ? _modules -= 1 : _modules = _modules;
            },
          ),
        ),
        SizedBox(
          width: 18.0,
          child: Container(
            child: Text(
              _modules.toString(),
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
            onPressed: () {
              _modules += 1;
            },
          ),
        ),
      ],
    );
  }

  int get strikes => _strikes;

  set strikes(int value) {
    _strikes = value;
  }

  int get batteries => _batteries;

  set batteries(int value) {
    _batteries = value;
  }

  String get serial => _serial;

  set serial(String value) {
    _serial = value;
  }

  bool get has_DVI => _has_DVI;

  set has_DVI(bool value) {
    _has_DVI = value;
  }

  bool get has_parallel => _has_parallel;

  set has_parallel(bool value) {
    _has_parallel = value;
  }

  bool get has_ps2 => _has_ps2;

  set has_ps2(bool value) {
    _has_ps2 = value;
  }

  bool get has_RJ45 => _has_RJ45;

  set has_RJ45(bool value) {
    _has_RJ45 = value;
  }

  bool get has_serial => _has_serial;

  set has_serial(bool value) {
    _has_serial = value;
  }

  bool get has_stereo => _has_stereo;

  set has_stereo(bool value) {
    _has_stereo = value;
  }
}

class Label {
  bool _led;
  String _label_text;

  Label(bool led, String label_text) {
    this._led = led;
    this._label_text = label_text;
  }
}