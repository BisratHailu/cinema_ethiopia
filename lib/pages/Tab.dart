import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../model/color.dart';
import '../model/lists.dart';
import 'MovieDetailPage.dart';

class HomeTab extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildListView('Popular'),
              Container(
                height: 30,
                margin:
                EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: EthioList.movieCategory.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.only(right: 15),
                      padding: EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Text(
                        EthioList.movieCategory[index],
                        style: TextStyle(
                            color: ethioColor.ethioWhite, fontSize: 16),
                      ),
                      decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.all(Radius.circular(20)),
                          border: Border.all(
                              color: ethioColor.ethioRed, width: 0.5)),
                    );
                  },
                ),
              ),
              _buildListView('Feature'),
            ],
          ),
        ),

        SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          sliver: SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 3,
            ),
            delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MovieDetail(
                            title: EthioList.movieList[index]['title'],
                            duration: EthioList.movieList[index]
                            ['duration'],
                            genre: EthioList.movieList[index]['genre'],
                            poster: EthioList.movieList[index]
                            ['poster'],
                            cinema: EthioList.movieList[index]
                            ['cinema'],
                          )));
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          Container(
                            width: 100,
                            child: ClipRRect(
                              borderRadius:
                              BorderRadius.all(Radius.circular(20)),
                              child: Image.asset(
                                  EthioList.movieList[index]['poster']),
                            ),
                          ),
                          Expanded(
                              child: ListTile(
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
                              ))
                        ],
                      ),
                    ),
                  );
                }, childCount: EthioList.movieList.length),
          ),
        )
      ],

    );
  }

  Widget _buildListView(String subTitle) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      height: 350,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              subTitle,
              style: TextStyle(
                  color: ethioColor.ethioWhite,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: EthioList.movieList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => MovieDetail(
                              title: EthioList.movieList[index]['title'],
                              duration: EthioList.movieList[index]
                              ['duration'],
                              genre: EthioList.movieList[index]['genre'],
                              poster: EthioList.movieList[index]['poster'],
                              cinema: EthioList.movieList[index]['cinema'],
                            )));
                      },
                      child: Container(
                          width: 200,
                          margin: EdgeInsets.symmetric(
                            horizontal: 15,
                          ),
                          child: Column(children: [
                            Expanded(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Image.asset(
                                      EthioList.movieList[index]['poster']),
                                )),
                            SizedBox(
                                height: 50,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      EthioList.movieList[index]['title'],
                                      style: TextStyle(
                                          color: ethioColor.ethioWhite,
                                          fontSize: 18),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '@' +
                                              EthioList.movieList[index]
                                              ['cinema'],
                                          style: TextStyle(
                                            color: ethioColor.ethioGrey,
                                          ),
                                        ),
                                        RatingBarIndicator(
                                          rating: 4,
                                          itemBuilder: (context, index) => Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          itemCount: 5,
                                          itemSize: 15,
                                          direction: Axis.horizontal,
                                        )
                                      ],
                                    ),
                                  ],
                                ))
                          ])),
                    );
                  }))
        ],
      ),
    );
  }
}
