import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Ubicacion extends StatefulWidget {
  @override
  _UbicacionState createState() => new _UbicacionState();
}

class _UbicacionState extends State<Ubicacion> {


 
@override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Ubicacion"),
        backgroundColor: Colors.blue[900],
      ),
    );
  }
}