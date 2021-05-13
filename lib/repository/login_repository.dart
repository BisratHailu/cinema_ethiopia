import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginRepository extends ChangeNotifier{
  final Dio client;

  LoginRepository(this.client);
  bool isLoading =false;


  final String _url = 'http://192.168.1.7/Laravel/Laravel API/public/api';
  //if you are using android studio emulator, change localhost to 10.0.2.2
  var token;

  _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = jsonDecode(localStorage.getString('token'))['token'];
    print("token $token");
  }

  authData(data, apiUrl) async {

print("token $token");
    var fullUrl = _url + apiUrl;
   client.options.headers["Authorization"] = "Bearer ${token}";
    try {
      var result = await client.post(
          fullUrl,
          data: jsonEncode(data)
      );
      if(result.data['success'] !=null ){

        SharedPreferences localStorage = await SharedPreferences.getInstance();
        localStorage.setString('token', json.encode(result.data['success']['token']));
        localStorage.setString('user', json.encode(result.data['success']['user']));

        return result;
      }

    }catch(e){
      print(e);
    }

  }

  getData(apiUrl) async {
    var fullUrl = _url + apiUrl;
    await _getToken();
    client.options.headers["Authorization"] = "Bearer ${token}";
    return await client.get(
        fullUrl,
    );
  }



}