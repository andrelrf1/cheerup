import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // nos envia para próxima tela de acordo com rota que colocamos no main
  void _nextScreen() {
    Navigator.pushReplacementNamed(context, '/LogIn');
  }

  // controla o tempo da splash screen
  Future<Timer> _splashTimer() async {
    var tempo = Duration(seconds: 5);
    return Timer(tempo, _nextScreen);
  }

  // quando a tela for iniciada iniciará o _splashTimer
  @override
  void initState() {
    super.initState();
    _splashTimer();
  }

  @override
  Widget build(BuildContext context) {
    // Oculta a barra de notificações da tela
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return Scaffold(
      body: Center(
        child: Text(
          'CheerUP',
          style: TextStyle(
            color: Colors.cyan,
            fontSize: 45,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}
