import 'package:flutter/material.dart';
import 'package:bet_app/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [green, white])),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
                minimum: EdgeInsets.all(10),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                        IconButton(
                            icon: Icon(Icons.notifications_none),
                            onPressed: () {})
                      ]),
                      Image.asset(
                        "assets/hi.gif",
                        height: MediaQuery.of(context).size.width * 0.5,
                      ),
                    ]))));
  }
}
