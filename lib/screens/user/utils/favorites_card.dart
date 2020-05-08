import 'package:flutter/material.dart';

class FavoritesCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      fit: StackFit.passthrough,
      overflow: Overflow.visible,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: <Widget>[
              SizedBox(
                width: double.infinity,
                height: 30,
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Wrap(
                    runAlignment: WrapAlignment.center,
                    direction: Axis.horizontal,
                    alignment: WrapAlignment.start,
                    runSpacing: 20,
                    // espaçamento entre ao lado dos itens
                    spacing: 10,
                    // espaçamento abaixo dos itens
                    children: <Widget>[
                      Container(
                        color: Colors.red,
                        width: 100,
                        height: 200,
                      ),
                      Container(
                        color: Colors.red,
                        width: 100,
                        height: 200,
                      ),
                      Container(
                        color: Colors.red,
                        width: 100,
                        height: 200,
                      ),
                      Container(
                        color: Colors.red,
                        width: 100,
                        height: 200,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: 137,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(),
                  Text(
                    'Favoritos',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.normal,
                        fontSize: 26),
                  ),
                  SizedBox(),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
