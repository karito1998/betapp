import 'dart:io';

import 'package:flutter/material.dart';
import 'package:bet_app/colors.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
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
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            body: SafeArea(
                minimum: EdgeInsets.all(10),
                child: GestureDetector(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                    },
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
                          Image.asset("betLogo.png"),
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
                                      color: darkGreen,
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
                                      color: darkGreen,
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
                                        onPressed: () {},
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
                        ])))));
  }
}

void requestFocus(BuildContext context, FocusNode focusNode) {
  FocusScope.of(context).requestFocus(focusNode);
}
