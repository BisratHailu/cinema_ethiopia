import 'dart:convert';

import 'package:cinema_ethiopia/cubit/login_cubit.dart';
import 'package:cinema_ethiopia/cubit/login_state.dart';
import 'package:cinema_ethiopia/model/UserModel.dart';
import 'package:cinema_ethiopia/pages/HomePage.dart';
import 'package:cinema_ethiopia/repository/login_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          if (state is LoggingInState) {
            return CircularProgressIndicator();
          }
          else if(state is LoggedInState){

           return HomePage();
          }else {

            return LoginForm(context);
          }
        },
      ),
    );
  }
}

Widget LoginForm(BuildContext context) {
  return RaisedButton(
    child: Text('Login'),
    onPressed: () async {
      print("hello");
      var user = UserModel(email: 'tito@gmail.com',password: '123titus');
       context.read<LoginCubit>().login(user, '/login');

    },
  );
}
