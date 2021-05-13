import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/color.dart';
import 'Tab.dart';

class Home extends StatelessWidget {
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
                  labelStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),
                  unselectedLabelStyle:TextStyle(fontSize: 14,),
                ),
                title: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Ethio ",
                            style: TextStyle(
                                color: ethioColor.ethioRed, fontSize: 25),
                          ),
                          Text(
                            "Cinema",
                            style: TextStyle(
                                color: ethioColor.ethioWhite, fontSize: 25),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                actions: [
                  IconButton(
                      icon: Icon(
                        Icons.search_outlined,
                        color: ethioColor.ethioWhite,
                      ),
                      onPressed: () {})
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
