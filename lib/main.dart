import 'package:flutter/material.dart';
import 'Configurator.dart';
import 'ConfigScreen.dart';
import 'WiresScreen.dart';
import 'ButtonScreen.dart';
import 'KeypadsScreen.dart';
import 'SimonScreen.dart';
import 'WhosFirstScreen.dart';

const Map<String, String> _games = {
  "Wires": 'images/activities/wires.png',
  "The Button": 'images/activities/button.png',
  "Keypads": 'images/activities/keypads.png',
  "Simon": 'images/activities/simon.png',
  "Who's First": 'images/activities/whosfirst.png',
};

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(
          // ignore: undefined_getter
          primaryColor: Colors.red,
          primaryTextTheme: TextTheme( body2: TextStyle(color: Colors.white)),
          hintColor: Colors.white,
          canvasColor: Colors.grey[900],
          cardColor: Colors.red,
          fontFamily: 'Elite',
          textTheme: TextTheme(body1: TextStyle(color: Colors.white))),
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
                  new FlatButton(
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
                      color: Colors.grey[900],
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
      floatingActionButton: FloatingActionButton(
        //RaisedButton(
        backgroundColor: Colors.red,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0))),
        child: Icon(
          Icons.settings,
          size: 50,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ConfigScreen(config: this.config)),
          );
        },
      ),
      appBar: AppBar(
          title:  Image.asset(
            'images/logo3.png',
            fit: BoxFit.fill,
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.grey[900]
      ),
      body: Container(
        padding: EdgeInsets.only(top: 15.0),
        alignment: Alignment(0, 0),
        child: GridView(
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3),
            children: [
              GridTile(
                  child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                        builder: (context) => WiresScreen(config: this.config)),
                  );
                },
                child: Column(children: [
                  Stack(alignment: Alignment(0, 1), children: <Widget>[
                    Image.asset(_games["Wires"]),
                    Text("Wires",style: TextStyle(color: Colors.red))
                  ])
                ]),
              )),
              GridTile(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => ButtonScreen(config: this.config)
                      ),);
                    },
                    child: Column(children: [
                      Stack(alignment: Alignment(0, 1), children: <Widget>[
                        Image.asset(_games["The Button"]),
                        Text("The Button",style: TextStyle(color: Colors.red))
                      ])
                    ]),
                  )),
              GridTile(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => KeypadsScreen(config: this.config)
                      ),);
                    },
                    child: Column(children: [
                      Stack(alignment: Alignment(0, 1), children: <Widget>[
                        Image.asset(_games["Keypads"]),
                        Text("Keypads",style: TextStyle(color: Colors.red))
                      ])
                    ]),
                  )),
              GridTile(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => SimonScreen(config: this.config)
                      ),);
                    },
                    child: Column(children: [
                      Stack(alignment: Alignment(0, 1), children: <Widget>[
                        Image.asset(_games["Simon"]),
                        Text("Simon",style: TextStyle(color: Colors.red))
                      ])
                    ]),
                  )),
              GridTile(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => WhosFirstScreen(config: this.config)
                      ),);
                    },
                    child: Column(children: [
                      Stack(alignment: Alignment(0, 1), children: <Widget>[
                        Image.asset(_games["Who's First"]),
                        Text("Who's First",style: TextStyle(color: Colors.red))
                      ])
                    ]),
                  )),
              Icon(Icons.settings, color: Colors.red),
              Icon(Icons.settings, color: Colors.red),
              Icon(Icons.settings, color: Colors.red),
              Icon(Icons.settings, color: Colors.red),
            ]),
      ),
    );
  }
}
