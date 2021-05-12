import 'package:cinema_ethiopia/model/movie.dart';
import 'package:cinema_ethiopia/utilities/scrollPhysics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/color.dart';
import '../model/lists.dart';
import '../utilities/scrollPhysics.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = ScrollController();

  ScrollPhysics _physics;

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      if (_controller.position.haveDimensions && _physics == null) {
        setState(() {
          var dimension = _controller.position.maxScrollExtent /
              (EthioList.movieList.length - 1);
          _physics = CustomScrollPhysics(itemDimension: dimension);
        });
      }
    });
  }

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
                    IconButton(
                        icon: Icon(
                          Icons.search_outlined,
                          color: ethioColor.ethioWhite,
                        ),
                        onPressed: () {})
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildListView( 'Popular',_physics,_controller),
                  Container(
                    height: 50,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: EthioList.movieCategory.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: EdgeInsets.only(right: 15),
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                  _buildListView('Feature',_physics,_controller)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildListView(
      String subTitle,ScrollPhysics physics,ScrollController controller) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      height: 300,
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
              scrollDirection: Axis.horizontal,
              controller: controller,
              physics: physics,
              itemCount: EthioList.movieList.length,
              itemBuilder: (context, index) => Container(

                  height: double.maxFinite,
                  width: 300,
                  child: Image.asset(EthioList.movieList[index]['poster']),
                  ),
            ),
            // Container(
            //   height: 75,
            //   child: ListTile(
            //     title: Text( EthioList.movieList[index]['poster']),
            //   ),
            // )
          ),
        ],
      ),
    );
  }
}
