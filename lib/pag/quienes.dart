import 'package:flutter/material.dart';

class Quienes extends StatefulWidget {
  @override
  _QuienesState createState() => new _QuienesState();
}

class _QuienesState extends State<Quienes> {
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
            judul: "¿Quienes somos?",
            tex:
                "Somos una agrupación que alberga a los contadores públicos que ejercen su profesión en el estado de Tabasco, con el objetivo común de capacitarnos y actualizarnos día a día con el afán de que nuestros servicios profesionales reúnan los mayores estándares de calidad y así mismo realizar estudios que sean innovadores en beneficio a nuestro proteger. \n"),
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
