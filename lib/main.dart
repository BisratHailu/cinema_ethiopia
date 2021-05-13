import 'package:cinema_ethiopia/cubit/login_cubit.dart';
import 'package:cinema_ethiopia/repository/login_repository.dart';
import 'package:cinema_ethiopia/repository/movie_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import './pages/HomePage.dart';
import 'cubit/movie_cubit.dart';
import 'pages/Login.dart';

void main() => runApp(

    CinemaEthiopia());

class CinemaEthiopia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<MoviesCubit>(
            create: (context) => MoviesCubit(
              repository: MovieRepository(
                Dio(),
              ),
            ),

          ),
          BlocProvider<LoginCubit>(create: (context) => LoginCubit(repository:LoginRepository(Dio())),)
        ],
        child: MaterialApp(
          home: Home(),
          title: 'Cinema Ethiopia',
          theme: ThemeData(fontFamily: 'Baumans'),
        )
    );


  }
}
