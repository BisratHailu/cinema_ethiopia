import 'package:cinema_ethiopia/model/MovieModel.dart';
import 'package:flutter/material.dart';

class MovieDetail extends StatelessWidget {
  MovieModel model;
  MovieDetail(this.model);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Text(model.film_name),
          Text(model.film_description)
        ],
      ),
    );
  }
}
