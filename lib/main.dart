import 'package:flutter/material.dart';
import 'screens/splash/splash_screen.dart';
import 'screens/login/login_screen.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.black,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CheerUP',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: SplashScreen(),
      routes: <String, WidgetBuilder>{'/LogIn': (context) => LogIn()},
    );
  }
}
