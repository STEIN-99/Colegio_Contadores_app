import 'package:flutter/material.dart';

class Galeria extends StatefulWidget {
  @override
  _GaleriaState createState() => _GaleriaState();
}

class _GaleriaState extends State<Galeria> {
  List<Container> listcon = new List();

  var data = [
    {
      'nombre': 'Javier Rodriguez Izquiedo',
      'tiulo': 'Contador Público Certificado',
      'imgen': 'preside.png'
    },
    {
      'nombre': 'Gabierl Martínez Cadena',
      'tiulo': 'Contador Público Certificado',
      'imgen': 'gabriel2.jpg'
    },
    {
      'nombre': 'Josefina Cabal Ferrats',
      'tiulo': 'Contador Público Certificado',
      'imgen': 'josefina2.png'
    },
    {
      'nombre': 'Sebastián López Méndez',
      'tiulo': 'Contador Público Certificado',
      'imgen': 'sebastianlopez.png'
    },
  ];

  _listItem() async {
    for (var i = 0; i < data.length; i++) {
      final list = data[i];
      final String imgen = list['imgen'];
      listcon.add(
        Container(
          child: new Card(
            elevation: 2.0,
            color: Colors.blue[900],
            child: Container(
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.yellow[600])),
              padding: EdgeInsets.all(5.0),
              margin: EdgeInsets.all(5.0),
              child: new ListView(
                children: <Widget>[
                  Padding(
                      child: Image.asset(
                        'assets/pres/$imgen',
                        fit: BoxFit.cover,
                      ),
                      padding: EdgeInsets.only(bottom: 5.0)),
                  Wrap(children: <Widget>[
                    Padding(
                        child: Text(
                          'nombre',
                          style: new TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.right,
                        ),
                        padding: EdgeInsets.all(1.0)),
                  ]),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }

  @override
  void initState() {
    _listItem();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(crossAxisCount: 2, children: listcon);
  }
}
