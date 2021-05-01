import 'package:flutter/material.dart';

class Certifi extends StatefulWidget {
  @override
  _CertifiState createState() => new _CertifiState();
}

class _CertifiState extends State<Certifi> {
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
            judul: "Certificados",
            tex:
                "Es importante ser colegiado ya que a través de esta organización como contador público puedes obtener tu certificado de idoneidad, así como te puedes certificar en las diferentes diciplina de la contaduría pública, así mismo a través de nuestro colegio puedes obtener cada año una norma de actualización académica lo cual es un requisito para poder aspirar a la certificación de idoneidad.\n"),
        new Lista(
            gambar: "",
            judul: "Tipos de certificados que se emiten en el colegio",
            tex:
                "1.Certificados de idoneidad. \n 2.Certificados por disciplina.\n"),
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
