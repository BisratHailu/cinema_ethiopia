import 'dart:convert';

import 'package:cinema_ethiopia/model/UserModel.dart';
import 'package:cinema_ethiopia/repository/login_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState>{
  LoginCubit({this.repository}) : super(InitialState());

  final LoginRepository repository;
 void login(UserModel data,apiUrl) async{
   try{
     emit(LoggingInState());
    var result= await repository.authData(data.toJson(), apiUrl);
    print('emitted');
     emit(LoggedInState(result));
   }catch(e){
     emit(LogErrorState());
   }


}
void logout() async{
   try{
     emit(LoggingInState());
     var result= await repository.logout();
     emit(LogOutState());
   }catch(e){

   }
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