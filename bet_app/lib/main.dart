import 'package:flutter/material.dart';
import 'package:bet_app/pages/LoginPage.dart';
import 'package:bet_app/pages/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bet APP',
      initialRoute: "/",
      routes: {
        "/": (BuildContext context) {
          return LoginPage();
        }
      },
    );
  }
}
