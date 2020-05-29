import 'package:flutter/material.dart';
import 'components/favorites_card.dart';
import 'components/user_info.dart';
import 'components/options_card.dart';
import 'components/user_settings.dart';

class User extends StatefulWidget {
  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.grey,
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.yellow[600], Colors.blue[200]],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 60),
                child: UserInfo(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Options(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15, right: 5, left: 5),
                child: FavoritesCard(
                  titulo: 'Filmes',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15, right: 5, left: 5),
                child: FavoritesCard(
                  titulo: 'Músicas',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15, right: 5, left: 5),
                child: FavoritesCard(
                  titulo: 'Séries',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15, right: 5, left: 5),
                child: Settings(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
