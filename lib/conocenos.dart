import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Conoce extends StatefulWidget {
  @override
  _ConoceState createState() => new _ConoceState();
}

class _ConoceState extends State<Conoce> {


 
@override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Conocenos"),
        backgroundColor: Colors.blue[900],
      ),
body: new Container(
        height: 1050.0, 
        padding: const EdgeInsets.all(10.0),
        child: new Card(
          child: new Center(
            child: new Column(
              children: <Widget>[

                new Padding(padding: const EdgeInsets.only(top: 20.0),),
                new Text("Historia", style: new TextStyle(fontSize: 25.0),),

             
               Divider(),

              
                new Text("El Colegio de Contadores Públicos del Estado de Tabasco, nace el 14 de junio de 1978, en la ciudad de Villahermosa, Tabasco, siendo el primer organismo colegiado de esta profesión en la entidad, y se afilia en esas fechas al instituto mexicano de contadores públicos, A.C.", style: new TextStyle(fontSize: 18.0),),
                new Padding(padding: const EdgeInsets.only(top: 30.0),),            
    
                
                new Padding(padding: const EdgeInsets.only(top: 2.0),),
                new Text("Misión", style: new TextStyle(fontSize: 25.0),),
               
                Divider(),  
                
                new Text("Captar contadores públicos del estado de Tabasco, capacitarlos y actualizarlos en las diferentes reamas de contaduría públicas.", style: new TextStyle(fontSize: 18.0),),
                new Padding(padding: const EdgeInsets.only(top: 30.0),),
                  

                new Padding(padding: const EdgeInsets.only(top: 2.0),),
                new Text("Visión", style: new TextStyle(fontSize: 25.0),),
                
                Divider(),  
                
                new Text("Conjuntar profesionalitas de la contaduría pública con alta capacidad y actualización en el estado de Tabasco.", style: new TextStyle(fontSize: 18.0),),
                new Padding(padding: const EdgeInsets.only(top: 30.0),),

              ],
            ),
          ),
        ),
      ),
    );
  }
}