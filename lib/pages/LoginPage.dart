import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../model/color.dart';
import 'HomePage.dart';

class Login extends StatelessWidget {
  const Login({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/images/cinema.jpg',
                ),
                fit: BoxFit.fitWidth)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 5.0),
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.only(top: 50),
                width: double.maxFinite,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Ethio ",
                      style:
                          TextStyle(color: ethioColor.ethioRed, fontSize: 35),
                    ),
                    Text(
                      "Cinema",
                      style:
                          TextStyle(color: ethioColor.ethioWhite, fontSize: 35),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 25),
                width: 150,
                height: 150,
                child: Image.asset("assets/images/logo.png"),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                decoration: BoxDecoration(
                    color: ethioColor.ethioWhite,
                    borderRadius: BorderRadius.circular(25)),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "E-mail",
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding:
                        EdgeInsets.only(bottom: 11, top: 11, right: 15),
                    icon: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Icon(
                        Icons.email,
                        color: ethioColor.ethioRed,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                decoration: BoxDecoration(
                    color: ethioColor.ethioWhite,
                    borderRadius: BorderRadius.circular(25)),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Password",
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding:
                        EdgeInsets.only(bottom: 11, top: 11, right: 15),
                    icon: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Icon(
                        Icons.confirmation_number,
                        color: ethioColor.ethioRed,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 25, vertical: 50),
                child: ElevatedButton(

                  style: ButtonStyle(

                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        EdgeInsets.symmetric(vertical: 10)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: ethioColor.ethioRed),
                      ),
                    ),
                    backgroundColor:
                    MaterialStateProperty.all<Color>(ethioColor.ethioRed),
                    foregroundColor:
                    MaterialStateProperty.all<Color>(ethioColor.ethioWhite),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>Home()));
                  },
                  child: Text(
                    "Login",
                    style: TextStyle( fontSize: 20),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
