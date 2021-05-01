import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;

void main() => runApp(Imagen());

class Imagen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Galería de socios"),
        backgroundColor: Colors.blue[900],
      ),
      body: new Center(
        //FutureBuilder is a widget that builds itself based on the latest snapshot
        // of interaction with a Future.
        child: new FutureBuilder<List<Spacecraft>>(
          future: downloadJSON(),
          //we pass a BuildContext and an AsyncSnapshot object which is an
          //Immutable representation of the most recent interaction with
          //an asynchronous computation.
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Spacecraft> spacecrafts = snapshot.data;
              return new CustomListView(spacecrafts);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            //return  a circular progress indicator.
            return new CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

/////////////////////////////////////////////////////////////////////////////////////////////

class Spacecraft {
  final String id;
  final String name, app, apm, imageUrl, propellant, curriculum;

  Spacecraft({
    this.id,
    this.name,
    this.app,
    this.apm,
    this.imageUrl,
    this.propellant,
    this.curriculum,
  });

  factory Spacecraft.fromJson(Map<String, dynamic> jsonData) {
    return Spacecraft(
      id: jsonData['id_imagen'],
      name: jsonData['Nombre'],
      app: jsonData['Apepat'],
      apm: jsonData['Apemat'],
      propellant: jsonData['titulopro'],
      curriculum: jsonData['curriculum'],
      imageUrl: "http://ccptab.com/" + jsonData['ubicacion'],
    );
  }
}

class CustomListView extends StatelessWidget {
  final List<Spacecraft> spacecrafts;

  CustomListView(this.spacecrafts);

  Widget build(context) {
    return ListView.builder(
      itemCount: spacecrafts.length,
      itemBuilder: (context, int currentIndex) {
        return createViewItem(spacecrafts[currentIndex], context);
      },
    );
  }

  Widget createViewItem(Spacecraft spacecraft, BuildContext context) {
    return new ListTile(
        title: new Card(
          elevation: 5.0,
          child: new Container(
            decoration:
                BoxDecoration(border: Border.all(color: Colors.blue[600])),
            padding: EdgeInsets.all(30.0),
            margin: EdgeInsets.all(30.0),
            child: Column(
              children: <Widget>[
                Padding(
                  child: Image.network(spacecraft.imageUrl),
                  padding: EdgeInsets.only(bottom: 10.0),
                ),
                Wrap(children: <Widget>[
                  Padding(
                      child: Text(
                        spacecraft.name,
                        style: new TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.right,
                      ),
                      padding: EdgeInsets.all(1.0)),
                  Padding(
                      child: Text(
                        spacecraft.app,
                        style: new TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.right,
                      ),
                      padding: EdgeInsets.all(1.0)),
                  Padding(
                      child: Text(
                        spacecraft.apm,
                        style: new TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.right,
                      ),
                      padding: EdgeInsets.all(1.0)),
                  Divider(),
                  Padding(
                      child: Text(
                        spacecraft.propellant,
                        style: new TextStyle(fontStyle: FontStyle.italic),
                        textAlign: TextAlign.right,
                      ),
                      padding: EdgeInsets.all(1.0)),
                ]),
              ],
            ),
          ),
        ),
        onTap: () {
          //We start by creating a Page Route.
          //A MaterialPageRoute is a modal route that replaces the entire
          //screen with a platform-adaptive transition.
          var route = new MaterialPageRoute(
            builder: (BuildContext context) =>
                new SecondScreen(value: spacecraft),
          );
          //A Navigator is a widget that manages a set of child widgets with
          //stack discipline.It allows us navigate pages.
          Navigator.of(context).push(route);
        });
  }
}

//Future is n object representing a delayed computation.
Future<List<Spacecraft>> downloadJSON() async {
  final jsonEndpoint = "http://ccptab.com/Movil/galeria.php";

  final response = await get(jsonEndpoint);

  if (response.statusCode == 200) {
    List spacecrafts = json.decode(response.body);
    return spacecrafts
        .map((spacecraft) => new Spacecraft.fromJson(spacecraft))
        .toList();
  } else
    throw Exception('We were not able to successfully download the json data.');
}

class SecondScreen extends StatefulWidget {
  final Spacecraft value;

  SecondScreen({Key key, this.value}) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text('Socio  ${widget.value.name}'),
          backgroundColor: Colors.blue[900]),
      body: new Container(
        child: new Center(
          child: Column(
            children: <Widget>[
              Padding(
                child: new Text(
                  'Colegio de Contadores Públicos Del Estado de Tabasco',
                  style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20.0),
                  textAlign: TextAlign.center,
                ),
                padding: EdgeInsets.only(bottom: 20.0),
              ),
              Padding(
                //`widget` is the current configuration. A State object's configuration
                //is the corresponding StatefulWidget instance.
                child: Image.network('${widget.value.imageUrl}'),

                padding: EdgeInsets.all(5.0),
              ),
              Padding(
                child: new Text(
                  'Nombre: ${widget.value.name} ${widget.value.app} ${widget.value.apm}',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                padding: EdgeInsets.all(5.0),
              ),
              Padding(
                child: new Text(
                  'Título profesional: ${widget.value.propellant}',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                padding: EdgeInsets.all(5.0),
              ),
              Padding(
                child: new Text(
                  'Descripción: ${widget.value.curriculum}',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                padding: EdgeInsets.all(5.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
