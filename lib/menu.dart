import 'package:ccpt_movil/Eventos/eventos.dart';
import 'package:ccpt_movil/Galeria/img.dart';
import 'package:ccpt_movil/Menu-other/Contacto.dart';
import 'package:ccpt_movil/Menu-other/conocenos.dart';
import 'package:ccpt_movil/Noticias/noticias.dart';

import 'package:ccpt_movil/Pages/Eventos.dart';
import 'package:ccpt_movil/Pdfviewer/document.dart';
import 'package:ccpt_movil/pag/galeria.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'Pages/Inicio.dart';
import 'Pdfviewer/vistapdf.dart';

void main() => runApp(Principal());

class Principal extends StatefulWidget {
  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  int _pageIndex = 0;

  final Home _serv = Home();
  final Galeria _galeria = Galeria();
  final Eventos _eventos = Eventos();
  final Vpdf _vpdf = Vpdf();

  Widget _showserv = new Home();

  Widget _pagechooser(int page) {
    switch (page) {
      case 0:
        return _serv;
        break;
      case 1:
        return _galeria;
        break;
      case 2:
        return _eventos;
        break;
      case 3:
        return _vpdf;
        break;
      default:
        return new Container(
          child: new Center(
            child: new Text(
              'data',
              style: new TextStyle(fontSize: 30),
            ),
          ),
        );
    }
  }

  String url = 'www.ccptab.com/';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('CCPT Móvil'),
        actions: <Widget>[
          new IconButton(
              icon: Icon(Icons.public_outlined, color: Colors.white),
              onPressed: () {
                _launcherUrl('http://$url');
              }),
        ],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            //Header
            new UserAccountsDrawerHeader(
              accountName: Text('Colegio de Contadores Públicos'),
              accountEmail: Text('del Estado de Tabasco, AC'),
              decoration: new BoxDecoration(
                image: DecorationImage(
                    image: new AssetImage("assets/img/banner_menu.png"),
                    fit: BoxFit.cover),
              ),
            ),
            //Body
            Ink(
              color: Colors.indigo,
              child: new ListTile(
                title: Text(
                  "Inicio",
                  style: TextStyle(color: Colors.white),
                ),
                trailing: new Icon(Icons
                    .home), /*
              onTap: () => Navigator.of(context).push(
              new MaterialPageRoute(
                builder:(BuildContext context) => new Principal()),
            ),*/
              ),
            ),
            Divider(),
            new ListTile(
              title: Text("Mi sesión"),
              trailing: new Icon(Icons
                  .person), /*
            onTap: () => Navigator.of(context).push(
              new MaterialPageRoute(
                builder:(BuildContext context) => new Login()),
            ),*/
            ),
            Divider(),
            new ListTile(
              title: Text("Afíliate"),
              trailing: new Icon(Icons.contacts),
              onTap: () => Navigator.of(context).push(
                new MaterialPageRoute(
                    builder: (BuildContext context) => new Pagepdf()),
              ),
            ),
            Divider(),
            new ListTile(
              title: Text("Eventos"),
              trailing: new Icon(Icons.insert_invitation),
              onTap: () => Navigator.of(context).push(
                new MaterialPageRoute(
                    builder: (BuildContext context) => new Eventos1()),
              ),
            ),
            Divider(),
            new ListTile(
              title: Text("Noticias"),
              trailing: new Icon(Icons.volume_up),
              onTap: () => Navigator.of(context).push(
                new MaterialPageRoute(
                    builder: (BuildContext context) => new Noticias()),
              ),
            ),
            Divider(),
            new ListTile(
              title: Text("Galería de socios"),
              trailing: new Icon(Icons.image),
              onTap: () => Navigator.of(context).push(
                new MaterialPageRoute(
                    builder: (BuildContext context) => new Imagen()),
              ),
            ),
            Divider(),
            new ListTile(
              title: Text("Contáctanos"),
              trailing: new Icon(Icons.location_on),
              onTap: () => Navigator.of(context).push(
                new MaterialPageRoute(
                    builder: (BuildContext context) => new Ubicacion()),
              ),
            ),
            Divider(),
            new ListTile(
              title: Text("Conocenos"),
              trailing: new Icon(Icons.help_outline),
              onTap: () => Navigator.of(context).push(
                new MaterialPageRoute(
                    builder: (BuildContext context) => new Conoce()),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: _showserv,
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        items: <Widget>[
          Icon(
            Icons.home,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.collections,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.event,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.library_books_rounded,
            size: 30,
            color: Colors.white,
          ),
        ],
        color: Colors.blue[900],
        buttonBackgroundColor: Colors.blue[900],
        backgroundColor: Colors.transparent,
        animationCurve: Curves.decelerate,
        animationDuration: Duration(milliseconds: 600),
        height: 60.0,
        index: _pageIndex,
        onTap: (int tappedIndex) {
          setState(() {
            _showserv = _pagechooser(tappedIndex);
          });
        },
      ),
    );
  }
}

void _launcherUrl(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launce $url';
  }
}
