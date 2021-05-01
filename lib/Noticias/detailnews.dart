import 'package:colegio_app/Eventos/eventos.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Detailnot extends StatefulWidget {
  List list;
  int index;
  Detailnot({this.index, this.list});
  @override
  _Detailnot createState() => new _Detailnot();
}

class _Detailnot extends State<Detailnot> {
  void deleteData() {
    var url = "http://10.0.2.2/Proyectos/CCP/conexiones/Eventos/deleteData.php";
    http.post(url, body: {'ID_FECHA': widget.list[widget.index]['ID_FECHA']});
  }

  void confirm() {
    AlertDialog alertDialog = new AlertDialog(
      content: new Text(
          "Esta seguto de eliminar '${widget.list[widget.index]['NOMBRE']}'"),
      actions: <Widget>[
        new RaisedButton(
          child: new Text(
            "OK Eliminado!",
            style: new TextStyle(color: Colors.black),
          ),
          color: Colors.red,
          onPressed: () {
            deleteData();
            Navigator.of(context).push(new MaterialPageRoute(
              builder: (BuildContext context) => new Eventos(),
            ));
          },
        ),
        new RaisedButton(
          child:
              new Text("CANCELAR", style: new TextStyle(color: Colors.black)),
          color: Colors.green,
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );

    showDialog(context: context, child: alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("${widget.list[widget.index]['NOMBRE']}"),
        backgroundColor: Colors.blue[900],
      ),
      body: new Container(
        height: 550.0,
        padding: const EdgeInsets.all(10.0),
        child: new Card(
          child: new Center(
            child: new Column(
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                ),
                new Text(
                  widget.list[widget.index]['NOMBRE'],
                  style: new TextStyle(fontSize: 30.0),
                ),
                Divider(),
                Divider(),
                Divider(),
                new Text(
                  "Noticias: ${widget.list[widget.index]['DESCRI']}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                new Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                ),
                new Text(
                  "Fecha: ${widget.list[widget.index]['FECHA']}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                new Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
