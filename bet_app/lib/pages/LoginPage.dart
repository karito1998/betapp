import 'dart:html';
import 'dart:io';

import 'package:bet_app/pages/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:bet_app/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bet_app/repository/LoginProcess.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final _scaffKey = GlobalKey<ScaffoldState>();
  late TextEditingController emailTextController;
  late TextEditingController passTextController;
  late FocusNode emailFocus;
  late FocusNode passFocus;

  @override
  void initState() {
    super.initState();
    emailTextController = TextEditingController();
    passTextController = TextEditingController();
    emailFocus = FocusNode();
    passFocus = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [purple, white])),
        child: Scaffold(
            key: _scaffKey,
            resizeToAvoidBottomInset: true,
            backgroundColor: Colors.transparent,
            body: SafeArea(
                minimum: EdgeInsets.all(10),
                child: GestureDetector(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                    },
                    child: //ListView(children: [
                        SingleChildScrollView(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                          //Campana
                          Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                    icon: Icon(Icons.notifications_none),
                                    onPressed: () {})
                              ]),

                          //Imagen
                          //Image.asset("assets/betLogo.png"),
                          SvgPicture.asset(
                            "assets/betLogoIcon.svg",
                            height: MediaQuery.of(context).size.width * 0.5,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: white.withOpacity(0.7)),
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 5,
                                  ),
                                  TextFormField(
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: purple,
                                    ),
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      labelText: "Usuario",
                                      labelStyle: TextStyle(
                                          color: passFocus.hasFocus
                                              ? purple
                                              : purple),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: purple)),
                                      disabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: purple)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: purple)),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(color: purple),
                                      ),
                                      fillColor: white,
                                      filled: true,
                                      isDense: true,
                                      contentPadding: EdgeInsets.all(15),
                                    ),
                                    cursorColor: purple,
                                    controller: emailTextController,
                                    focusNode: emailFocus,
                                    onEditingComplete: () {
                                      requestFocus(context, passFocus);
                                    },
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  TextField(
                                    obscureText: true,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: purple,
                                    ),
                                    decoration: InputDecoration(
                                      labelText: "Contraseña",
                                      labelStyle: TextStyle(
                                          color: passFocus.hasFocus
                                              ? purple
                                              : purple),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(color: purple),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(color: purple),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(color: purple),
                                      ),
                                      fillColor: white,
                                      filled: true,
                                      isDense: true,
                                      // Added this
                                      contentPadding:
                                          EdgeInsets.all(15), // Added this
                                    ),
                                    cursorColor: purple,
                                    controller: passTextController,
                                    focusNode: passFocus,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                          child: SizedBox(
                                        width: 10,
                                      )),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            primary: purple),
                                        onPressed: () {
                                          LoginProcess(emailTextController.text,
                                                  passTextController.text)
                                              .then((loginData) {
                                            if (loginData.loginAuth) {
                                              _goToHomePage(context);
                                            } else {
                                              _showMessageError(context);
                                            }
                                          });
                                        },
                                        child: Padding(
                                            padding: EdgeInsets.all(5),
                                            child: Text(
                                              "Ingresar",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15),
                                            )),
                                      ),
                                    ],
                                  ),
                                ]),
                          ),

                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            "Bienvenido a WETTE ¡Apuesta y gana!",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: purple),
                          ),
                          //Texto
                        ]))))));
  }

  void _showMessageError(BuildContext context) {
    SnackBar snackbar = SnackBar(
      backgroundColor: purple,
      content: Text("Datos incorrectos"),
    );
    // ignore: deprecated_member_use
    _scaffKey.currentState!.showSnackBar(snackbar);
  }
}

void requestFocus(BuildContext context, FocusNode focusNode) {
  FocusScope.of(context).requestFocus(focusNode);
}

void _goToHomePage(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => HomePage()));
}
