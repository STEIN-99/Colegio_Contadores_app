import 'package:flutter/material.dart';

class Conoce extends StatefulWidget {
  @override
  _ConoceState createState() => new _ConoceState();
}

class _ConoceState extends State<Conoce> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Conocenos"),
        backgroundColor: Colors.blue[900],
      ),
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
            judul: "Historia",
            tex:
                "El Colegio de Contadores Públicos del Estado de Tabasco, nace el 14 de junio de 1978, en la ciudad de Villahermosa, Tabasco, siendo el primer organismo colegiado de esta profesión en la entidad, y se afilia en esas fechas al instituto mexicano de contadores públicos, A.C., más sin embargo en 1992, decide separarse de este organismo para incorporarse a la federación nacional de la asociación mexicana de colegio de contadores públicos, A.C., las oficinas están ubicadas en la Calle Blanca Mariposas número 133, Fraccionamiento Real del Ángel, Villahermosa, Tabasco, está a cargo del C.P.C Javier Rodríguez Izquierdo.\n"),
        new Lista(
            gambar: "",
            judul: "Misión",
            tex:
                "Captar contadores públicos del estado de Tabasco, capacitarlos y actualizarlos en las diferentes ramas de contaduría públicas.\n"),
        new Lista(
            gambar: "",
            judul: "Visión",
            tex:
                "Conjuntar profesionalitas de la contaduría pública con alta capacidad y actualización en el estado de Tabasco.\n"),
        new Lista(
            gambar: "",
            judul: "Servicios",
            tex:
                "El Colegio de Contadores Públicos del Estado de Tabasco, es una organización gubernamental que ofrece asesorías, capacitaciones y certificaciones a contadores públicos.\n"),
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
