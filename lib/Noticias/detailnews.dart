import 'package:ccpt_movil/Eventos/eventos.dart';
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
    var url = "http://ccptab.com/Movil/Noticias.php";
    http.post(url,
        body: {'id_noticia': widget.list[widget.index]['id_noticia']});
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
              builder: (BuildContext context) => new Eventos1(),
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
        title: new Text("${widget.list[widget.index]['nombre_noticia']}"),
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
                  widget.list[widget.index]['nombre_noticia'],
                  style: new TextStyle(fontSize: 30.0),
                ),
                Divider(),
                Divider(),
                Divider(),
                new Text(
                  "Noticias: ${widget.list[widget.index]['detalles_noticia']}",
                  style: new TextStyle(fontSize: 18.0),
                  textAlign: TextAlign.justify,
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
