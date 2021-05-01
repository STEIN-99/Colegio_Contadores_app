import 'package:firebase_messaging/firebase_messaging.dart';
import 'dart:io';
import 'dart:async';

class Push {
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  final _mensajesStreamController = StreamController<String>.broadcast();
  Stream<String> get mensajes => _mensajesStreamController.stream;

  initNotificarions() {
    _firebaseMessaging.requestNotificationPermissions();

    _firebaseMessaging.getToken().then((token) {
      print('Token');
      print(token);
      //f2nPzdZhR5mozygO9FT2XK:APA91bFphHYOXjTIHHSA4NNiZ-BmxmY1Q-IgTy7fbpZHvQ4X87ritZZow0715UMFlaq84PrnaAy_-i12O0W4i_ojTjGGdjblKhHL2X8MGXWizEvLNh4jISp03MiepoSL3PFxTCGg_bJp
    });

    _firebaseMessaging.configure(onMessage: (info) {
      print('=========== on message =======');
      print(info);

      String argumento = 'no-data';
      if (Platform.isAndroid) {
        argumento = info['data']['comida'] ?? 'no-data';
      }

      _mensajesStreamController.sink.add(argumento);
    }, onLaunch: (info) {
      print('=========== on Launch =======');
      print(info);
    }, onResume: (info) {
      print('=========== on Resume =======');
      print(info);
      //final noti = info['data']['comida'];
      //print(noti);
    });
  }

  dispose() {
    _mensajesStreamController?.close();
  }
}
