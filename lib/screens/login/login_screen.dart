import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'utils/login_form.dart';
//import '../user/user_screen.dart';
import '../signin/signin_screen.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  void _goToSignIn() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SignIn(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // retorna a barra de notificação
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // coloca os itens ao centro
        // alguns widgets tem a propriedade children que suporta vários widgets
        children: <Widget>[
          Text(
            'CheerUP',
            style: TextStyle(
              color: Colors.cyan,
              fontSize: 45,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          LogInForm(),
          FlatButton(
            child: Text(
              'Não possui uma conta?',
              style: TextStyle(
                fontWeight: FontWeight.normal,
              ),
            ),
            onPressed: () {
              _goToSignIn();
            },
          )
        ],
      ),
    );
  }
}
