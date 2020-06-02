import 'package:cheerup/models/user.dart';
import 'package:flutter/material.dart';
import 'screens/splash/splash_screen.dart';
import 'screens/login/login_screen.dart';
import 'screens/signin/signin_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<UserData>(
      create: (user) => UserData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CheerUP',
        theme: ThemeData(
          primarySwatch: Colors.cyan,
        ),
        home: SplashScreen(),
        routes: <String, WidgetBuilder>{
          '/LogIn': (context) => LogIn(),
          '/SignIn': (context) => SignIn()
        },
      ),
    );
  }
}
