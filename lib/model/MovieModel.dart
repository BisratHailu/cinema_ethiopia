import 'package:flutter/material.dart';

class MovieModel {
  int id;
  int user_id;
  String film_name;
  String film_duration;
  String film_description;
  int filmcategory_id;
  String decoded_image;

  MovieModel(
      {this.id,
      this.user_id,
      this.film_name,
      this.film_duration,
      this.film_description,
      this.filmcategory_id,
      this.decoded_image});
}
