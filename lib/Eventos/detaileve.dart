import 'package:ccpt_movil/Pdfviewer/MyClipper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Detaieve extends StatefulWidget {
  List list;
  int index;
  Detaieve({this.index, this.list});
  @override
  _Detaieve createState() => new _Detaieve();
}

class _Detaieve extends State<Detaieve> {
  void deleteData() {
    var url = "http://ccptab.com/Movil/Eventos.php";
    http.post(url, body: {'id_evento': widget.list[widget.index]['id_evento']});
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("${widget.list[widget.index]['nombre_evento']}"),
        backgroundColor: Colors.blue[900],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ClipPath(
              clipper: MyClipper(),
              child: Container(
                padding: EdgeInsets.only(top: 40),
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      Colors.blue,
                      Colors.blue[900],
                      Colors.blue,
                    ],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: Text(
                        widget.list[widget.index]['nombre_evento'],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 3,
                  )
                ],
              ),
              child: Column(
                children: <Widget>[
                  Text(
                    "Detalles del evento: ${widget.list[widget.index]['detalle_evento']} \n",
                    style: new TextStyle(fontSize: 23.0),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: [
                      Icon(Icons.event_note),
                      Text(
                        "Fecha: ${widget.list[widget.index]['fecha_evento']}         ",
                        style: TextStyle(fontSize: 17.0),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Icon(Icons.access_time),
                      Text(
                        "Hora : ${widget.list[widget.index]['hora_evento']}",
                        style: TextStyle(fontSize: 17.0),
                      ),
                    ],
                  ),
                  Text(
                    "\nUbicacion: ${widget.list[widget.index]['ubicacion']}",
                    style: new TextStyle(fontSize: 21.0),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
