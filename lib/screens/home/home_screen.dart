import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Início',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountEmail: Text(
                'example@example.com',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              accountName: Text(
                'Coisinha',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              currentAccountPicture: Icon(Icons.person),
              arrowColor: Colors.cyan,
            ),
            ListTile(
              leading: Icon(Icons.book),
              title: Text('Diário'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Configurações'),
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
