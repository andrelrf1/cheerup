import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircleAvatar(
          backgroundColor: Colors.grey[300],
          child: Icon(
            Icons.person_outline,
            size: 50,
          ),
          radius: 80,
        ),
        SizedBox(
          height: 60,
        ),
        Text(
          'Nome do usuário',
          style: TextStyle(
              color: Colors.grey, fontWeight: FontWeight.normal, fontSize: 26),
        )
      ],
    );
  }
}
