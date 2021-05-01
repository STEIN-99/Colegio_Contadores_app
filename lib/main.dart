import 'dart:async';
import 'package:ccpt_movil/notifica/notificacion.dart';
import 'package:flutter/material.dart';
import 'menu.dart';

void main() => runApp(new MaterialApp(
      theme:
          ThemeData(primaryColor: Colors.blue[900], accentColor: Colors.grey),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    ));

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    final pushProvider = new Push();
    pushProvider.initNotificarions();

    super.initState();
    Timer(
      Duration(seconds: 5),
      () => Navigator.of(context).push(
        new MaterialPageRoute(
            builder: (BuildContext context) => new Principal()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: new DecorationImage(
                  image: new AssetImage("assets/img/pantalla_carga.png"),
                  fit: BoxFit.cover),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 200.0),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircularProgressIndicator(),
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                      ),
                      Text("",
                          style: TextStyle(
                              color: Colors.yellowAccent[400],
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold)),
                    ],
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
