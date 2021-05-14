import 'dart:convert';
import 'dart:io';
import 'package:cinema_ethiopia/model/UserModel.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
class LoginRepository extends ChangeNotifier{
  final Dio client;

  LoginRepository(this.client);
  bool isLoading =false;


  final String _url = 'http://10.0.2.2:8000/api';
  //if you are using android studio emulator, change localhost to 10.0.2.2
  var token;

  _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = jsonDecode(localStorage.getString('token'))['token'];

  }

  authData( data, apiUrl) async {

  print("token $token");
    var fullUrl = _url + apiUrl;
   // client.options.headers["Authorization"] = "Bearer ${token}";
    try {
      var result = await client.post(
          fullUrl,
          data: data
      );
     var res = json.decode(result.data);
      if(res['success'] !=null ){
      print(res['success']['token']);
        SharedPreferences localStorage = await SharedPreferences.getInstance();
        localStorage.setString('token', res['success']['token']);
        localStorage.setString('user',  res['success']['user']);

      }
      return result;
    }catch(e){
      print(e);
    }

  }

  getData(apiUrl) async {
    var fullUrl = _url + apiUrl;
    await _getToken();
    // client.options.headers["Authorization"] = "Bearer ${token}";
    // return await client.get(
    //     fullUrl,
    // );
  }

   logout() async{
     SharedPreferences localStorage = await SharedPreferences.getInstance();

    if(localStorage!=null){

      localStorage.remove('user');
      localStorage.remove('token');
    }

  }

}