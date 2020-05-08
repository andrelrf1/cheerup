import 'package:flutter/material.dart';
import 'utils/favorites_card.dart';
import 'utils/user_info.dart';

class User extends StatelessWidget {
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
                padding: EdgeInsets.symmetric(vertical: 50),
                child: UserInfo(),
              ),
              FavoritesCard()
            ],
          ),
        ),
      ),
    );
  }
}
