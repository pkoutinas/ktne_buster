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

  @override
  Widget build(BuildContext context) {
    String _hint = 'Enter Serial Number';
    return Scaffold(
      appBar: AppBar(
        title: Text("Configuration"),
      ),
      body: Column(children: [
        PlusMinusWidget(
            name: 'Modules: ',
            defaultValue: widget.config.modules,
            onChanged: _modulesChanged),
        PlusMinusWidget(
            name: 'Batteries: ',
            defaultValue: widget.config.batteries,
            onChanged: _batteriesChanged),
        SerialWidget(
            defaultValue: widget.config.serial ==""?'Enter Value':widget.config.serial,
            onChanged: _serialChanged),
      ]),
    );
  }
}
