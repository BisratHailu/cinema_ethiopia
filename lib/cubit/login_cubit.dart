import 'dart:convert';

import 'package:cinema_ethiopia/repository/login_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState>{
  LoginCubit({this.repository}) : super(InitialState());

  final LoginRepository repository;
 void login(data,apiUrl) async{
   try{
     emit(LoadingState());
    var result= await repository.authData(data, apiUrl);
    print("result $result");
     emit(LoadedState(result));
   }catch(e){
     emit(ErrorState());
   }


}
void logout() async{
  var res = await repository.getData('/logout');
  var body = json.decode(res.data);
  if(body['success']){
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.remove('user');
    localStorage.remove('token');
  }
  print(body);
}

}