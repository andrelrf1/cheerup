import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class Emotion {
  final String year;
  final int clicks;
  final charts.Color color;

  Emotion(this.year, this.clicks, Color color)
      : this.color = charts.Color(
            r: color.red, g: color.green, b: color.blue, a: color.alpha);
}

class _HomeState extends State<Home> {
  int _emocao0 = 1;
  int _emocao1 = 2;
  int _emocao2 = 3;
  int _emocao3 = 4;
  int _emocao4 = 5;

  void barGrupo1() {
    setState(() {
      _emocao0++;
    });
  }

  void barGrupo2() {
    setState(() {
      _emocao1++;
    });
  }

  void barGrupo3() {
    setState(() {
      _emocao2++;
    });
  }

  void barGrupo4() {
    setState(() {
      _emocao3++;
    });
  }

  void barGrupo5() {
    setState(() {
      _emocao4++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var data = [
      Emotion('Mazelado', _emocao0, Colors.blue),
      Emotion('Bad', _emocao1, Colors.purple),
      Emotion('Suavi', _emocao2, Colors.grey),
      Emotion('Massa', _emocao3, Colors.green),
      Emotion('Transando', _emocao4, Colors.yellow),
    ];

    var series = [
      charts.Series(
        domainFn: (Emotion clickData, _) => clickData.year,
        measureFn: (Emotion clickData, _) => clickData.clicks,
        colorFn: (Emotion clickData, _) => clickData.color,
        id: 'Emotion',
        data: data,
      ),
    ];

    var chart = charts.BarChart(
      series,
      animate: true,
    );

    var chartWidget = Padding(
      padding: EdgeInsets.all(32.0),
      child: SizedBox(
        height: 200.0,
        child: chart,
      ),
    );

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
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => Diary(),
                              //   ),
                              // );
                              barGrupo1();
                              print(_emocao0);
                            },
                            color: Colors.blue,
                          ),
                          IconButton(
                            icon: Icon(Icons.face),
                            onPressed: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => Diary(),
                              //   ),
                              // );
                              barGrupo2();
                            },
                            color: Colors.purple,
                          ),
                          IconButton(
                            icon: Icon(Icons.face),
                            onPressed: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => Diary(),
                              //   ),
                              // );
                              barGrupo3();
                            },
                            color: Colors.grey,
                          ),
                          IconButton(
                            icon: Icon(Icons.face),
                            onPressed: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => Diary(),
                              //   ),
                              // );
                              barGrupo4();
                            },
                            color: Colors.green,
                          ),
                          IconButton(
                            icon: Icon(Icons.face),
                            onPressed: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => Diary(),
                              //   ),
                              // );
                              barGrupo5();
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
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 20,
                      ),
                      child: chartWidget,
                    ),
                    // ),
                  ),
                  const SizedBox(
                    height: 12,
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
                    height: 22,
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
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "   Recomendações",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Card(
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(10),
            //   ),
            //   margin: new EdgeInsets.only(top: 10, left: 20, right: 20),
            //   child: ListView(
            //     scrollDirection: Axis.horizontal,
            //     children: <Widget>[
            //       Container(
            //         alignment: Alignment.center,
            //         margin:
            //             new EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            //         child: FlatButton(
            //           onPressed: () {},
            //           shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(18.0),
            //           ),
            //           child: null,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Radius buildRadius() => Radius.circular(40.0);
}
