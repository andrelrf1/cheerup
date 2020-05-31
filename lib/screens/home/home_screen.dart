import 'package:cheerup/screens/diary/diary_screen.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double _emocao0 = 0;
  double _emocao1 = 0;
  double _emocao2 = 0;
  double _emocao3 = 0;
  double _emocao4 = 0;

  BarChartGroupData makeGroupData(int x, double y1) {
    return BarChartGroupData(barsSpace: 4, x: x, barRods: [
      BarChartRodData(
        y: y1,
        color: Colors.indigoAccent,
        width: 7,
      ),
      // BarChartRodData(
      //   y: y2,
      //   color: Colors.lightBlueAccent,
      //   width: 7,
      // ),
    ]);
  }

  List<BarChartGroupData> rawBarGroups;
  List<BarChartGroupData> showingBarGroups;

  var x = 0;

  @override
  void initState() {
    super.initState();

    final barGroup1 = makeGroupData(0, 0);
    final barGroup2 = makeGroupData(1, 0);
    final barGroup3 = makeGroupData(2, 0);
    final barGroup4 = makeGroupData(3, 0);
    final barGroup5 = makeGroupData(4, 0);

    final items = [
      barGroup1,
      barGroup2,
      barGroup3,
      barGroup4,
      barGroup5,
    ];

    rawBarGroups = items.cast<BarChartGroupData>();

    showingBarGroups = rawBarGroups;
  }

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
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => Diary(),
                              //   ),
                              // );
                              barGrupo1(0);
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
                              barGrupo2(1);
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
                              barGrupo3(2);
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
                              barGrupo4(3);
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
                              barGrupo5(4);
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
                    // child: Card(
                    //   shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(20),
                    //   ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 20,
                      ),
                      child: BarChart(
                        BarChartData(
                          maxY: 20,
                          barTouchData: BarTouchData(
                            touchTooltipData: BarTouchTooltipData(
                              tooltipBgColor: Colors.grey,
                              // getTooltipItem: (_a, _b, _c) => null,
                            ),
                          ),
                          titlesData: FlTitlesData(
                            show: true,
                            bottomTitles: SideTitles(
                              showTitles: true,
                              textStyle: TextStyle(
                                  color: const Color(0xff7589a2),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                              margin: 20,
                              getTitles: (double value) {
                                switch (value.toInt()) {
                                  case 0:
                                    return 'Mn';
                                  case 1:
                                    return 'Te';
                                  case 2:
                                    return 'Wd';
                                  case 3:
                                    return 'Tu';
                                  case 4:
                                    return 'Fr';
                                  case 5:
                                    return 'St';
                                  case 6:
                                    return 'Sn';
                                  default:
                                    return '';
                                }
                              },
                            ),
                            leftTitles: SideTitles(
                              showTitles: true,
                              textStyle: TextStyle(
                                  color: const Color(0xff7589a2),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                              margin: 32,
                              reservedSize: 14,
                              getTitles: (value) {
                                if (value == 0) {
                                  return '1K';
                                } else if (value == 10) {
                                  return '5K';
                                } else if (value == 19) {
                                  return '10K';
                                } else {
                                  return '';
                                }
                              },
                            ),
                          ),
                          borderData: FlBorderData(
                            show: false,
                          ),
                          barGroups: showingBarGroups,
                        ),
                      ),

                      //LineChart(
                      //   LineChartData(
                      //     lineBarsData: <LineChartBarData>[
                      //       LineChartBarData(
                      //         spots: [
                      //           FlSpot(0, 1),
                      //           FlSpot(1, -1.5),
                      //           FlSpot(2, -1.4),
                      //           FlSpot(3, 0.4),
                      //           FlSpot(4, 2),
                      //           FlSpot(5, 2),
                      //           FlSpot(6, 1.8),
                      //         ],
                      //         isCurved: true,
                      //         colors: [
                      //           Colors.redAccent[400],
                      //         ],
                      //         barWidth: 4,
                      //         isStrokeCapRound: true,
                      //         dotData: FlDotData(
                      //           show: false,
                      //         ),
                      //         belowBarData: BarAreaData(
                      //           show: false,
                      //         ),
                      //       ),
                      //     ],
                      //     minX: 0,
                      //     minY: -2,
                      //     maxY: 2,
                      //     axisTitleData: FlAxisTitleData(
                      //       leftTitle: AxisTitle(
                      //         showTitle: true,
                      //         titleText: 'Coisa',
                      //       ),
                      //       bottomTitle: AxisTitle(
                      //         showTitle: true,
                      //         titleText: 'Bala',
                      //       ),
                      //     ),
                      //   ),
                      // ),
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
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              margin: new EdgeInsets.only(top: 10, left: 20, right: 20),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    margin:
                        new EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    child: FlatButton(
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      // child: Image.network(
                      //   'https://technotec.com.br/wp-content/uploads/2018/04/goo_gl-56a4010c3df78cf7728052e9.jpg',
                      // ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Radius buildRadius() => Radius.circular(40.0);

  barGrupo1(int x) {
    _emocao0 = _emocao0 + 1;
    return makeGroupData(0, _emocao0);
  }

  barGrupo2(int x) {
    return _emocao1 + 1;
  }

  barGrupo3(int x) {
    return _emocao2 + 1;
  }

  barGrupo4(int x) {
    return _emocao3 + 1;
  }

  barGrupo5(int x) {
    return _emocao4 + 1;
  }
}
