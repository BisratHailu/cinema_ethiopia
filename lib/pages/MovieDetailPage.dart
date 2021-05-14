import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../model/color.dart';
import '../model/lists.dart';

class MovieDetail extends StatelessWidget {
  final String title;
  final String genre;
  final String duration;
  final String poster;
  final String cinema;

  MovieDetail(
      {this.title, this.genre, this.duration, this.poster, this.cinema});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: ethioColor.ethioBlack,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
              backgroundColor: ethioColor.ethioBlack,
              pinned: true,
              title: Text.rich(TextSpan(
                  text: "Ethio",
                  style: TextStyle(color: ethioColor.ethioRed, fontSize: 25),
                  children: [
                    TextSpan(
                      text: ' Cinema',
                      style:
                          TextStyle(color: ethioColor.ethioWhite, fontSize: 25),
                    )
                  ]))),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  height: 300,
                  width: 300,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Image.memory(base64Decode(poster)),
                ),
                Container(
                  alignment: Alignment.center,
                  width: double.maxFinite,
                  child: Text(
                    title,
                    style: TextStyle(
                        fontSize: 30,
                        color: ethioColor.ethioWhite,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        genre,
                        style: TextStyle(
                          fontSize: 18,
                          color: ethioColor.ethioGrey,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        ' , ' + duration,
                        style: TextStyle(
                          fontSize: 18,
                          color: ethioColor.ethioGrey,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        ', @' + cinema,
                        style: TextStyle(
                          fontSize: 18,
                          color: ethioColor.ethioGrey,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    alignment: Alignment.center,
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: RatingBar.builder(
                      initialRating: 3,
                      itemSize: 20,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      maxRating: 10,
                      unratedColor: Colors.amber.shade50,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    )),
                Container(
                  height: 150,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    EthioList.longText,
                    style: TextStyle(color: ethioColor.ethioGrey, fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 7,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(left: 25, bottom: 50, right: 25, top: 10),
        child: ElevatedButton(
          style: ButtonStyle(
            elevation: MaterialStateProperty.all<double>(0.0),
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                EdgeInsets.symmetric(vertical: 12)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
                side: BorderSide(color: ethioColor.ethioRed),
              ),
            ),
            backgroundColor:
                MaterialStateProperty.all<Color>(ethioColor.ethioRed),
            foregroundColor:
                MaterialStateProperty.all<Color>(ethioColor.ethioWhite),
          ),
          onPressed: () {},
          child: Text(
            "Request Ticket",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    ));
  }
}
