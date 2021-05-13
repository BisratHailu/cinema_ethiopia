import 'dart:convert';

import 'package:cinema_ethiopia/cubit/login_cubit.dart';
import 'package:cinema_ethiopia/cubit/login_state.dart';
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
          if (state is LoadingState) {
            return CircularProgressIndicator();
          }
          else if(state is LoadedState){
           return Homee();
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
      var data = {
        'email': 'tito@gmail.com',
        'password': '123titus',
      };
       context.read<LoginCubit>().login(data, '/login');

    },
  );
}

class Homee extends StatefulWidget {
  @override
  _HomeeState createState() => _HomeeState();
}

class _HomeeState extends State<Homee> {
  String name;

  @override
  void initState() {
    _loadUserData();
    super.initState();
  }

  _loadUserData() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = jsonDecode(localStorage.getString('user'));

    if (user != null) {
      print(user);
      setState(() {
        name = user['fname'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test App'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Hi, $name',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Center(
              child: BlocBuilder<LoginCubit, LoginState>(
                builder: (context, state) {
                  return RaisedButton(
                    elevation: 10,
                    onPressed: () {
                      context.read<LoginCubit>().logout();

                    },
                    color: Colors.teal,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Text('Logout'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
