import 'package:flutter/material.dart';
import 'Configurator.dart';
import 'helper.dart';

class ConfigScreen extends StatelessWidget {
  final Configurator config;
  ConfigScreen({Key key, @required this.config}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Configuration"),
      ),
      body: ListView(
          children: [
            new PlusMinusWidget('Modules: ',config.modules),
            new PlusMinusWidget('Batteries: ',config.batteries)
          ]),
    );
  }
}

