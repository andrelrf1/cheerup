import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'utils/login_form.dart';

class LogIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // retorna a barra de notificação
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'CheerUP',
            style: TextStyle(
                color: Colors.cyan, fontSize: 45, fontWeight: FontWeight.bold),
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
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
