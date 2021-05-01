import 'package:flutter/material.dart';

class Servi extends StatefulWidget {
  @override
  _ServiState createState() => new _ServiState();
}

class _ServiState extends State<Servi> {
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
            judul: "Servicios sociales, prácticas profesionales y estadías",
            tex:
                "Nuestro colegio al tener como objetivo velar por la capacitación, actualización y calidad de servicios en la contaduría pública apoya a los estudiantes de esta profesión al darles la oportunidad de realizar en los despachos de nuestros socios servicios sociales, prácticas profesionales y estadías con el fin de poner en práctica los conocimientos adquiridos en el aula así mismo se les brinda un ambiente de confianza y la información necesaria para que ellos puedan realizar sus productos de esos trabajos.\n"),
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
