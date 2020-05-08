import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircleAvatar(
          radius: 80,
        ),
        SizedBox(
          height: 50,
        ),
        Text(
          'Nome do usuário',
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.normal,
            fontSize: 26
          ),
        )
      ],
    );
  }
}
