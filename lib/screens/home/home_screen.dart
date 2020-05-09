import 'package:cheerup/screens/diary/diary_screen.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: new BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [
                0.1,
                0.7
              ],
              colors: [
                Colors.cyanAccent,
                Colors.white,
              ]),
        ),
        // padding: EdgeInsets.only(top: 29.1),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 15,
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: 30,
                ),
                CircleAvatar(
                  backgroundColor: Colors.black12,
                  child: Icon(
                    Icons.person,
                    color: Colors.blueGrey,
                    size: 45,
                  ),
                  radius: 45,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin:
                      new EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Column(
                    // mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          "Como você se sente?",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.face),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Diary(),
                                ),
                              );
                            },
                            color: Colors.blue,
                          ),
                          IconButton(
                            icon: Icon(Icons.face),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Diary(),
                                ),
                              );
                            },
                            color: Colors.purple,
                          ),
                          IconButton(
                            icon: Icon(Icons.face),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Diary(),
                                ),
                              );
                            },
                            color: Colors.grey,
                          ),
                          IconButton(
                            icon: Icon(Icons.face),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Diary(),
                                ),
                              );
                            },
                            color: Colors.green,
                          ),
                          IconButton(
                            icon: Icon(Icons.face),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Diary(),
                                ),
                              );
                            },
                            color: Colors.yellow,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "   Evolução",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              margin: new EdgeInsets.only(
                  left: 20.0, right: 20, top: 5, bottom: 20),
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white,
                      border: Border.all(
                        width: 1,
                        color: Colors.grey[400],
                      ),
                    ),
                    height: 250,
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "   Última entrada",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Divider(
              color: Colors.grey,
              height: 5,
              thickness: 4,
              indent: 20,
              endIndent: 20,
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              margin: new EdgeInsets.only(top: 10, left: 20, right: 20),
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white,
                      border: Border.all(
                        width: 1,
                        color: Colors.grey[400],
                      ),
                    ),
                    height: 250,
                  ),
                ],
              ),
            ),
            Container(
              height: 40,
              alignment: Alignment.center,
              margin: new EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: FlatButton(
                onPressed: () {},
                child: Text("Visualizar mais"),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Radius buildRadius() => Radius.circular(40.0);
}
