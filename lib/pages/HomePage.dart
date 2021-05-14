import 'dart:convert';

import 'package:cinema_ethiopia/cubit/login_cubit.dart';
import 'package:cinema_ethiopia/cubit/login_state.dart';
import 'package:cinema_ethiopia/cubit/movie_cubit.dart';
import 'package:cinema_ethiopia/cubit/movie_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/color.dart';
import '../model/lists.dart';
import 'LoginPage.dart';
import 'MovieDetailPage.dart';

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
                    name != null
                        ? BlocBuilder<LoginCubit, LoginState>(
                      builder: (context, state) =>
                          IconButton(
                              icon: Icon(
                                Icons.logout,
                                color: ethioColor.ethioWhite,
                              ),
                              onPressed: () {
                                context.read<LoginCubit>().logout();
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage()));
                              }
                          ),
                    )
                        : IconButton(
                        icon: Icon(
                          Icons.east,
                          color: ethioColor.ethioWhite,
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => LoginPage()));
                        }),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildListView('Popular'),
                  Container(
                    height: 30,
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                              builder: (context) =>
                                  MovieDetail(
                                    title: EthioList.movieList[index]['title'],
                                    duration: EthioList.movieList[index]
                                    ['duration'],
                                    genre: EthioList.movieList[index]['genre'],
                                    poster: EthioList
                                        .movieList[index]['poster'],
                                    cinema: EthioList
                                        .movieList[index]['cinema'],
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
                                      itemBuilder: (context, index) =>
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                      itemCount: 5,
                                      itemSize: 15,
                                      direction: Axis.horizontal,
                                    ),
                                    subtitle: Text(
                                      '@' +
                                          EthioList.movieList[index]['cinema'],
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
        ),
      ),
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
          Expanded(child:
          BlocBuilder<MoviesCubit, MoviesState>(builder: (context, state) {
            if (state is LoadingState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is ErrorState) {
              return Container(
                child: Text('error'),
              );
            } else if (state is LoadedState) {
              final movies = state.movies;
              return ListView.builder(
                  itemCount: movies.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                MovieDetail(
                                  title: movies[index].film_name,
                                  duration: "2",
                                  genre: movies[index].film_description,
                                  poster: movies[index].decoded_image,
                                  cinema: "gast",
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
                                  child: Image.memory(base64Decode(movies[index].decoded_image)),
                                )),
                            SizedBox(
                                height: 50,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      movies[index].film_name,
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
                                          itemBuilder: (context, index) =>
                                              Icon(
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
                  });
            } else {
              return Container();
            }
          }))
        ],
      ),
    );
  }
}
