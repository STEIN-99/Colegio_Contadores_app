import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Ubicacion extends StatefulWidget {
  @override
  _UbicacionState createState() => new _UbicacionState();
}

class _UbicacionState extends State<Ubicacion> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Ubicacion"),
        backgroundColor: Colors.blue[900],
      ),
      body: Center(
        child: CustomCard(),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  String email = 'eric.alexis0399@gmail.com', subject, body;

  @override
  Widget build(BuildContext context) {
    return new ListView(
      children: <Widget>[
        // Agregamos una imagen consumida desde internet
        new Image.asset("assets/img/mapa_img.png"),
        // Agregamos un contenedor para el texto
        new Container(
          padding: const EdgeInsets.all(1.0), // Un padding para todo
          child: Card(
            child: Column(
              children: [
                ListTile(
                  title: Text(
                      'C. Blancas Mariposas 133 Fracc Real del Angel Villahermosa',
                      style: TextStyle(fontWeight: FontWeight.w500)),
                  subtitle: Text('86153 Villahermosa, Tab.'),
                  leading: Icon(
                    Icons.home,
                    color: Colors.blue[500],
                  ),
                ),
                ListTile(
                  title: Text('Horario de 09:00am a 4:00pm',
                      style: TextStyle(fontWeight: FontWeight.w500)),
                  leading: Icon(
                    Icons.access_time,
                    color: Colors.blue[500],
                  ),
                ),
                ListTile(
                  title: Text('(993) 351 2673',
                      style: TextStyle(fontWeight: FontWeight.w500)),
                  leading: Icon(
                    Icons.contact_phone,
                    color: Colors.blue[500],
                  ),
                ),
                ListTile(
                  title: Text('ccpt2018@gmail.com'),
                  leading: Icon(
                    Icons.contact_mail,
                    color: Colors.blue[500],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: new Text(
                      'Contacte con nosotros',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'ccpt2018@gmail.com',
                    ),
                    onChanged: (newemail) => email = newemail,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Asunto',
                    ),
                    onChanged: (newsubject) => subject = newsubject,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Redactar correo',
                    ),
                    onChanged: (newbody) => body = newbody,
                  ),
                ),
                RaisedButton(
                  color: Colors.blue[900],
                  child: new Text(
                    'Enviar correo',
                    style: TextStyle(color: Colors.white),
                  ),
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                  onPressed: () {
                    _sendMail(email, subject, body);
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _sendMail(String email, String subject, String body) async {
    final url = 'mailto:$email?subject=$subject&body=$body';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launce $url';
    }
  }
}
