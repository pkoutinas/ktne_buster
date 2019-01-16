import 'package:flutter/material.dart';

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
  final bool defaultValue;
  final ValueChanged<String> onChanged;

  PortWidget({Key key, @required this.defaultValue, @required this.onChanged})
      : super(key: key);

  _PortWidgetState createState() => _PortWidgetState();
}

class _PortWidgetState extends State<PortWidget> {
  Map<String, bool> _portSet = {
    "DVI": false,
    "Parallel": false,
    "PS2": false,
    "RJ45": false,
    "Serial": false,
    "Stereo": false
  };

  void _togglePort(String name) {
    widget.onChanged(name);
    _portSet[name] = !_portSet[name];
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
                                opacity: _portSet["DVI"] ? 1 : 0.3,
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
                                opacity: _portSet["Parallel"] ? 1 : 0.3,
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
                                opacity: _portSet["PS2"] ? 1 : 0.34,
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
                                opacity: _portSet["RJ45"] ? 1 : 0.3,
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
                                opacity: _portSet["Serial"] ? 1 : 0.3,
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
                                opacity: _portSet["Stereo"] ? 1 : 0.3,
                                child: Image.asset(
                                  'images/controls/ports/stereo.png',
                                  width: 30,
                                )))),
                  ]),
            ]));
  }
}

class LabelGridWidget extends StatefulWidget {
  final ValueChanged<Label> onChanged;

  LabelGridWidget({Key key, @required this.onChanged}) : super(key: key);

  _LabelGridWidgetState createState() => _LabelGridWidgetState();
}

class _LabelGridWidgetState extends State<LabelGridWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Expanded(
            child: GridView.count(
      crossAxisCount: 2,
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.map, color: Colors.white),
          title: Text('Map', style: TextStyle(color: Colors.white)),
        ),
        ListTile(
          leading: Icon(Icons.photo_album, color: Colors.white),
          title: Text('Album', style: TextStyle(color: Colors.white)),
        ),
        ListTile(
          leading: Icon(
            Icons.phone,
            color: Colors.white,
          ),
          title: Text('Phone', style: TextStyle(color: Colors.white)),
        ),
      ],
    )));
  }
}

class LabelWidget extends StatefulWidget {
  final ValueChanged<Label> onChanged;
  bool isSet = false;
  String defaultValue = "Tap";

  LabelWidget({Key key, @required this.onChanged}) : super(key: key);

  _LabelWidgetState createState() => _LabelWidgetState();
}

class _LabelWidgetState extends State<LabelWidget> {

  void _toggleImage() {
    widget.isSet = !widget.isSet;
  }
  void _setLabelValue(String value) {
    widget.defaultValue = value;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                widget.isSet
                    ? 'images/controls/label_on.png'
                    : 'images/controls/label_off.png',
                width: 150,
              )),
          Container(
              margin: const EdgeInsets.only(left: 35.0),
              padding: const EdgeInsets.only(top: 11.0),
              child:
              TextField(
              textCapitalization: TextCapitalization.characters,
              textInputAction: TextInputAction.done,
              maxLength: 3,
              autocorrect: false,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: widget.defaultValue,
                hintStyle: widget.defaultValue == "Tap"
                    ? TextStyle(
                    color: Colors.grey, fontStyle: FontStyle.italic)
                    : TextStyle(
                  color: Colors.white,
                ),
              ),
              onChanged: (text) {
                _setLabelValue(text);
              },
            )),
        ]));
  }
}

class Label {
  bool led;
  String labelText;

  Label(bool led, String labelText) {
    this.led = led;
    this.labelText = labelText;
  }
}

bool useWhiteForeground(Color color) {
  return 1.05 / (color.computeLuminance() + 0.05) > 4.5;
}
