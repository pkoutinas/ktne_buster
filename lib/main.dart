import 'package:flutter/material.dart';
import 'Configurator.dart';
import 'ConfigScreen.dart';
import 'WiresScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(
        // ignore: undefined_getter
        canvasColor: Colors.black,
        fontFamily: 'Elite',
        textTheme: TextTheme(body1: TextStyle(color: Colors.white))
      ),
      home: new SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Configurator _config = new Configurator();
    return new Scaffold(
      body: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Image.asset(
                    'images/logo.png',
                    fit: BoxFit.fill,
                  ),
                  new RaisedButton(
                      key: null,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  CentralScreen(config: _config)),
                        );
                      },
                      padding: const EdgeInsets.all(32.0),
                      color: const Color(0xFF000000),
                      child: new Text(
                        "START",
                        style: new TextStyle(
                            fontSize: 40.0,
                            color: const Color(0xFFfc0000),
                            fontWeight: FontWeight.w200,
                            fontFamily: "Elite"),
                      )),
                ])
          ]),
    );
  }
}

class CentralScreen extends StatelessWidget {
  final Configurator config;
  // ignore: final_initialized_in_declaration_and_constructor
  CentralScreen({Key key, @required this.config}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("KTNE Buster"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: new Column(children: <Widget>[
        Center(
          child: RaisedButton(
            child: Text('Config'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ConfigScreen(config: this.config)),
              );
            },
          ),
        ),
        Center(
          child: RaisedButton(
            child: Text('Wires'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => WiresScreen(config: this.config)),
              );
            },
          ),
        ),
      ]),
    );
  }
}
