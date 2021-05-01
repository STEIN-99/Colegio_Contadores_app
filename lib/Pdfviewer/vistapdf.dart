import 'package:ccpt_movil/Pdfviewer/MyClipper.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Vpdf extends StatefulWidget {
  @override
  _VpdfState createState() => new _VpdfState();
}

class _VpdfState extends State<Vpdf> {
  String url = 'ccptab.com/biblioteca/index.html';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ClipPath(
              clipper: MyClipper(),
              child: Container(
                padding: EdgeInsets.only(top: 40),
                height: 380,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 20.0),
                      margin: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 20.0),
                      height: 190,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF080808),
                            blurRadius: 8,
                          ),
                        ],
                      ),
                      child: Row(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "¡Hola!",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                ),
                              ),
                              Text(
                                "bienvenido a nuestra  ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                "Biblioteca.",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          Image.asset(
                            'assets/img/Libros.jpg',
                            fit: BoxFit.fitWidth,
                            width: 170,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Recientes.",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  BookCard(
                    title: "Harry Potter",
                    subtitle: "Part 1",
                    autor: "Nombre de autor    ",
                    fecha: "20/09/2020",
                    imgUrl: 'assets/img/biblioteca2.jpg',
                  ),
                  BookCard(
                    title: "Harry Potter",
                    subtitle: "Part 1",
                    autor: "Nombre de autor    ",
                    fecha: "20/09/2020",
                    imgUrl: 'assets/img/biblioteca2.jpg',
                  ),
                  BookCard(
                    title: "Harry Potter",
                    subtitle: "Part 1",
                    autor: "Nombre de autor    ",
                    fecha: "20/09/2020",
                    imgUrl: 'assets/img/biblioteca2.jpg',
                  ),
                  BookCard(
                    title: "Harry Potter",
                    subtitle: "Part 1",
                    autor: "Nombre de autor    ",
                    fecha: "20/09/2020",
                    imgUrl: 'assets/img/biblioteca2.jpg',
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

class BookCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String autor;
  final String fecha;
  final String imgUrl;
  const BookCard({
    Key key,
    this.title,
    this.subtitle,
    this.autor,
    this.fecha,
    this.imgUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        height: 170,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 8,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Icon(Icons.person),
                    Text(
                      autor,
                      style: TextStyle(fontSize: 12.0),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Icon(Icons.date_range),
                    Text(
                      fecha,
                      style: TextStyle(fontSize: 12.0),
                    ),
                  ],
                ),
              ],
            ),
            Image.asset(
              imgUrl,
              width: 100.0,
              height: 125.0,
              fit: BoxFit.cover,
            ),
          ],
        ),
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
