import 'package:ccpt_movil/pag/ceritificados.dart';
import 'package:ccpt_movil/pag/cursos.dart';
import 'package:ccpt_movil/pag/quienes.dart';
import 'package:ccpt_movil/pag/reuniones.dart';
import 'package:ccpt_movil/pag/servicios.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return new ListView(
      children: <Widget>[
        new Image.asset("assets/img/sliderimg2.png"),
        new Container(
          padding: const EdgeInsets.all(1.0),
          // Un padding para todo
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            margin: EdgeInsets.all(9),
            elevation: 10,

            // Dentro de esta propiedad usamos ClipRRect
            child: ClipRRect(
              // Los bordes del contenido del card se cortan usando BorderRadius

              borderRadius: BorderRadius.circular(15),

              // EL widget hijo que será recortado segun la propiedad anterior
              child: Column(
                children: <Widget>[
                  // Usamos el widget Image para mostrar una imagen
                  Image(
                    // Como queremos traer una imagen desde un url usamos NetworkImage
                    image: NetworkImage(
                        'http://www.ccptab.com/imagenes/Galeria1.jpg'),
                  ),
                  ListTile(
                    onTap: () => Navigator.of(context).push(
                      new MaterialPageRoute(
                          builder: (BuildContext context) => new Quienes()),
                    ),
                    title: Text('¿Quienes somos? \n',
                        style: TextStyle(fontWeight: FontWeight.w500)),
                    subtitle: Text(
                        'Somos una agrupación que alberga a los contadores públicos que ejercen su profesión en el estado de Tabasco... \n'),
                    leading: Icon(
                      Icons.person,
                      color: Colors.blue[500],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        //
        //
        //
        //
        //
        //
        new Container(
          padding: const EdgeInsets.all(1.0), // Un padding para todo
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            margin: EdgeInsets.all(9),
            elevation: 10,

            // Dentro de esta propiedad usamos ClipRRect
            child: ClipRRect(
              // Los bordes del contenido del card se cortan usando BorderRadius

              borderRadius: BorderRadius.circular(30),

              // EL widget hijo que será recortado segun la propiedad anterior
              child: Column(
                children: <Widget>[
                  // Usamos el widget Image para mostrar una imagen
                  Image(
                    // Como queremos traer una imagen desde un url usamos NetworkImage
                    image: NetworkImage(
                        'http://www.ccptab.com/imagenes/curso2.png'),
                  ),
                  ListTile(
                    onTap: () => Navigator.of(context).push(
                      new MaterialPageRoute(
                          builder: (BuildContext context) => new Cursos()),
                    ),
                    title: Text('Cursos \n',
                        style: TextStyle(fontWeight: FontWeight.w500)),
                    subtitle: Text(
                        'Nuestros cursos son de alta calidad con información actualizada con expositores de talla nacional y muy concurrido... \n'),
                    leading: Icon(
                      Icons.import_contacts,
                      color: Colors.blue[500],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        //
        //
        //
        //
        //
        //
        new Container(
          padding: const EdgeInsets.all(1.0), // Un padding para todo
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            margin: EdgeInsets.all(9),
            elevation: 10,

            // Dentro de esta propiedad usamos ClipRRect
            child: ClipRRect(
              // Los bordes del contenido del card se cortan usando BorderRadius

              borderRadius: BorderRadius.circular(30),

              // EL widget hijo que será recortado segun la propiedad anterior
              child: Column(
                children: <Widget>[
                  // Usamos el widget Image para mostrar una imagen
                  Image(
                    // Como queremos traer una imagen desde un url usamos NetworkImage
                    image: NetworkImage(
                        'http://www.ccptab.com/imagenes/conjuntar.png'),
                  ),
                  ListTile(
                    onTap: () => Navigator.of(context).push(
                      new MaterialPageRoute(
                          builder: (BuildContext context) => new Certifi()),
                    ),
                    title: Text('Certificados \n',
                        style: TextStyle(fontWeight: FontWeight.w500)),
                    subtitle: Text(
                        'Es importante ser colegiado ya que a través de esta organización como contador publico puedes obtener tu certificado de idoneidad... \n'),
                    leading: Icon(
                      Icons.border_color,
                      color: Colors.blue[500],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        //
        //
        //
        //
        //
        //
        new Container(
          padding: const EdgeInsets.all(1.0), // Un padding para todo
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            margin: EdgeInsets.all(9),
            elevation: 10,

            // Dentro de esta propiedad usamos ClipRRect
            child: ClipRRect(
              // Los bordes del contenido del card se cortan usando BorderRadius

              borderRadius: BorderRadius.circular(30),

              // EL widget hijo que será recortado segun la propiedad anterior
              child: Column(
                children: <Widget>[
                  // Usamos el widget Image para mostrar una imagen
                  Image(
                    // Como queremos traer una imagen desde un url usamos NetworkImage
                    image: NetworkImage(
                        'http://www.ccptab.com/imagenes/capacitacion.png'),
                  ),
                  ListTile(
                    onTap: () => Navigator.of(context).push(
                      new MaterialPageRoute(
                          builder: (BuildContext context) => new Reunion()),
                    ),
                    title: Text('Reuniones técnicas \n',
                        style: TextStyle(fontWeight: FontWeight.w500)),
                    subtitle: Text(
                        'En nuestro colegio nos reunimos una vez al mes para llevar a cabo reuniones técnicas en donde todos los socios... \n'),
                    leading: Icon(
                      Icons.group,
                      color: Colors.blue[500],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        //
        //
        //
        //
        //
        //
        new Container(
          padding: const EdgeInsets.all(1.0), // Un padding para todo
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            margin: EdgeInsets.all(9),
            elevation: 10,

            // Dentro de esta propiedad usamos ClipRRect
            child: ClipRRect(
              // Los bordes del contenido del card se cortan usando BorderRadius

              borderRadius: BorderRadius.circular(30),

              // EL widget hijo que será recortado segun la propiedad anterior
              child: Column(
                children: <Widget>[
                  // Usamos el widget Image para mostrar una imagen
                  Image(
                    // Como queremos traer una imagen desde un url usamos NetworkImage
                    image: NetworkImage(
                        'http://www.ccptab.com/imagenes/reuniontecnica.jpg'),
                  ),
                  ListTile(
                    onTap: () => Navigator.of(context).push(
                      new MaterialPageRoute(
                          builder: (BuildContext context) => new Servi()),
                    ),
                    title: Text(
                        'Servicios sociales, prácticas profesionales y estadías \n',
                        style: TextStyle(fontWeight: FontWeight.w500)),
                    subtitle: Text(
                        'Nuestro colegio al tener como objetivo velar por la capacitación, actualización y calidad de servicios en la contaduría publica...\n'),
                    leading: Icon(
                      Icons.folder_shared,
                      color: Colors.blue[500],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        //
        //
        //
        //
        //
        //
      ],
    );
  }
}
