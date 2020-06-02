import 'package:flutter/material.dart';
import '../../diary/diary_screen.dart';
import '../../utils/alert.dart';

class Options extends StatefulWidget {
  @override
  _OptionsState createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  void _goToDiary() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Diary(),
      ),
    );
  }

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
              'Opções',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
          ),
        ),
        Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              ListTile(
                title: Text(
                  'Diário',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                onTap: () {
                  _goToDiary();
                },
              ),
              Divider(
                height: 0,
                endIndent: 10,
                indent: 10,
              ),
              ListTile(
                title: Text(
                  'Personalidade',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Alert(
                        context: context,
                        titulo: 'Teste',
                        mensagem: 'Teste',
                        buttonText: 'Teste',
                      );
                    },
                  );
                },
              )
            ],
          ),
        )
      ],
    );
  }
}
