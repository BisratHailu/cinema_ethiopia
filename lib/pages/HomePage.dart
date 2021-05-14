import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/color.dart';
import 'Tab.dart';
import 'Login.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name;

  void initState() {
    _loadUserData();
    super.initState();
  }

  _loadUserData() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = localStorage.getString('user');

    print("user is $user");
    if (user != null) {
      print(user);
      setState(() {
        name = user;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
          length: 3,
          child: Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: ethioColor.ethioBlack,
                bottom: TabBar(
                  tabs: [
                    Tab(
                      text: "Edna Mall",
                    ),
                    Tab(
                      text: "Gast Cinema",
                    ),
                    Tab(
                      text: "Alem Cinema",
                    )
                  ],
                  indicatorColor: ethioColor.ethioRed,
                  labelColor: ethioColor.ethioRed,
                  unselectedLabelColor: ethioColor.ethioWhite,
                  labelStyle:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  unselectedLabelStyle: TextStyle(
                    fontSize: 14,
                  ),
                ),
                title: Text.rich(TextSpan(
                    text: "Ethio",
                    style: TextStyle(color: ethioColor.ethioRed, fontSize: 25),
                    children: [
                      TextSpan(
                        text: ' Cinema',
                        style: TextStyle(
                            color: ethioColor.ethioWhite, fontSize: 25),
                      )
                    ])),
                actions: [
                  name != null
                      ? Text(name)
                      : IconButton(
                          icon: Icon(
                            Icons.east,
                            color: ethioColor.ethioWhite,
                          ),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Login()));
                          }),
                ],
              ),
              backgroundColor: ethioColor.ethioBlack,
              body: TabBarView(
                children: [
                  HomeTab(),
                  HomeTab(),
                  HomeTab(),
                ],
              ))),
    );
  }
}
