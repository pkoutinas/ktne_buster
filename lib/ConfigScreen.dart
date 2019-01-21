import 'package:flutter/material.dart';
import 'Configurator.dart';
import 'helper.dart';

class ConfigScreen extends StatefulWidget {
  final Configurator config;

  ConfigScreen({Key key, @required this.config}) : super(key: key);

  @override
  _ConfigScreenState createState() => _ConfigScreenState();
}

class _ConfigScreenState extends State<ConfigScreen> {
  void _modulesChanged(int newValue) {
    setState(() {
      widget.config.modules = newValue;
    });
  }

  void _batteriesChanged(int newValue) {
    setState(() {
      widget.config.batteries = newValue;
    });
  }

  void _serialChanged(String newValue) {
    setState(() {
      widget.config.serial = newValue;
    });
  }

  void _portChanged(String port) {
    setState(() {
      widget.config.togglePortValue(port);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title:Text("Configuration"),
      ),
      body: ListView(shrinkWrap: true, children: [
        Column(children: [
          PlusMinusWidget(
              name: 'Modules: ',
              defaultValue: widget.config.modules,
              onChanged: _modulesChanged),
          PlusMinusWidget(
              name: 'Batteries: ',
              defaultValue: widget.config.batteries,
              onChanged: _batteriesChanged),
          SerialWidget(
              defaultValue: widget.config.serial == ""
                  ? 'Enter Value'
                  : widget.config.serial,
              onChanged: _serialChanged),
          PortWidget(defaultValue: {
            "DVI": widget.config.getPortValue("DVI"),
            "Parallel": widget.config.getPortValue("Parallel"),
            "PS2": widget.config.getPortValue("PS2"),
            "RJ45": widget.config.getPortValue("RJ45"),
            "Serial": widget.config.getPortValue("Serial"),
            "Stereo": widget.config.getPortValue("Stereo")
          }, onChanged: _portChanged),
        ]),

        Column(children: [
          Container(
              alignment: Alignment(-1.0, -1.0),
              padding: new EdgeInsets.only(top: 10.0, left: 20.0),
              child: Text("Labels: ",
                  style: TextStyle(
                    color: Colors.white,
                  ))),
          Stack(
            alignment: Alignment(1, -1),
              children: [
            Container(
                margin: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0, bottom: 20),
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
                      margin: EdgeInsets.only(top:18.0),
                        child:
                        LabelView(label: MapEntry(key, val), fullSize: true)
                    ));
                    },
                )),
            Container(
              //alignment: Alignment(1, 1),
              margin: EdgeInsets.only(top: 4, right: 15.0),
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
      ]),
    );
  }
}
