import 'package:flutter/material.dart';

class Alert extends StatelessWidget {
  BuildContext context;
  String titulo;
  String mensagem;
  String buttonText;
  Function function;

  Alert({
    this.context,
    this.titulo,
    this.mensagem,
    this.buttonText,
    this.function,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 24,
      title: Text(titulo),
      content: Text(mensagem),
      actions: <Widget>[
        FlatButton(
          child: Text(buttonText),
          onPressed: function != null
              ? function
              : () {
                  Navigator.of(context).pop();
                },
        )
      ],
    );
  }
}
