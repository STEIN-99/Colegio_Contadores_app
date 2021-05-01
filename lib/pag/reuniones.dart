import 'package:flutter/material.dart';

class Reunion extends StatefulWidget {
  @override
  _ReunionState createState() => new _ReunionState();
}

class _ReunionState extends State<Reunion> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(),
      body: Center(
        child: CustomCard(),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ListView(
      children: <Widget>[
        new Lista(
            gambar: "http://ccptab.com/imagenes/logoelegante.png",
            judul: "Reuniones técnicas",
            tex:
                "En nuestro colegio nos reunimos una vez al mes para llevar a cabo reuniones técnicas en donde todos los socios compartimos nuestras experiencias y vivencias en los que se platican de temas prácticos de lo que sucede en el desarrollo de nuestro trabajo. \n\nComparten experiencias entre socios y nuevos socios, así como también en ocasiones invitan a diferentes autoridades que tiene que ver con nuestro actuar profesional para que nos platiquen de las innovaciones que suceden día a día en materia de la contaduría pública.\n"),
      ],
    );
  }
}

class Lista extends StatelessWidget {
  Lista({this.gambar, this.judul, this.tex});

  final String gambar;
  final String judul;
  final String tex;

  @override
  Widget build(BuildContext context) {
    return new Card(
      child: new Column(
        children: <Widget>[
          new Image(
            image: new NetworkImage(gambar),
            width: 400.0,
          ),
          new Container(
            padding: const EdgeInsets.all(1.0),
            child: Card(
              child: Column(
                children: [
                  new Padding(
                    padding: const EdgeInsets.only(top: 2.0),
                  ),
                  new Text(
                    judul,
                    style: new TextStyle(fontSize: 25.0),
                  ),
                  Divider(),
                  new Text(
                    tex,
                    style: new TextStyle(fontSize: 20.0),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
