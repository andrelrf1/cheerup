import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Definições',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ListTile(
                title: Text('Teste'),
                onTap: () {},
              ),
              Divider(
                height: 0,
                indent: 10,
                endIndent: 10,
              ),
              ListTile(
                title: Text('Teste 2'),
                onTap: () {},
              ),
            ],
          ),
        )
      ],
    );
  }
}
