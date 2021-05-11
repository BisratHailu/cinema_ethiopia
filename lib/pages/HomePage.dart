import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/color.dart';
import '../model/lists.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ethioColor.ethioBlack,
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
                        IconButton(
                            icon: Icon(
                              Icons.search_outlined,
                              color: ethioColor.ethioWhite,
                            ),
                            onPressed: () {})
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Text(
                      "Coming Soon",
                      style:
                          TextStyle(color: ethioColor.ethioWhite, fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Container(
                      height: 250,
                      width: double.maxFinite,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: Image.asset(
                          'assets/images/poster.jpeg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: ethioList.movieCategory.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: EdgeInsets.only(right: 15),
                          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                          child: Text(
                            ethioList.movieCategory[index],
                            style: TextStyle(
                                color: ethioColor.ethioWhite, fontSize: 16),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                              border: Border.all(
                                  color: ethioColor.ethioRed, width: 0.5)),
                        );
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    height: 300,
                    child: Column(
                      children: [
                        Text("Popular",
                        style: TextStyle(color: ethioColor.ethioWhite,fontSize: 18),)
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
