
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



void main() => runApp(Perfil());

class Perfil extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text("Perfil Usuario"), 
        backgroundColor: Colors.blue[900],
          ),
        body: Center(
          child: new Text("Bienvenido Usuario"),
        ),
      )
    );
  }
}


