import 'package:flutter/material.dart';

class FavoritesCard extends StatelessWidget {
  String titulo;

  FavoritesCard({this.titulo});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 3,
            horizontal: 20,
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              titulo,
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
              Padding(
                padding: EdgeInsets.all(20),
                child: Wrap(
                  runAlignment: WrapAlignment.center,
                  direction: Axis.horizontal,
                  alignment: WrapAlignment.start,
                  // espaçamento abaixo dos itens:
                  runSpacing: 20,
                  // espaçamento entre ao lado dos itens:
                  spacing: 20,
                  children: <Widget>[
                    // Usar inkWell nesses itens
                    Container(
                      color: Colors.red,
                      width: 104,
                      height: 185,
                    ),
                    Container(
                      color: Colors.red,
                      width: 104,
                      height: 185,
                    ),
                    Container(
                      color: Colors.red,
                      width: 104,
                      height: 185,
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: MaterialButton(
                  child: Text(
                    'Visualizar tudo',
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.normal),
                  ),
                  minWidth: double.infinity,
                  onPressed: () {},
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
