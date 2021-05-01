import 'package:colegio_app/Eventos/detaileve.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Eventos extends StatefulWidget {
  @override
  _EventosState createState() => new _EventosState();
}

class _EventosState extends State<Eventos> {
  Future<List> getData() async {
    final response = await http
        .get("http://10.0.2.2/Proyectos/CCP/conexiones/Eventos/getdata.php");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Eventos"),
        backgroundColor: Colors.blue[900],
      ),
      body: new FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? new ItemList(
                  list: snapshot.data,
                )
              : new Center(
                  child: new CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return new Container(
          padding: const EdgeInsets.all(10.0),
          child: new GestureDetector(
            onTap: () => Navigator.of(context).push(
              new MaterialPageRoute(
                  builder: (BuildContext context) => new Detaieve(
                        list: list,
                        index: i,
                      )),
            ),
            child: new Card(
              child: new ListTile(
                title: new Text(
                  "${list[i]['NOMBRE']}",
                  style: TextStyle(fontSize: 25.0, color: Colors.grey),
                ),
                leading: new Icon(
                  Icons.event_note,
                  size: 47.0,
                  color: Colors.grey,
                ),
                subtitle: new Text(
                  "${list[i]['DESCRIP']}",
                  style: TextStyle(fontSize: 20.0, color: Colors.black),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
