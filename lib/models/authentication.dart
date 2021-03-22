import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'http_exception.dart';
class Authentication with ChangeNotifier
{


  Future<void> singUp(String email, String password) async
  {
    const url = 'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyDXWy6I2A2OLS4Sxci_V-uCUnUrrcKBNOo';

    try {
      final response = await http.post(url, body: json.encode(
          {
            'email': email,
            'password': password,
            'returnSecureToken': true,
          }
      ));
      final responseData = json.decode(response.body);
      //print(responseData);

      if(responseData['error'] != null){
        throw HttpException(responseData['email']['message']);
      }
    }catch(error) {
      throw error;
    }
    }


    ////////////////////////////// login ////////////////////////////

  Future<void> singIn(String email, String password) async
  {
    const url = 'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyDXWy6I2A2OLS4Sxci_V-uCUnUrrcKBNOo';

    try {
      final response = await http.post(url, body: json.encode(
          {
            'email': email,
            'password': password,
            'returnSecureToken': true,
          }
      ));
      final responseData = json.decode(response.body);
      //print(responseData);

      if(responseData['error'] != null){
        throw HttpException(responseData['email']['message']);
      }
    }catch(error) {
      throw error;
    }
  }
  }
