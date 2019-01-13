import 'package:flutter/material.dart';
import 'helper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(
        // ignore: undefined_getter
        canvasColor: Colors.black,
        fontFamily: 'Elite',
      ),
      home: new SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
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
                              builder: (context) => CentralScreen()),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("KTNE Buster"),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
      body: new Column(
        children: <Widget>[
          Center(
        child: RaisedButton(
          child: Text('Config'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ConfigScreen()),
            );
          },
        ),
      ),
    ])
    );
  }
}

class ConfigScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Configuration"),
      ),
        body: ListView(
         children: [
           new PlusMinusWidget('Modules: ',5),
           new PlusMinusWidget('Batteries: ',0)
         ]),
    );
  }
}
