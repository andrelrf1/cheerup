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
  @override
  Widget build(BuildContext context) {
    // retorna a barra de notificação
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    return SafeArea(
      child: Scaffold(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Não possui uma conta?',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                  ),
                ),
                FlatButton(
                  child:
                      Text('Clique aqui', style: TextStyle(color: Colors.blue)),
                  onPressed: () {
                    Navigator.pushNamed(context, '/SignIn');
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
