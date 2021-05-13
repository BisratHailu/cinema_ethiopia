import 'package:cinema_ethiopia/model/MovieModel.dart';
import 'package:dio/dio.dart';


class MovieRepository {
  const MovieRepository(this.client);

  final Dio client;

  Future<List<MovieModel>> getMovies() async {
    try {
      final url =
          'http://192.168.1.7/Laravel/Laravel API/public/api/films';

      final response = await client.get(url);
      // print(response.data);
      final movies = List<MovieModel>.of(
        response.data.map<MovieModel>(
              (json){
                print('json is $json');
                return  MovieModel(
                  id: json['id'],
                  film_name: json['film_name'],
                  decoded_image: json['decoded_image'],
                  film_description: json['film_description']
                );
              }
        ),
      );

      return movies;
    } catch (e) {
      throw e;
    }
  }
}