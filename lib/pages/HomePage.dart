import 'dart:convert';

import 'package:cinema_ethiopia/cubit/movie_cubit.dart';
import 'package:cinema_ethiopia/cubit/movie_state.dart';
import 'package:cinema_ethiopia/utilities/scrollPhysics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/color.dart';
import '../model/lists.dart';
import '../utilities/scrollPhysics.dart';
import 'movie_detail.dart';

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
              (EthioList.popularList.length - 1);
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
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Text(
                      "Coming Soon",
                      style: TextStyle(
                          color: ethioColor.ethioWhite,
                          fontWeight: FontWeight.w600),
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
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    height: 300,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            "Popular",
                            style: TextStyle(
                                color: ethioColor.ethioWhite,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Expanded(
                          child: BlocBuilder<MoviesCubit, MoviesState>(
                            builder: (context, state) {
                              if (state is LoadingState) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else if (state is ErrorState) {
                                return Center(
                                  child: Icon(Icons.close),
                                );
                              } else if (state is LoadedState) {
                                final movies = state.movies;

                                return ListView.builder(
                                  itemCount: movies.length,
                                  itemBuilder: (context, index) => Card(
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    MovieDetail(
                                                        movies[index])));
                                      },
                                      child: ListTile(
                                        title: Text(movies[index].film_name),
                                        leading: CircleAvatar(
                                          backgroundImage: MemoryImage(
                                              base64Decode(
                                                  movies[index].decoded_image)),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              } else {
                                return Container();
                              }
                            },
                          ),
                        ),
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
