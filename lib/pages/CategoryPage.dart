import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../model/color.dart';
import '../model/lists.dart';
import 'MovieDetailPage.dart';

class Category extends StatelessWidget {
  const Category({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: ethioColor.ethioBlack,
          appBar: AppBar(
            backgroundColor: ethioColor.ethioBlack,
            title: Text.rich(TextSpan(
                text: "Ethio",
                style: TextStyle(color: ethioColor.ethioRed, fontSize: 25),
                children: [
                  TextSpan(
                    text: ' Cinema',
                    style:
                        TextStyle(color: ethioColor.ethioWhite, fontSize: 25),
                  )
                ])),

          ),
          body: ListView.builder(
              itemCount: EthioList.movieList.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MovieDetail(
                              title: EthioList.movieList[index]['title'],
                              duration: EthioList.movieList[index]['duration'],
                              genre: EthioList.movieList[index]['genre'],
                              poster: EthioList.movieList[index]['poster'],
                              cinema: EthioList.movieList[index]['cinema'],
                            )));
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Row(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            child: Image.asset(
                              EthioList.movieList[index]['poster'],
                            ),
                          ),
                        ),
                        Expanded(
                            child: Column(
                          children: [
                            ListTile(
                              title: Text(
                                EthioList.movieList[index]['title'],
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 20,
                                    color: ethioColor.ethioWhite,
                                    fontWeight: FontWeight.w500),
                              ),
                              trailing: RatingBarIndicator(
                                rating: 4,
                                itemBuilder: (context, index) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                itemCount: 5,
                                itemSize: 15,
                                direction: Axis.horizontal,
                              ),
                              subtitle: Text(
                                '@' + EthioList.movieList[index]['cinema'],
                                style: TextStyle(
                                  fontSize: 18,
                                  color: ethioColor.ethioGrey,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    EthioList.movieList[index]['genre'],
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: ethioColor.ethioGrey,
                                    ),
                                  ),
                                  Text(
                                    EthioList.movieList[index]['duration'],
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: ethioColor.ethioGrey,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ))
                      ],
                    ),
                  ),
                );
              })),
    );
  }
}
