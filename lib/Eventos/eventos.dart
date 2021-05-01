import 'package:ccpt_movil/Eventos/detaileve.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Eventos1 extends StatefulWidget {
  @override
  _Eventos1State createState() => new _Eventos1State();
}

class _Eventos1State extends State<Eventos1> {
  Future<List> getData() async {
    final response = await http.get("http://ccptab.com/Movil/Eventos.php");
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
          padding: const EdgeInsets.all(2.0),
          child: new GestureDetector(
            onTap: () => Navigator.of(context).push(
              new MaterialPageRoute(
                  builder: (BuildContext context) => new Detaieve(
                        list: list,
                        index: i,
                      )),
            ),
            child: new Card(
              elevation: 2.0,
              margin: EdgeInsets.only(bottom: 20.0),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      width: 90.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/img/icono_logo.jpg"),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${list[i]['nombre_evento']}",
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: [
                              Icon(Icons.event_note),
                              Text(
                                "Fecha: ${list[i]['fecha_evento']}            ",
                                style: TextStyle(fontSize: 12.0),
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              Icon(Icons.access_time),
                              Text(
                                "Hora: ${list[i]['hora_evento']}",
                                style: TextStyle(fontSize: 12.0),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "Ubicacion: ${list[i]['ubicacion']}",
                            style: TextStyle(
                                fontSize: 11.0, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
