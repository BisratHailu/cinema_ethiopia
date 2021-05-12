import 'package:cinema_ethiopia/pages/HomePage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './pages/HomePage.dart';
import 'cubit/movie_cubit.dart';
import 'repository/movie_repository.dart';

void main() => runApp(CinemaEthiopia());

class CinemaEthiopia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Cinema Ethiopia',
        theme: ThemeData(fontFamily: 'Baumans'),
        home: BlocProvider<MoviesCubit>(
          create: (context) => MoviesCubit(
            repository: MovieRepository(
              Dio(),
            ),
          ),
         child: HomePage(),
        ),

    );
  }
}
