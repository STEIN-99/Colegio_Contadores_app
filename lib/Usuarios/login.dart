/*import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => new _LoginState();
}

class _LoginState extends State<Login> {

String username='';
 
@override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: 'Inicio de sesión',
         home: new MyHomePage(),
        routes: <String,WidgetBuilder>{
        '/principal':(BuildContext context) => new Principal(),
        '/perfil':(BuildContext context) => new Perfil(),
        '/MyHomePage': (BuildContext context)=> new MyHomePage(),
      },
      ),
    );
  }
}*/

import 'dart:async';
import 'dart:convert';

import 'package:colegio_app/Usuarios/perfil.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../menu.dart';

void main() => runApp(new Login());

String username = '';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Inicio de sesión',
      home: new MyHomePage(),
      routes: <String, WidgetBuilder>{
        '/principal': (BuildContext context) => new Principal(),
        '/perfil': (BuildContext context) => new Perfil(),
        '/MyHomePage': (BuildContext context) => new MyHomePage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController user = new TextEditingController();
  TextEditingController pass = new TextEditingController();

  String msg = '';

  Future<List> _login() async {
    final response = await http.post(
        "http://10.0.2.2/Proyectos/CCP/conexiones/validar_usuario.php",
        body: {
          "NAME": user.text,
          "PASS": pass.text,
        });

    var datauser = json.decode(response.body);

    if (datauser.length == 0) {
      setState(() {
        msg = "Usuario o contraseña incorretos";
      });
    } else {
      if (datauser[0]['TY'] == 'socio') {
        Navigator.pushReplacementNamed(context, '/principal');
      } else if (datauser[0]['TY'] == 'presidente') {
        Navigator.pushReplacementNamed(context, '/perfil');
      }

      setState(() {
        username = datauser[0]['NAME'];
      });
    }

    return datauser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inicio de sesión"),
        backgroundColor: Colors.blue[900],
      ),
      resizeToAvoidBottomPadding: false,
      body: Form(
        child: Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
                image: new AssetImage("assets/img/9.png"), fit: BoxFit.cover),
          ),
          child: Column(
            children: <Widget>[
              new Container(
                padding: EdgeInsets.only(top: 1.0),
                child: new CircleAvatar(
                  backgroundColor: Color(0xF81F7F3),
                  child: new Image(
                    width: 155,
                    height: 155,
                    image: new AssetImage("assets/img/xx.png"),
                  ),
                ),
                width: 230.0,
                height: 230.0,
                decoration: BoxDecoration(shape: BoxShape.circle),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(top: 1),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      padding: EdgeInsets.only(
                          top: 4, left: 16, right: 16, bottom: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.black12, blurRadius: 5)
                          ]),
                      child: TextFormField(
                        controller: user,
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.email,
                              color: Colors.black,
                            ),
                            hintText: 'Usuario'),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: 50,
                      margin: EdgeInsets.only(top: 32),
                      padding: EdgeInsets.only(
                          top: 4, left: 16, right: 16, bottom: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.black12, blurRadius: 5)
                          ]),
                      child: TextField(
                        controller: pass,
                        obscureText: true,
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.vpn_key,
                              color: Colors.black,
                            ),
                            hintText: 'Contraseña'),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 6,
                          right: 32,
                        ),
                      ),
                    ),
                    Spacer(),
                    RaisedButton(
                      child: new Text("Iniciar sesión"),
                      color: Colors.blue[900],
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                      onPressed: () {
                        _login();
                      },
                    ),
                    Text(msg,
                        style: TextStyle(fontSize: 25.0, color: Colors.red)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
