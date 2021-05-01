import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'detailnews.dart';

class Noticias extends StatefulWidget {
  @override
  _NoticiasState createState() => new _NoticiasState();
}

class _NoticiasState extends State<Noticias> {
  Future<List> getData() async {
    final response = await http.get("http://ccptab.com/Movil/Noticias.php");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Noticias"),
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
                  builder: (BuildContext context) => new Detailnot(
                        list: list,
                        index: i,
                      )),
            ),
            child: new Card(
              child: new ListTile(
                title: new Text(
                  "${list[i]['nombre_noticia']}",
                  style: TextStyle(fontSize: 25.0, color: Colors.grey),
                ),
                leading: new Icon(
                  Icons.chrome_reader_mode,
                  size: 47.0,
                  color: Colors.grey,
                ),
                subtitle: new Text(
                  "${list[i]['detalles_noticia']}",
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
